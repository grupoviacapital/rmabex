---
name: generate-identity
description: Define a identidade visual do projeto, importando de uma pasta existente ou gerando opções com logos simples. Use quando o usuário quer criar/definir a identidade visual, o tema, a paleta e o logo, ou pede "/identidade", "gerar identidade", "definir a cara do produto".
---

# Identidade visual

Este skill define a identidade visual e a grava como fonte de verdade em `vault/00-domain/ui-referencia.md`.

## Procedimento

1. Leia o marcador `vault/00-domain/.identity-source` e o `vault/00-domain/.identity-brief`.
2. Delegue ao subagente **brand-designer** (via Agent tool), passando o modo detectado:
   - **IMPORTAR** (há caminho/pasta de identidade): ele lê os assets e extrai os tokens.
   - **GERAR** (marcador `GENERATE:<n>`): ele projeta `n` direções e publica um **Artifact** para você escolher.
3. No modo GERAR, **pare para a escolha** do usuário (ou combinação de elementos) antes de gravar.
4. Confirme que `vault/00-domain/ui-referencia.md` foi escrito e que existe um ADR de identidade.
5. Aponte o próximo passo: a spec de **Shell de UI e Tema** no [[ROADMAP]] implementa esses tokens.

## Regras

- Não invente identidade se houver fonte para importar: extraia dela.
- Logos são simples (direção de marca), não arte final.
- A escolha do usuário é obrigatória no modo GERAR; nunca decida o visual sozinho.
