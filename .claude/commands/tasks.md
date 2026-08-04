---
description: Quebra o design.md de uma spec em tasks.md rastreável (estágio 3)
argument-hint: <NNN-slug da spec>
---

Gere o `tasks.md` da spec `$ARGUMENTS` delegando ao subagente `task-planner`.

Pré-condição: `vault/10-specs/$ARGUMENTS/design.md` existe e está aprovado. Se não existir, pare e aponte para `/plan`.

Garanta que todo requisito (`R-x`/`RN-x`) seja coberto por ao menos uma tarefa; reporte órfãos. Ao final, resuma nº de tarefas e ordem, e aponte para `/implement $ARGUMENTS`.
