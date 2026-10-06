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
- **Teste manual do usuário**: não é opcional nem é "testar no fim". É o marco `⏸ PARADA` do
  `tasks.md`, entre o bloco do núcleo e o de fechamento: o usuário abre a tela, usa a feature e
  aponta o que estiver errado antes de qualquer auditoria. Ver [[como-trabalhamos]].
- **Conferência visual pelo agente**: opcional, via Claude-in-Chrome (screenshot/GIF da app rodando).
  Complementa o teste do usuário, não substitui.

Regra: toda RN-x tocada por uma spec tem ao menos um teste que a nomeia (`describe("RN-5 ...")`).

### O runner não gasta token; a saída dele, sim (medido em 2026-09-20)

Rodar teste **não custa token de IA**. O que custava era a **saída crua entrando no contexto**: uma
rodada completa despejada custa cerca de **18 mil tokens**; a mesma rodada filtrada (`--silent` mais
`2>&1 | tail -5`) custa cerca de **50**. A economia está em filtrar a saída, não em rodar menos teste.

Três níveis, na prática:

| Quando | O que rodar |
|---|---|
| **Durante a tarefa** | só o arquivo tocado |
| **Ao fechar uma onda** | só o que mudou e o que depende disso (`--changed` no Vitest, `-o` no Jest; sem esse flag, o arquivo tocado mais quem depende dele). **Cobre mais do que rodar a pasta** |
| **Antes do commit** | a suíte inteira mais o gate estático (type-check e lint) |

Os comandos dependem do runner que o projeto escolher no setup da primeira spec. O que não muda é a
forma: **nome do runner, limite de workers quando existir, alvo, `--silent` e `2>&1 | tail -N`.**

| Runner | Arquivo tocado |
|---|---|
| Vitest | `npx vitest run <arquivo> --silent --reporter=dot 2>&1 \| tail -5` |
| Jest | `npx jest --maxWorkers=4 --silent <arquivo> 2>&1 \| tail -5` |
| pytest | `pytest -q <arquivo> 2>&1 \| tail -5` |
| Go | `go test ./<pacote>/... 2>&1 \| tail -5` |

Libere o comando escolhido no `allow` do `.claude/settings.json`, senão cada rodada vira um prompt de
permissão.

⚠️ **Limite a concorrência do runner.** No `sgcbex` a máquina do usuário já reiniciou por falta de RAM
com o Jest sem `--maxWorkers`, porque cada worker carrega o projeto inteiro. A regra medida lá: **4**
workers na rodada solo de uma máquina de 16 núcleos, **2** quando houver vários agents em voo. O flag
vem logo depois do nome do runner, e não se usa script de `package.json` que esconda o limite (um
`npm test` com `--maxWorkers=50%`, por exemplo).

### O gate estático não pode derrubar o dev do usuário

Type-check e lint dos arquivos tocados são obrigatórios antes de fechar uma tarefa. **O build não
é.** Se o projeto tiver um script de validação que compila e o usuário costuma estar com o dev em
watch, o gate padrão é a **variante sem build** desse script: o build apaga a pasta compilada que o
watch está executando. Não existindo variante, rode só o type-check e o lint dos subprojetos tocados
e diga o que ficou de fora.

⚠️ **Verde não é prova de comportamento.** Lint e type-check passam verdes com a tela quebrada:
campo renomeado que a tabela ainda cita, tipo de resposta do front divergente do back, cache do
bundler apontando para arquivo removido, data pura gravada como instante. Quem mexeu em coluna,
contrato de API ou data confere no runtime, ou diz claramente que não conferiu.

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
- **check_travessao** - `ops/check_travessao.sh`, plugado no pre-commit. Falha se
  en dash ou em dash aparecer em arquivo versionado, e **imprime qual alternativa usar em
  cada caso** (aparte vira parênteses; ênfase vira hífen ou ponto; intervalo vira hífen).
  Tem autoteste (`--teste`) e varre a base inteira com `--tudo`.
- **GitHub Actions** (`.github/workflows/ci.yml`) - install, typecheck, testes, e2e em cada push/PR.

> Motivo de não criar agora: são infra do toolchain e dependem do `package.json`, que nasce guiado pela spec 001. Registrado aqui para virar tarefas no scaffold.
