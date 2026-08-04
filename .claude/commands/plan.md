---
description: Gera o design.md de uma spec a partir dos requisitos aprovados (estágio 2)
argument-hint: <NNN-slug da spec>
---

Gere o design técnico da spec `$ARGUMENTS` delegando ao subagente `spec-designer`.

Pré-condição: `vault/10-specs/$ARGUMENTS/requirements.md` existe e está aprovado. Se não existir, pare e aponte para `/spec`.

Ao final, resuma entidades/contratos definidos, ADRs propostos e requisitos sem cobertura, e pare para aprovação humana antes de `/tasks`.
