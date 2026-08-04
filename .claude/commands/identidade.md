---
description: Define a identidade visual (importa de uma pasta ou gera opções com logos)
argument-hint: [caminho da identidade | vazio para gerar]
---

Defina a identidade visual do projeto usando o skill `generate-identity`.

Se `$ARGUMENTS` trouxer um caminho, trate como a fonte de identidade a importar e atualize `vault/00-domain/.identity-source` com ele. Se vazio, use o modo já marcado no scaffold (`vault/00-domain/.identity-source`): importar da pasta apontada, ou gerar N opções (`GENERATE:<n>`) via Artifact para o usuário escolher.

Ao final, `vault/00-domain/ui-referencia.md` deve estar preenchido e com um ADR de identidade registrado.
