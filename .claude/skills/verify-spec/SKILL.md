---
name: verify-spec
description: Verifica uma spec implementada - roda a suite de testes e o typecheck, e delega ao subagente spec-reviewer uma auditoria adversarial do código contra requirements/design. Use quando o usuário quer verificar/revisar/validar uma spec, checar conformidade, ou pede "/verify", "verificar a spec".
---

# Verificação de spec (estágio 5 do loop)

Este skill confere se uma spec implementada realmente satisfaz seus requisitos.

## Quando rodar: depois do teste manual do usuário, nunca antes

⭐ **O `/verify` é a primeira tarefa do bloco 3 do `tasks.md`**, e o bloco 3 só começa depois de o usuário testar a feature na tela e dizer que está certo.

Rodar antes do teste manual desperdiça o estágio: o usuário aponta correções, o código muda e a auditoria inteira é refeita. Medido em 2026-09-20 no projeto `sgcbex`, num arco de quatro specs, o `/verify` custou **7,9%** do arco e devolveu 19 correções e 3 bloqueantes, então ele não se corta: só roda uma vez, no fim.

Se as tarefas do bloco 1 acabaram e o usuário ainda não testou, **pare e peça o teste** em vez de verificar.

## Procedimento

1. Confirme que a spec tem código implementado (tarefas `- [x]` em `tasks.md`), que o bloco 2 (correções do teste manual) está fechado, e veja o que mudou (`git status`, `git --no-pager diff --stat`).
2. Rode a verificação objetiva você mesmo (ou deixe o reviewer rodar), sempre com a **saída filtrada**: a suíte do runner do projeto (`npx vitest run --silent --reporter=dot 2>&1 | tail -6`, ou o equivalente em Jest, pytest ou Go) e o gate estático (`npx tsc --noEmit` e o lint). Capture os números (testes passando/falhando). A saída crua de uma rodada custa cerca de 18 mil tokens contra cerca de 50 da filtrada, e onde o runner paraleliza o limite de workers é obrigatório (**4** solo, **2** com outros agents em voo).
   - ⚠️ Se o projeto tiver um script de validação que **compila**, use a variante sem build enquanto o dev do usuário estiver rodando em watch: o build apaga a pasta compilada que o watch executa. Não existindo variante, rode só type-check e lint, e diga o que ficou de fora.
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
- **Verde não é veredito.** Lint e type-check passam verdes com a tela quebrada. Toda verificação termina com **a lista explícita do que não foi provado rodando** - dizer "validou" é insuficiente.
- Regras críticas do domínio (as que mexem em dados sensíveis) merecem atenção extra: erros aqui corrompem números importantes.
- O reviewer é cético por padrão; um "APROVADO" só sai quando os testes passam E os requisitos têm cobertura real.
