# RMABEx

Projeto RMA BEx

> Projeto estruturado com **Spec-Driven Development**: o vault Obsidian (`vault/`) é a fonte de verdade e o Claude Code é o executor. Nenhum código nasce sem uma spec aprovada.

## Stack

Next.js (App Router) + TypeScript estrito + Prisma + SQLite + Zod + Vitest + Playwright (decisão em [`vault/20-decisions/adr-001-stack.md`](vault/20-decisions/adr-001-stack.md)).

## Como este projeto funciona

```
/spec <ideia>   -> requirements.md   (agente spec-writer)
/plan <spec>    -> design.md         (spec-designer)
/tasks <spec>   -> tasks.md          (task-planner)
/implement      -> código + testes   (implementer, TDD, commit por task)
/verify         -> auditoria vs spec (spec-reviewer) + segurança
/identidade     -> identidade visual (brand-designer)
```

Processo completo em [`vault/90-meta/como-trabalhamos.md`](vault/90-meta/como-trabalhamos.md).

## Estrutura

| Caminho | O que é |
|---------|---------|
| `vault/` | Fonte de verdade. Abra no Obsidian. Domínio, specs, decisões, convenções. |
| `.claude/` | Harness Claude Code: agents, skills, commands, settings. |
| `src/` | A aplicação (criada na primeira implementação). |

Comece por [`vault/README.md`](vault/README.md) e por [`CONCEITOS.md`](CONCEITOS.md) se os termos (harness, agents, skills, spec-driven) forem novos.

## Primeiros passos

1. Abra o `vault/` no Obsidian.
2. Preencha o domínio em `vault/00-domain/` (glossário, regras, modelo de dados).
3. Rode `/identidade` para definir a identidade visual.
4. Rode `/spec <primeira ideia>` para começar a primeira feature.
