# RMABEx

Projeto RMA BEx
Stack: **Next.js (App Router) + TypeScript estrito + Prisma + SQLite + Zod + Vitest + Playwright** (ver `vault/20-decisions/adr-001-stack.md`).

## Regra de ouro

**Nenhum código sem spec aprovada.** Toda mudança nasce de uma spec em `vault/10-specs/NNN-slug/` e percorre o loop `requirements -> design -> tasks -> implement -> verify`. O processo está em `vault/90-meta/como-trabalhamos.md`.

## Onde está o quê (o vault é a fonte de verdade)

- **Domínio** -> `vault/00-domain/` (glossário, regras de negócio, modelo de dados, referência de UI).
- **Specs** -> `vault/10-specs/` (uma pasta por feature).
- **Decisões** -> `vault/20-decisions/` (ADRs).
- **Como trabalhamos / convenções / qualidade / segurança** -> `vault/90-meta/`.

Não duplique regras de negócio aqui: elas vivem em `vault/00-domain/regras-negocio.md`. Leia a spec relevante em vez de carregar o projeto inteiro.

## Material legado (consulta, não versionado)

O sistema RMA antigo e demais referências vivem em `OLD_RMA/` (ignorado pelo git). Toda consulta a código ou documentação legada é feita ali:

- `OLD_RMA/RMA-VS-1-FINAL-main/` -> sistema RMA legado.
- `OLD_RMA/KANTIZ-VS-1-FINAL-main/`, `OLD_RMA/PROSPECCAO-VS1-main/` -> outros sistemas de referência.
- `OLD_RMA/escopo/`, `OLD_RMA/auditoria/`, `OLD_RMA/backup/` -> documentação de escopo e auditorias.

É referência, não fonte de verdade: o que vale é o vault.

## O loop (comandos)

- `/spec <ideia>` -> requisitos (agente `spec-writer`)
- `/plan <spec>` -> design (`spec-designer`)
- `/tasks <spec>` -> tarefas (`task-planner`)
- `/implement <spec>` -> código TDD (`implementer`), com commit automático por task
- `/verify <spec>` -> auditoria vs spec (`spec-reviewer`) + gate de segurança
- `/identidade` -> gera ou importa a identidade visual (agente `brand-designer`)

## Retomando o trabalho (início de sessão)

A verdade do progresso vive no disco, não no chat. Ao retomar (sessão nova ou após `/compact`):

1. **Leia `vault/90-meta/estado-atual.md` primeiro.** É o ponto de retomada: onde o projeto está, as decisões do cliente com data, o que está travado e em quem, e o mapa de qual nota ler para cada assunto.
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
