---
name: verify-spec
description: Verifica uma spec implementada - roda a suite de testes e o typecheck, e delega ao subagente spec-reviewer uma auditoria adversarial do código contra requirements/design. Use quando o usuário quer verificar/revisar/validar uma spec, checar conformidade, ou pede "/verify", "verificar a spec".
---

# Verificação de spec (estágio 5 do loop)

Este skill confere se uma spec implementada realmente satisfaz seus requisitos.

## Procedimento

1. Confirme que a spec tem código implementado (tarefas `- [x]` em `tasks.md`).
2. Rode a verificação objetiva você mesmo (ou deixe o reviewer rodar): `npx vitest run` e `npx tsc --noEmit`. Capture números (testes passando/falhando).
3. Delegue ao subagente **spec-reviewer** (via Agent tool) a auditoria adversarial da spec `NNN-slug`: cobertura de cada `R-x`/`RN-x`, conformidade com `design.md`, convenções, e qualidade dos testes.
4. Consolide o retorno num veredito: **APROVADO** ou **REPROVADO**, com a lista de gaps (severidade, arquivo:linha, requisito violado) e requisitos sem cobertura.
5. **Se REPROVADO**: traduza cada gap bloqueante em uma tarefa nova/reaberta em `tasks.md` e aponte de volta para `/implement`. Não conserte aqui - o reviewer é read-only por design.
6. **Se APROVADO**: sugira commit (`feat(spec-NNN): …`) e marque a spec como concluída no índice do vault (`vault/README.md`), se aplicável.

## Gate de segurança (sempre)

Antes de dar veredito final, rode a checagem de segurança:
1. Comando nativo **`/security-review`** sobre as mudanças da spec (vulnerabilidades no diff).
2. Delegue ao subagente **security-reviewer** a lente adversarial de segurança (segredos, validação, injeção, integridade de operações sensíveis, `npm audit`).
3. Consolide os achados de segurança junto do veredito. Um risco `crítico` ou `alto` **reprova** a spec, mesmo que os testes passem. Achados de infra/pentest não bloqueiam aqui: apontam para [[pendencias-externas]].

## Regras

- Não confie no `tasks.md`: o reviewer valida por execução, não por checkbox.
- Regras críticas do domínio (as que mexem em dados sensíveis) merecem atenção extra: erros aqui corrompem números importantes.
- O reviewer é cético por padrão; um "APROVADO" só sai quando os testes passam E os requisitos têm cobertura real.
