# Glossário - Domínio RMABEx

> Termos do domínio, em PT-BR. No código, os identificadores em inglês correspondentes aparecem em `code`. Preencha conforme o domínio do projeto.

## Como usar

- Um termo por linha ou seção.
- Sempre que um conceito de negócio aparecer numa spec, ele deve estar aqui.
- Ligue termos relacionados com `[[wikilinks]]`.

## Termos

### Perfis de acesso

Lista fechada pelo cliente em 2026-10-08 (detalhe e dúvidas em [[../05-descoberta/camadas/0-plataforma|0-plataforma]]). Os nomes em `code` são proposta.

- **Administrador** (`admin`) - usuários, checklist padrão, modelos e parâmetros.
- **Coordenação** (`coordinator`) - equipe da BEx que revisa e aprova ou devolve o RMA e o parecer.
- **Técnico** (`technician`) - equipe da BEx que cadastra o processo, monta o checklist, analisa e corrige o RMA. O cliente também chama de **Colaborador**; o nome usado é sempre **Técnico**, como nos desenhos.
- **Administrador Judicial** (`judicialAdministrator`) - papel no sistema a confirmar (D-28).
- **Recuperanda** (`debtor`) - empresa em recuperação; faz upload dos documentos.
- **Magistrado** (`judge`) - juiz do processo, externo; papel no sistema a confirmar (D-29).

Contador e auditoria **não são usuários**: o contador é só cadastro com CRC, e a auditoria é só documento.
