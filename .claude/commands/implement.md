---
description: Implementa as tarefas de uma spec em TDD (estágio 4)
argument-hint: <NNN-slug da spec> [próxima|tudo]
---

Implemente a spec `$ARGUMENTS` usando o skill `implement-spec`.

Pré-condição: `vault/10-specs/<NNN-slug>/tasks.md` existe com tarefas abertas. Se não, aponte para `/tasks`.

Interprete o modo a partir dos argumentos: "próxima" (ou vazio) = implemente apenas a próxima tarefa e pare; "tudo" = siga tarefa a tarefa até esgotar, parando em qualquer bloqueio, teste falho ou divergência de design. Cada tarefa vai para um subagente `implementer` separado (TDD).

O fluxo trabalha no branch `spec-NNN-slug` e **commita automaticamente** cada tarefa concluída (`feat/test(spec-NNN): T-x ...`) - você não precisa pedir "commita". `push`/`merge` seguem manuais. Ao esgotar, sugira `/verify`.
