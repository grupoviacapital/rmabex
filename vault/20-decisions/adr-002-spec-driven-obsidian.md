# ADR-002 · Spec-Driven Development com Obsidian

## Status

`Aceito` (2026-07-24)

## Contexto

Queremos um padrão alto de "arquitetura de IA": usar o Claude Code de forma que otimize tokens, use subagentes e skills corretamente, e mantenha o conhecimento do projeto durável e navegável. Código gerado por IA sem uma âncora de intenção tende a divergir; e carregar o projeto inteiro em contexto a cada tarefa é caro.

## Decisão

Adotar **Spec-Driven Development estilo Kiro** (`requirements → design → tasks → implement`), com o **vault Obsidian** (`vault/`) como camada de specs/conhecimento e o **Claude Code como harness executor**. Regra de ouro: **nenhum código sem spec aprovada**.

## Alternativas consideradas

- **GitHub Spec Kit** - toolkit oficial, porém mais opinado e menos acoplado ao Obsidian/`[[wikilinks]]`.
- **Híbrido leve próprio** - flexível, mas sem a estrutura pronta de requirements/design/tasks.
- **Docs soltas em `/docs`** - não dá grafo de conhecimento nem disciplina de rastreabilidade.

## Consequências

- ✅ **Specs = memória externa**: cada tarefa carrega só a spec relevante → contexto pequeno, menos tokens.
- ✅ **Rastreabilidade**: cada task aponta para um requisito (RN-x); o `spec-reviewer` audita código vs spec.
- ✅ **Grafo Obsidian**: domínio ↔ specs ↔ ADRs conectados por `[[wikilinks]]`, navegáveis visualmente.
- ✅ **Subagentes isolam contexto**: `spec-writer`, `spec-designer`, `task-planner`, `implementer`, `spec-reviewer` - cada um com escopo e ferramentas mínimas.
- ⚠️ Overhead por feature (escrever specs antes de codar) - aceito conscientemente: o projeto prioriza qualidade sobre velocidade.
- ⚠️ Só **core plugins** do Obsidian (versiona limpo); nada de Dataview/community por ora.

## Links

- [[como-trabalhamos]] - o loop e os papéis dos agentes em detalhe.
- [[convencoes-codigo]], [[adr-001-stack]]
