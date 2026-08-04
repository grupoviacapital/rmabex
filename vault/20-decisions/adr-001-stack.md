# ADR-001 · Stack

## Status

`Aceito` (2026-08-04)

## Contexto

O projeto RMABEx precisa de uma stack que dê o melhor loop de execução por IA em Spec-Driven Development: tipagem forte, contrato/schema como fonte única, testes rápidos e convenções file-based previsíveis.

## Decisão

Usar: **Next.js (App Router) + TypeScript estrito + Prisma + SQLite + Zod + Vitest + Playwright**.

## Consequências

- O schema/contrato vira a fonte de verdade referenciada pelos `design.md`.
- Feedback determinístico (compilador + testes) barato para o agente.
- Ajustar [[convencoes-codigo]] se a stack diferir das premissas (TS/web) descritas lá.

## Links

- [[modelo-dados]], [[adr-002-spec-driven-obsidian]]
