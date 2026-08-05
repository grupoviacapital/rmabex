# RMABEx

Projeto RMA BEx
Stack: **Next.js (App Router) + TypeScript estrito + Prisma + SQLite + Zod + Vitest + Playwright** (ver `vault/20-decisions/adr-001-stack.md`).

## Onde o projeto está (05/08/2026): reinício do zero

O escopo anterior estava errado. **Todo o domínio que havia sido escrito foi descartado** e o material legado (`OLD_RMA/`) foi apagado. Estamos remontando o entendimento do zero, em quatro etapas:

1. **Rascunho do escopo** -> `RASCUNHO.md` na raiz. **É o ponto de partida de qualquer sessão.** Etapa atual.
2. Fluxograma e análise de requisitos.
3. Specs.
4. Código.

Regras enquanto durar esta fase:

- **Não consulte `vault/99-descartado/`.** Nada ali é confiável, nem os detalhes que parecem inofensivos.
- Não afirme nada de domínio que não esteja confirmado no `RASCUNHO.md`. Sem fonte, é dúvida `D-x`, não fato.
- As notas de domínio do vault estão vazias de propósito. Vão sendo preenchidas a partir do rascunho.

## Regra de ouro

**Nenhum código sem spec aprovada.** Toda mudança nasce de uma spec em `vault/10-specs/NNN-slug/` e percorre o loop `requirements -> design -> tasks -> implement -> verify`. O processo está em `vault/90-meta/como-trabalhamos.md`.

## Onde está o quê (o vault é a fonte de verdade)

- **Domínio** -> `vault/00-domain/` (glossário, regras de negócio, modelo de dados, referência de UI).
- **Specs** -> `vault/10-specs/` (uma pasta por feature).
- **Decisões** -> `vault/20-decisions/` (ADRs).
- **Como trabalhamos / convenções / qualidade / segurança** -> `vault/90-meta/`.

Não duplique regras de negócio aqui: elas vivem em `vault/00-domain/regras-negocio.md`. Leia a spec relevante em vez de carregar o projeto inteiro.

## Material legado

Não existe mais. `OLD_RMA/` foi apagado em 05/08/2026 e não deve ser procurado nem reconstruído.

## O loop (comandos)

- `/spec <ideia>` -> requisitos (agente `spec-writer`)
- `/plan <spec>` -> design (`spec-designer`)
- `/tasks <spec>` -> tarefas (`task-planner`)
- `/implement <spec>` -> código TDD (`implementer`), com commit automático por task
- `/verify <spec>` -> auditoria vs spec (`spec-reviewer`) + gate de segurança
- `/identidade` -> gera ou importa a identidade visual (agente `brand-designer`)

## Retomando o trabalho (início de sessão)

A verdade do progresso vive no disco, não no chat. Ao retomar (sessão nova ou após `/compact`):

1. **Leia `RASCUNHO.md` primeiro.** É o ponto de retomada enquanto durar o reinício: o que já foi confirmado, e as dúvidas `D-x` ainda abertas.
2. Leia o `tasks.md` da spec ativa (`- [x]` vs `- [ ]`), se já houver spec.
3. Rode `git status` e `git log --oneline -15`.
4. Se o disco divergir do `tasks.md`, ajuste o `tasks.md` antes de prosseguir.

## Convenções essenciais (detalhe em `vault/90-meta/convencoes-codigo.md`)

- Domínio/specs em PT-BR; **identificadores de código em inglês**.
- **Proibido travessão** (em dash / en dash); use hífen simples.
- Lógica de negócio isolada e testável; validação nas fronteiras.
- TDD: cada tarefa começa por um teste que falha.

## Comandos de projeto

Ainda não há código de aplicação até a primeira `/implement` (é lá que o scaffold da stack nasce). Depois disso, os comandos padrão da stack valem aqui.
