# Como Trabalhamos - O Loop Spec-Driven

> Referência viva do processo. Decisão em [[adr-002-spec-driven-obsidian]]. Convenções de código em [[convencoes-codigo]].

## Princípio

**Nenhum código sem spec aprovada.** Toda mudança nasce em `vault/10-specs/NNN-slug/` e percorre 5 estágios. As specs são a **memória externa** do projeto: cada estágio roda como subagente com contexto isolado, então o loop principal carrega só a spec da vez - não o projeto inteiro. É isso que mantém o consumo de tokens baixo.

## O loop

| # | Comando | Agente | Entrada → Saída |
|---|---------|--------|-----------------|
| 1 | `/spec <ideia>` | [[../90-meta/como-trabalhamos#spec-writer\|spec-writer]] | ideia + domínio → `requirements.md` (EARS) |
| 2 | `/plan <spec>` | spec-designer | requirements + domínio → `design.md` |
| 3 | `/tasks <spec>` | task-planner | design → `tasks.md` (checklist rastreável) |
| 4 | `/implement <spec>` | implementer | tasks → código + testes (TDD) |
| 5 | `/verify <spec>` | spec-reviewer | código vs requirements → relatório |

Entre cada estágio, **você (humano) revisa e aprova** o artefato no Obsidian. O loop não avança sozinho de requirements até código sem checkpoint.

## Os três blocos do `tasks.md` e a parada para teste manual

O estágio 3 não entrega uma lista corrida de tarefas: entrega **três blocos**, com um marco de parada
escrito no meio do arquivo.

| Bloco | O que entra | Quem executa |
|---|---|---|
| **1 Núcleo** | o que faz a feature existir (migração, regra de domínio, endpoint, tela), **com o teste da própria tarefa dentro** (TDD) | `/implement`, que **para no marco** |
| ⏸ **PARADA** | o usuário testa a feature na tela e aponta o que estiver errado | o humano. **A sessão termina aqui** |
| **2 Correções** | só o que o usuário apontou no teste (vazio no planejamento) | sessão nova, retomando pelo disco |
| **3 Fechamento** | prova de runtime ponta a ponta, `/verify`, gate de segurança, ADR e registro no vault | depois do "está certo" dele |

O marco fica escrito no próprio `tasks.md`, entre os blocos 1 e 2:

```markdown
---

## ⏸ PARADA - teste manual do usuário

O usuário testa a feature na tela e aponta o que estiver errado. A sessão termina aqui: as
correções entram em **sessão nova**, que retoma lendo este `tasks.md` e o estado no disco.

---
```

Consequências, que valem para os três arquivos do harness:

- o **task-planner** emite os três blocos e, no retorno, diz quantas tarefas há em cada um e **o que
  exatamente o usuário vai testar na parada** (tela, ação, resultado esperado);
- o **`/implement` para no marco**, mesmo no modo "implemente tudo": mostra o diff, diz o que testar
  e avisa que a sessão deve terminar ali;
- o **`/verify` recusa rodar antes do teste manual**. É pré-condição explícita, não recomendação.

Por que, com os números da medição de 2026-09-20 (projeto `sgcbex`, arco de quatro specs):

- a parada é o ponto natural de **encerrar a sessão**, e 97,5% do gasto do arco foi releitura de
  contexto;
- o `/verify` custou 7,9% e devolveu 19 correções e 3 bloqueantes. Rodado antes do teste manual, o
  código muda depois e ele é refeito: 7,9% pagos duas vezes.

⛔ **O teste unitário da tarefa não vai para o bloco 3.** Ele nasce dentro da própria tarefa, porque
é ele que protege o teste manual do usuário: filtrado, custa cerca de 50 tokens e poucos segundos, e
mandar o usuário testar na tela um cálculo que o teste reprovaria gasta o tempo dele, que é o caro.

## Paralelização (sempre que houver fila de specs)

**Regra: quando há uma sequência de specs pela frente, paralelize o PLANEJAMENTO, mantenha a IMPLEMENTAÇÃO sequencial.** Isso é padrão, não exceção - aplicar toda vez que o ROADMAP tiver mais de uma spec na fila.

1. **Leia o grafo de dependência do [[ROADMAP]] primeiro.** Só entram no fan-out as specs cujos *requirements* não dependem de decisão ainda não tomada numa spec anterior. Ex.: se 004 e 006 dependem só da 003 (já mergeada), ambas podem ter requirements escritos em paralelo; 005, que depende do 004, não.
2. **Fan-out da fase de docs:** dispare vários `spec-writer` (e depois vários `spec-designer`) em paralelo, um por spec elegível. Requirements e design são só texto - não tocam código, não geram conflito de merge.
3. **Decisões em lote:** junte as "perguntas em aberto" de todas as specs e apresente numa tacada só. Isso é o ganho real - você decide o rumo de N specs de uma vez, em vez de um checkpoint por spec.
4. **Design depois das decisões:** o `spec-designer` de cada spec só roda depois que as perguntas em aberto daquela spec foram respondidas (o design ruim nasce de requirements ambíguos).
5. **Implementação continua sequencial.** Três motivos: (a) specs "independentes" no domínio brigam pelos mesmos arquivos (`schema.prisma`, `page.tsx`, `actions.ts`, `seed`, `status.ts`) → conflito de merge; (b) cadeias reais (005 usa o que 004 cria; 007 desenha o que 006 define); (c) decisões em cascata - uma spec autônoma herda a premissa errada da anterior. Exceção: specs de arquivos **disjuntos** (ex.: tema/design tokens) podem ser implementadas em paralelo, idealmente em git worktree isolado.

Resumo: **planejar em largura, implementar em profundidade.**

## Papéis dos agentes

- **spec-writer** - traduz uma ideia em requisitos verificáveis (formato EARS: "QUANDO … O SISTEMA DEVE …"). Não decide arquitetura. Lê [[glossario]] e [[regras-negocio]].
- **spec-designer** - desenha a solução: contratos (Prisma/Zod), componentes, fluxos. Referencia [[modelo-dados]]. Não escreve código de produção.
- **task-planner** - quebra o design em tarefas pequenas, ordenadas, cada uma rastreável a um requisito e verificável por teste.
- **implementer** - executa **uma** tarefa por vez, TDD (teste falha → código → teste passa), marca `[x]` em `tasks.md`.
- **spec-reviewer** - cético por padrão: procura onde o código **diverge** da spec, roda testes/lint, reporta gaps. Read-only + Bash.

## Rastreabilidade

Cada item de `tasks.md` cita o requisito que satisfaz (`req R-3` / `RN-5`). O `spec-reviewer` usa isso para achar requisitos sem cobertura. Um requisito sem task, ou uma task sem teste, é um gap a reportar - não a ignorar.

## Economia de token (por que este processo)

- Specs como memória externa → contexto por tarefa mínimo.
- Busca ampla → **Explore agent** (não polui o contexto principal).
- Review pesado → **spec-reviewer** (isolado).
- Instruções detalhadas → **skills** carregam sob demanda.
- `CLAUDE.md` curto → aponta pro vault em vez de repetir regras.

### O custo deste loop, medido em 2026-09-20

Um arco de quatro specs seguidas foi medido de ponta a ponta no projeto `sgcbex`: **462,8M de tokens,
US$ 316 a preço de lista, 8,2 h ativas**. O que saiu de lá vale aqui também, porque é sobre o
processo, não sobre a stack. São seis pontos, e três deles são sobre o que **não** cortar:

1. **Sessão nova a cada spec** (ou `/compact` no meio dela). **97,5% do gasto é releitura de
   contexto**: a sessão foi de 66k para 731k em três dias, e os mesmos 127 turnos que custaram 55M a
   548k custariam cerca de **13M a 130k**. É a economia de maior efeito e **não tira proteção
   nenhuma**, porque a verdade do progresso está no disco (ROADMAP, spec e `tasks.md`).
2. **Design curto quando o módulo já é conhecido**: contratos, migração e fronteira de arquivos, e só.
   O design foi **8%** do arco e repetia o que o `tasks.md` dizia de novo. Onde a decisão é cara de
   reverter, a análise de alternativas continua obrigatória.
3. **Não cortar requisitos nem tasks**: juntos são **6,6%** do arco. Cortar economiza quase nada e
   tira justamente o que amarra código a requisito.
4. **Manter o `/verify`**: **7,9%** do arco, e devolveu **19 correções e 3 bloqueantes**, entre elas
   uma regressão que a própria correção anterior havia criado. É o melhor troco entre custo e defeito
   pego.
5. **A régua do que vai direto e do que vai por spec**: mudança de **um ou dois arquivos, sem banco e
   sem regra de domínio**, vai direto e custou de **5M a 22M de tokens** por correção; mudança que
   toca **cálculo, banco ou regra de domínio** vai por spec e custou de **106M a 124M** por spec.
6. **Parar para o teste manual antes de fechar a spec**: é o que dá lugar certo aos pontos 1 e 4,
   porque marca onde a sessão termina e onde o `/verify` entra. Detalhe na seção "Os três blocos do
   `tasks.md`", acima.

Sobre teste, a mesma medição mostrou que **o runner não gasta token de IA; a saída dele, sim**: ver
[[qualidade-e-ci]].

