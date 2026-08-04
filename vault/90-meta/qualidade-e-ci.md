# Qualidade, Commits e CI

> Como testes, commits e integração contínua funcionam no `rmabex`. Explicação simples em `CONCEITOS.md` (raiz). Convenções de código em [[convencoes-codigo]].

## Testes: 3 camadas contínuas

Nada de "testar no fim". O teste acompanha o código:

| Camada | Quando | O que roda | Ferramenta |
|--------|--------|-----------|-----------|
| **TDD local** | durante cada task | teste da unidade em construção (Red -> Green -> Refactor) | Vitest |
| **Pre-commit** | ao commitar | lint + format + testes dos arquivos alterados | Husky + lint-staged |
| **CI** | a cada push / PR | suíte inteira + `tsc --noEmit` + e2e | GitHub Actions + Playwright |

- **Unidade/integração**: lógica pura em `src/lib/` (ex.: cálculos e regras do domínio). Rápido, roda o tempo todo.
- **e2e (navegador de verdade)**: Playwright valida fluxos ponta a ponta (uma ação do usuário reflete o estado correto na tela).
- **Auditoria de spec**: o agente `spec-reviewer` confere cobertura de cada RN-x.
- **Conferência visual manual**: opcional, via Claude-in-Chrome (screenshot/GIF da app rodando).

Regra: toda RN-x tocada por uma spec tem ao menos um teste que a nomeia (`describe("RN-5 ...")`).

## Commits: quem e como

- **Quem commita**: o fluxo `/implement` **commita automaticamente** cada tarefa concluída (o usuário pré-autorizou commit por task). Você não precisa pedir "commita".
- **Branch por spec**: cada spec roda no branch `spec-NNN-slug`; o commit por task cai nele. `push` e `merge`/PR para `main` permanecem **manuais** (você revisa o diff antes).
- **Padrão**: Conventional Commits, escopo = número da spec.
  - `feat(spec-NNN): adiciona <feature>`
  - `test(spec-NNN): cobre <regra> (RN-x)`
  - `fix(spec-002): corrige debito duplo ao desmarcar`
  - `chore`, `refactor`, `docs` conforme o caso.
- **Enforcement**: `commitlint` + hook `commit-msg` do Husky rejeita commit fora do padrão.
- Um commit não mistura specs diferentes.

## Bugs e features: como abordar

- **Bug pequeno** (código errado, comportamento certo na spec): peça direto ao Claude Code. Ele corrige e escreve um **teste de regressão** (falha antes, passa depois). Sem spec.
- **Bug que muda regra**: a regra estava errada na fonte de verdade -> vira mini-spec ou ADR antes de corrigir.
- **Feature complexa**: quebrada em tasks pela spec. Tasks independentes (arquivos disjuntos) podem ir para `implementer`s em **paralelo** (ex.: um no back `src/lib`, outro num componente). A coordenação é a spec, não os agentes.
- **Quem testa depois**: Vitest (código) sempre; Playwright (navegador) nos fluxos; `spec-reviewer` audita. Para features simples, sequencial basta.

## Ferramentas de qualidade (criadas no scaffold da 1a spec)

Estas nascem junto do `package.json`, na primeira `/implement`:

- **Prettier** - formatação automática (roda no hook e no pre-commit).
- **ESLint** (`@typescript-eslint`, `eslint-plugin-import`) - regras de código e ordem de imports.
- **Husky** - hooks de git: `pre-commit` (lint-staged) e `commit-msg` (commitlint).
- **lint-staged** - roda lint/format/test só nos arquivos alterados (rápido).
- **check-travessao** - script que falha se `-`/`-` aparecer em arquivos versionados (pre-commit + CI). Ver [[convencoes-codigo#Pontuação: proibido travessão]].
- **GitHub Actions** (`.github/workflows/ci.yml`) - install, typecheck, testes, e2e em cada push/PR.

> Motivo de não criar agora: são infra do toolchain e dependem do `package.json`, que nasce guiado pela spec 001. Registrado aqui para virar tarefas no scaffold.
