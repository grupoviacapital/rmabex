---
name: implement-spec
description: Executa as tarefas de uma spec (tasks.md) uma a uma em TDD, delegando cada tarefa ao subagente implementer e atualizando o progresso. Use quando o usuário quer implementar/codar uma spec já aprovada, ou pede "/implement", "implementar a spec", "executar as tarefas".
---

# Execução de spec (estágio 4 do loop)

Este skill roda o loop de implementação TDD de uma spec cujo `requirements.md`, `design.md` e `tasks.md` já estão aprovados.

## Pré-requisitos

- `vault/10-specs/NNN-slug/tasks.md` existe e tem tarefas `- [ ]`.
- Se não houver `tasks.md`, pare e aponte para `create-spec` / `/tasks`.

## Reconciliação de início (sempre, antes do loop)

Toda vez que este skill roda (inclusive numa sessão nova), primeiro **reconcilie o estado real** antes de escolher a próxima tarefa:
- Leia `tasks.md` (o que está `- [x]` vs `- [ ]`).
- Rode `git status` e `git log --oneline -15` para ver o que já foi commitado.
- Compare: se houver código de uma tarefa que **não** está marcada (ou marcada mas sem código), corrija o `tasks.md` para refletir a realidade do disco antes de prosseguir. A verdade é o disco (arquivos + git), não a memória do chat.

## Branch da spec (uma vez, no começo)

- Trabalhe cada spec em seu próprio branch: `spec-NNN-slug` (ex.: `spec-001-<slug>`).
- Se ainda não estiver nesse branch, crie/entre nele (`git switch -c spec-NNN-slug` ou `git switch spec-NNN-slug`) a partir de `main` atualizado. Nunca implemente direto em `main`.
- O merge para `main` (ou abertura de PR) só acontece após `/verify` aprovar. Merge e push permanecem manuais (você revisa).

## Procedimento (loop)

1. Leia `tasks.md` e pegue a **próxima** tarefa não marcada (`- [ ]`) respeitando a ordem/dependências.
2. Delegue essa **única** tarefa ao subagente **implementer** (via Agent tool), passando: o ID `T-x`, o caminho da spec, e os requisitos que ela cita. O implementer roda o ciclo Red→Green→Refactor e marca `- [x]`.
3. Ao retornar: confirme que os testes passaram e que o `tasks.md` foi marcado. Em seguida, **commite automaticamente** a tarefa (o usuário pré-autorizou commit por task neste fluxo):
   - `git add` só dos arquivos daquela tarefa (código, testes e o `tasks.md`).
   - `git commit -m "feat(spec-NNN): T-x <resumo>"` (ou `test`/`fix`/`chore` conforme o caso). Escopo = número da spec.
   - Um commit por tarefa. Não misture tarefas nem specs num commit. **Não** faça `push` nem `merge` (isso é manual). Reporte o hash curto ao humano.
4. **Decisão de continuidade**:
   - Se o humano pediu "implemente a próxima tarefa" → pare após uma tarefa.
   - Se pediu "implemente a spec" → siga para a próxima tarefa automaticamente, **mas** pare e reporte se: um implementer sinalizar bloqueio, um teste falhar, ou surgir divergência do design.
5. Ao esgotar as tarefas, sugira `/verify NNN-slug`.

## Regras

- **Uma tarefa por delegação** - mantém o contexto de cada implementer pequeno (economia de token) e o diff revisável.
- Nunca marque uma tarefa como feita se os testes não passam ou a implementação é parcial.
- Não deixe o loop "corrigir o design" - divergência de design volta ao humano/`spec-designer`, não é remendada no implementer.
- Se muitas tarefas independentes puderem rodar em paralelo com isolamento (arquivos disjuntos), você pode disparar implementers em paralelo - mas só quando os arquivos não colidem.
