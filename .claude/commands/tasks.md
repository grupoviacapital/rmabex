---
description: Quebra o design.md de uma spec em tasks.md rastreável (estágio 3)
argument-hint: <NNN-slug da spec>
---

Gere o `tasks.md` da spec `$ARGUMENTS` delegando ao subagente `task-planner`.

Pré-condição: `vault/10-specs/$ARGUMENTS/design.md` existe e está aprovado. Se não existir, pare e aponte para `/plan`.

O `tasks.md` sai **em três blocos**: **1 Núcleo** (com o teste de cada tarefa dentro), o marco `⏸ PARADA - teste manual do usuário`, **2 Correções** (vazio no planejamento) e **3 Fechamento** (prova de runtime ponta a ponta, `/verify`, segurança, registro).

Garanta que todo requisito (`R-x`/`RN-x`) seja coberto por ao menos uma tarefa; reporte órfãos. Ao final, resuma o nº de tarefas **por bloco**, a ordem, o que pode correr em paralelo e **o que o usuário vai testar na parada**, e aponte para `/implement $ARGUMENTS`.
