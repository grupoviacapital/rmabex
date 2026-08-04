# Convenções de Código

> Padrões que todo código do `rmabex` segue. O `implementer` e o `spec-reviewer` tratam estas convenções como regras. Stack decidida em [[adr-001-stack]].

## Idioma

- **Domínio, specs, ADRs, comentários de negócio** → PT-BR.
- **Identificadores de código** (variáveis, funções, tipos, arquivos, tabelas, colunas) → **inglês**. Mapa domínio↔código em [[modelo-dados]].

## TypeScript

- `strict: true` (sem `any` implícito, `strictNullChecks`). `any` explícito só com `// justificativa`.
- Preferir `type` para modelagem de dados; `interface` para contratos extensíveis.
- Sem `enum` de TS - usar union types de string ou `as const` (melhor tree-shaking e interop).

## Validação e contratos

- **Zod** valida toda fronteira externa (input de form, params de rota, resposta de API). Um schema Zod por entidade, derivando o tipo com `z.infer`.
- **Prisma** é a fonte de verdade do banco; o schema espelha [[modelo-dados]]. Valores monetários como `Decimal` (nunca `float`).

## Estrutura (Next.js App Router)

- Server Components por padrão; `"use client"` só quando há estado/efeito de UI.
- Lógica de negócio em `src/lib/` (pura, testável), **fora** de componentes.
- Server Actions para mutação; nunca lógica de negócio inline no componente.

## Dinheiro

- Sempre `Decimal` (Prisma) / `bigint` em centavos ou lib decimal no client - **nunca** `number` float para dinheiro. Arredondamento explícito na borda de apresentação.

## Testes

- **Vitest** para unidade/integração (lógica em `src/lib/`). **Playwright** para e2e dos fluxos das regras ([[regras-negocio]]).
- TDD: cada task do `tasks.md` começa por um teste que falha.
- Cada regra RN-x tem ao menos um teste que a nomeia no título (`describe("RN-5 · …")`).

## Commits

- Conventional Commits: `feat(spec-NNN): …`, `test(spec-NNN): …`. Escopo = número da spec.
- Um commit não mistura specs diferentes.

## Nomes de arquivo

- `kebab-case` para arquivos, `PascalCase` para componentes React, `camelCase` para funções/vars.

## Estilo detalhado (regras do time)

Estas são regras explícitas do projeto. O `implementer` e o `spec-reviewer` as tratam como obrigatórias. Onde é possível, o ESLint/Prettier as automatiza (ver "Enforcement" no fim).

### Pontuação: proibido travessão

- **Nunca** usar travessão longo `-` (em dash) nem `-` (en dash), em hipótese alguma. Vale para **código, comentários, docs do vault, mensagens de commit e PRs**.
- No lugar: use hífen simples `-`, dois-pontos `:`, parênteses, ou reescreva a frase.
- Exemplo: em vez de "status - ativo - editável", escreva "status: ativo (editável)".

### Comentários

- Comente o **porquê**, não o **quê**. O código já diz o que faz; o comentário explica a decisão.
- Ruim: `// soma 1 ao contador`. Bom: `// idempotente: só aplica na transição false -> true (RN-x)`.
- Comentários em PT-BR. Sem comentário óbvio ou morto (código comentado vai embora, não fica).
- Regras de negócio citam o RN: `// RN-2: <descrição curta da regra>`.

### Ordem e organização de imports

Sempre no topo do arquivo, em blocos separados por linha em branco, nesta ordem:

```ts
// 1. libs externas
import { useState } from "react"
import { z } from "zod"

// 2. módulos internos do projeto (alias @/)
import { computeTotal } from "@/lib/domain"
import { Button } from "@/components/button"

// 3. tipos (quando separados)
import type { Item } from "@/lib/schemas"
```

Nada de import no meio do arquivo. Preferir alias `@/` a caminhos relativos longos (`../../..`).

### Ordem dentro do arquivo

1. imports (topo),
2. constantes/config do módulo,
3. tipos/schemas,
4. função principal (componente ou export principal),
5. funções auxiliares do projeto abaixo.

### Funções

- **Parâmetros sempre desestruturados** via objeto, mesmo com um argumento:
  ```ts
  // bom
  function updateItem({ id, field, value }: UpdateInput) { ... }
  // evitar
  function updateItem(id, field, value) { ... }
  ```
- Nomear com verbo: `computeTotal`, `updateItem`, `formatValue`.
- Uma função, uma responsabilidade. Se passar de ~30 linhas, provavelmente quer quebrar.
- Arrow function para callbacks e componentes; `function` nomeada para utilitários de módulo (melhor stack trace).

### Exports

- Preferir **named exports** (`export function ...`) a `default`. Facilita busca e refactor.
- Um arquivo de utilitário expõe funções nomeadas; componentes podem usar named export com o nome do componente.

### Enforcement (automação, criada no scaffold)

- **Prettier** formata (aspas, vírgula final, largura). Roda no hook `PostToolUse` e no pre-commit.
- **ESLint** (`@typescript-eslint`, `eslint-plugin-import` com `import/order`) valida ordem de imports, `no-unused-vars`, etc.
- **Regra do travessão**: um check no pre-commit e no CI falha se `-` ou `-` aparecer em arquivos versionados (`git grep` bloqueante). Configurado junto do Husky.
- `.editorconfig` na raiz garante indentação/charset iguais entre editores.

