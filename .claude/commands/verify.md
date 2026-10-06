---
description: Verifica uma spec implementada vs requisitos + roda a suite (estágio 5)
argument-hint: <NNN-slug da spec>
---

Verifique a spec `$ARGUMENTS` usando o skill `verify-spec`.

Pré-condição: o usuário **já testou a feature na tela** e disse que está certo (o `/verify` é a primeira tarefa do bloco 3 do `tasks.md`). Se o bloco 1 acabou e ele ainda não testou, pare e peça o teste: rodado antes, o estágio é refeito depois das correções e se paga duas vezes.

Rode a suíte do runner do projeto e o type-check, sempre com a saída **filtrada** (`--silent` mais `2>&1 | tail -6`), e delegue ao subagente `spec-reviewer` a auditoria adversarial do código contra `requirements.md`/`design.md`. Entregue um veredito APROVADO/REPROVADO com gaps (severidade, arquivo:linha, requisito violado) e requisitos sem cobertura. Se REPROVADO, converta gaps bloqueantes em tarefas e aponte para `/implement`.
