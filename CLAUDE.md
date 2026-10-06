# RMABEx

Projeto RMA BEx.
Stack: **Next.js (App Router) + TypeScript estrito + Prisma + SQLite + Zod + Vitest + Playwright** (ver `vault/20-decisions/adr-001-stack.md`).

## Regra de ouro

**Nenhum código sem spec aprovada.** Toda mudança nasce de uma spec em `vault/10-specs/NNN-slug/` e percorre o loop `requirements -> design -> tasks -> implement -> verify`. O processo está em `vault/90-meta/como-trabalhamos.md`.

**A régua do que vai direto** (medida em 2026-09-20 num arco de quatro specs): mudança de **um ou dois arquivos, sem banco e sem regra de domínio**, vai direto; mudança que toca **cálculo, banco ou regra de domínio** vai por spec. Entre os dois caminhos a medição deu uma ordem de grandeza de diferença em tokens (5M a 22M contra 106M a 124M), então a fronteira se decide por número, não por gosto. Detalhe em `vault/90-meta/como-trabalhamos.md`.

## Onde está o quê (o vault é a fonte de verdade)

- **Domínio** -> `vault/00-domain/` (glossário, regras de negócio, modelo de dados, referência de UI).
- **Specs** -> `vault/10-specs/` (uma pasta por feature).
- **Decisões** -> `vault/20-decisions/` (ADRs).
- **Como trabalhamos / convenções / qualidade / segurança** -> `vault/90-meta/`.

Não duplique regras de negócio aqui: elas vivem em `vault/00-domain/regras-negocio.md`. Leia a spec relevante em vez de carregar o projeto inteiro.

## O loop (comandos)

- `/spec <ideia>` -> requisitos (agente `spec-writer`)
- `/plan <spec>` -> design (`spec-designer`)
- `/tasks <spec>` -> tarefas (`task-planner`)
- `/implement <spec>` -> código TDD (`implementer`), com commit automático por task, **parando no marco `⏸ PARADA`**
- `/verify <spec>` -> auditoria vs spec (`spec-reviewer`) + gate de segurança, **só depois do teste manual**
- `/identidade` -> gera ou importa a identidade visual (agente `brand-designer`)

Cada estágio para para aprovação humana. Nunca gere requirements, design e tasks numa tacada.

**O `tasks.md` sai em três blocos, com parada para o teste manual:**

| Bloco | O que tem | Quando roda |
| --- | --- | --- |
| **1 Núcleo** | migração, regra de domínio, endpoint, tela, **com o teste da própria tarefa dentro** (TDD) | `/implement`, que **para no marco `⏸ PARADA`** |
| ⏸ **Parada** | o usuário testa na tela e aponta o que estiver errado | **a sessão termina aqui** |
| **2 Correções** | só o que ele apontou | sessão nova, retomando pelo disco |
| **3 Fechamento** | prova de runtime ponta a ponta, `/verify`, segurança, ADR, registro no vault | depois do "está certo" dele |

Por que (medido em 2026-09-20 num arco de quatro specs): **97,5% do gasto do loop é releitura de
contexto**, e a parada é o ponto natural de cortar a sessão. O `/verify` custou 7,9% do arco e
devolveu 19 correções e 3 bloqueantes, então ele não se corta: só muda de lugar, para não ser refeito
depois das correções do teste manual. ⛔ **O que nunca se adia é o teste unitário da tarefa**:
filtrado, custa cerca de 50 tokens e poucos segundos, e mandar o usuário testar na tela um cálculo
que o teste reprovaria gasta o tempo dele, que é o caro.

**Um agente por tarefa, com o recorte da tarefa no briefing** - nunca o `tasks.md` inteiro. Tarefas
em paralelo só com o andaime (arquivos-hub) feito antes e fronteira de arquivos explícita no prompt
de cada uma.

## Retomando o trabalho (início de sessão)

⭐ **Abra sessão nova a cada spec.** Medido em 2026-09-20: **97,5% do gasto de tokens é releitura de contexto**, e arrastar a mesma sessão por várias specs é o maior desperdício isolado do processo. Não se perde nada, porque a verdade do progresso vive no disco, não no chat. Ao retomar (sessão nova ou após `/compact`):
1. Leia o `tasks.md` da spec ativa (`- [x]` vs `- [ ]`).
2. Rode `git status` e `git log --oneline -15`.
3. Se o disco divergir do `tasks.md`, ajuste o `tasks.md` antes de prosseguir.

Se a sessão anterior terminou no marco `⏸ PARADA`, retome escrevendo no **bloco 2** o que o usuário
apontou no teste manual; o **bloco 3** (`/verify`, segurança, registro) só vem depois do "está certo"
dele.

## Convenções essenciais (detalhe em `vault/90-meta/convencoes-codigo.md`)

- Domínio/specs em PT-BR; **identificadores de código em inglês**.
- **Proibido travessão** (em dash / en dash). A alternativa depende do caso (aparte vira
  parênteses; ênfase vira hífen ou ponto; intervalo vira hífen) - a tabela está em
  `convencoes-codigo` e o `check_travessao` a imprime no pre-commit.
- Lógica de negócio isolada e testável; validação nas fronteiras.
- TDD: cada tarefa começa por um teste que falha.
- **Teste: filtre a saída, não corte o teste.** O runner não gasta token de IA; a saída crua dele, sim
  (medido: ~18 mil tokens por rodada despejada no contexto, contra ~50 filtrada com `--silent` mais
  `2>&1 | tail -5`). Limite também a concorrência do runner, que sem teto come a RAM da máquina. Os
  três níveis (arquivo tocado, o que mudou mais quem depende, suíte inteira) estão em
  `vault/90-meta/qualidade-e-ci.md`.

## Comandos de projeto

Ainda não há código de aplicação até a primeira `/implement` (é lá que o scaffold da stack nasce). Depois disso, os comandos padrão da stack valem aqui.
