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
2. Antes de despachar, faça você mesmo o **andaime** se a tarefa depender de arquivo-hub (rotas, schema, registro de módulos, página compartilhada). Agent nenhum deve disputar arquivo-hub.
3. Delegue essa **única** tarefa ao subagente **implementer** (via Agent tool), passando: o ID `T-x`, o caminho da spec, os requisitos que ela cita, a **fronteira de arquivos** (o que pode e o que não pode editar) e o lembrete de rodar o teste **filtrado** (`--silent` mais `2>&1 | tail -5`, com o limite de workers do runner reduzido se houver vários agents em voo). Passe **o recorte da tarefa**, nunca o `tasks.md` inteiro. O implementer roda o ciclo Red->Green->Refactor e marca `- [x]`.
4. Ao retornar: confirme que os testes passaram e que o `tasks.md` foi marcado. Em seguida, **commite automaticamente** a tarefa (o usuário pré-autorizou commit por task neste fluxo):
   - `git add` só dos arquivos daquela tarefa (código, testes e o `tasks.md`).
   - `git commit -m "feat(spec-NNN): T-x <resumo>"` (ou `test`/`fix`/`chore` conforme o caso). Escopo = número da spec.
   - Um commit por tarefa. Não misture tarefas nem specs num commit. **Não** faça `push` nem `merge` (isso é manual). Reporte o hash curto ao humano.
5. **Decisão de continuidade**:
   - Se o humano pediu "implemente a próxima tarefa" → pare após uma tarefa.
   - Se pediu "implemente a spec" → siga para a próxima tarefa automaticamente, **mas** pare e reporte se: um implementer sinalizar bloqueio, um teste falhar, ou surgir divergência do design.
6. **Pare no marco `⏸ PARADA`** do `tasks.md`, sempre, mesmo no modo "implemente a spec". Ver a seção abaixo.

## A parada para teste manual

O `tasks.md` vem em três blocos: **1 Núcleo**, `⏸ PARADA`, **2 Correções**, **3 Fechamento**. Ao fechar a última tarefa do bloco 1:

1. Mostre o diff acumulado e diga **exatamente o que o usuário vai testar**: qual tela, qual rota, qual ação, o que tem de aparecer. Se a spec criou migração, lembre o que ele precisa rodar antes de testar.
2. **Pare.** Não siga para o bloco 3, não rode `/verify`, não feche a spec.
3. Diga ao usuário que **a sessão deve terminar aqui** e que as correções entram em sessão nova.

Por que (medido em 2026-09-20 no projeto `sgcbex`, num arco de quatro specs):

- **97,5% do gasto é releitura de contexto**: a parada é o ponto natural de cortar a sessão, e a retomada custa poucos passos de disco (`tasks.md`, `git status`, `git log`).
- O `/verify` custou **7,9%** e devolveu 19 correções e 3 bloqueantes: rodado antes do teste manual, ele é refeito depois das correções do usuário e se paga duas vezes.
- ⛔ **O que não se adia**: o teste unitário da tarefa (TDD, dentro do bloco 1) e o gate estático. Filtrado, o teste custa cerca de 50 tokens e poucos segundos; mandar o usuário testar na tela um cálculo que o teste reprovaria gasta o tempo dele, que é o caro.

Na sessão nova que retoma depois do teste: escreva o que o usuário apontou como tarefas do **bloco 2**, implemente, e só então siga para o **bloco 3** (`/verify NNN-slug`, gate de segurança, ADR e registro).

## Regras

- **Uma tarefa por delegação, com o recorte dela no briefing** - mantém o contexto de cada implementer pequeno (economia de token) e o diff revisável. Nunca passe o `tasks.md` inteiro nem o projeto inteiro.
- **Teste sempre filtrado.** O runner não gasta token de IA; a saída crua dele custa cerca de 18 mil tokens por rodada, contra cerca de 50 filtrada. Onde o runner paraleliza, o limite de workers é obrigatório: **4** na rodada solo, **2** com vários agents em voo, e aí só um agent roda a suíte inteira.
- Nunca marque uma tarefa como feita se os testes não passam ou a implementação é parcial.
- Não deixe o loop "corrigir o design" - divergência de design volta ao humano/`spec-designer`, não é remendada no implementer.
- Se muitas tarefas independentes puderem rodar em paralelo com isolamento (arquivos disjuntos), você pode disparar implementers em paralelo - mas só quando os arquivos não colidem.
