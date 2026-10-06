# Roadmap de Specs - RMABEx

> Decomposição do projeto em specs, por ordem de dependência. Uma spec só entra em `/implement` depois de `requirements -> design -> tasks` aprovados. Atualize o status conforme avança.

| Spec | Escopo | Depende de | Status |
|------|--------|-----------|--------|
| 001 · <nome> | <o que cobre> | - | `A escrever` |
| 002 · <nome> | <o que cobre> | 001 | `A escrever` |

## Notas

- A primeira spec normalmente inclui o **scaffold da stack** + tooling (lint, testes, Husky/commitlint, CI).
- Uma spec de **Shell de UI e Tema** aplica os tokens de [[ui-referencia]] (rode `/identidade` antes).
- Cada regra `RN-x` de [[regras-negocio]] deve estar coberta por ao menos uma spec.
- Decisões abertas viram ADR em [[../20-decisions/adr-000-template|ADR]] conforme surgem.
