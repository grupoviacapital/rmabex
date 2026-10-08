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

### Fluxo

- **RMA final** (`finalReport`) - o RMA gerado pela plataforma depois da aprovação da coordenação. Depois dele, o único passo no sistema é **liberar para o magistrado**.
- **Liberar para o magistrado** (`releaseToJudge`) - botão que a coordenação clica depois de subir o RMA no portal do tribunal; só então o magistrado vê o RMA e os gráficos.
- **Protocolo** - termo do v8 que **não é usado no sistema**. Subir o RMA no portal do tribunal (TJSP, TJGO etc.) e assinar com o certificado digital do AJ é manual e externo.
