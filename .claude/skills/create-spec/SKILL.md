---
name: create-spec
description: Autoria de uma spec completa no fluxo Spec-Driven do rmabex - produz requirements.md, design.md e tasks.md via os subagentes, com checkpoint humano entre estágios. Use quando o usuário quer transformar uma ideia de feature em uma spec pronta para implementar, ou pede "criar spec", "nova feature", "/spec".
---

# Autoria de spec (estágios 1→3 do loop)

Este skill orquestra a criação dos três documentos de uma spec. **Não implementa código** - isso é o `implement-spec`. Entre cada estágio há um **checkpoint humano**: pare e mostre o artefato antes de avançar.

## Pré-requisitos

- O domínio existe em `vault/00-domain/`. Se a ideia introduz um conceito novo de domínio, sinalize ao humano para atualizar o glossário/regras antes.

## Procedimento

### Estágio 1 - Requisitos
1. Determine `NNN` (próximo número em `vault/10-specs/`) e um `slug` curto em kebab-case.
2. Delegue ao subagente **spec-writer** (via Agent tool) passando a ideia e o caminho `vault/10-specs/NNN-slug/`.
3. Leia o `requirements.md` resultante, resuma ao humano (nº de requisitos, perguntas em aberto) e **PARE para aprovação**. Não avance sem "ok".

### Estágio 2 - Design
4. Após aprovação dos requisitos, delegue ao **spec-designer** a mesma spec.
5. Resuma o `design.md` (entidades, contratos, ADRs propostos, requisitos sem cobertura) e **PARE para aprovação**. Se o designer propôs um ADR, o humano deve registrá-lo em `vault/20-decisions/` antes de seguir.

### Estágio 3 - Tarefas
6. Após aprovação do design, delegue ao **task-planner**.
7. Resuma o `tasks.md` (nº de tarefas, cobertura de todos os R-x/RN-x, ordem) e **PARE**.

## Regras

- Um estágio por vez, com aprovação humana entre eles. Nunca gere os três documentos numa tacada sem checkpoints.
- Cada subagente tem contexto isolado - passe a ele apenas o caminho da spec e a instrução; ele lê o domínio sozinho.
- Ao final, aponte o próximo passo: `/implement NNN-slug`.
- Rastreabilidade é obrigatória: se o `task-planner` reportar requisito órfão, resolva antes de considerar a spec pronta.
