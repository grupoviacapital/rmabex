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
