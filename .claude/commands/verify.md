---
description: Verifica uma spec implementada vs requisitos + roda a suite (estágio 5)
argument-hint: <NNN-slug da spec>
---

Verifique a spec `$ARGUMENTS` usando o skill `verify-spec`.

Rode `npx vitest run` e `npx tsc --noEmit`, e delegue ao subagente `spec-reviewer` a auditoria adversarial do código contra `requirements.md`/`design.md`. Entregue um veredito APROVADO/REPROVADO com gaps (severidade, arquivo:linha, requisito violado) e requisitos sem cobertura. Se REPROVADO, converta gaps bloqueantes em tarefas e aponte para `/implement`.
