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
- **Administrador Judicial** (`judicialAdministrator`) - não escreve no RMA, mas dá a **aprovação final**: lê, pede ajustes (lá e cá) até aprovar. O ajuste volta ao técnico e passa de novo pela coordenação antes de voltar ao AJ. Vê só os processos ligados a ele, com esteira e gráficos.
- **Recuperanda** (`debtor`) - empresa em recuperação; faz upload dos documentos. Cada recuperanda tem **um único login**.
- **Magistrado** (`judge`) - juiz do processo, externo, só leitura: vê o RMA e os gráficos padrão depois de **liberados para o magistrado**.

Cada pessoa tem **um só perfil**. O sistema é só da BEx. Contador e auditoria **não são usuários**: o contador é só cadastro com CRC, e a auditoria é só documento.

### Fluxo

- **RMA final** (`finalReport`) - o RMA depois da aprovação da coordenação **e da aprovação final do AJ**. Depois dele, o único passo no sistema é **registrar protocolo**.
- **Registrar protocolo** (`registerFiling`) - botão que o técnico clica depois de protocolar o RMA no portal do tribunal (fora do sistema). Registra o protocolo e **libera o RMA para o magistrado**, que só então vê o RMA e os gráficos.
- **Protocolo** - termo do v8 que **não é usado no sistema**. Subir o RMA no portal do tribunal (TJSP, TJGO etc.) e assinar com o certificado digital do AJ é manual e externo.
- **Competência** (`period`) - mês de referência do RMA e do lote de documentos.
- **Apenso I - Controle de Documentos** (`documentControl`) - checklist do mês com a situação de cada documento.
- **Apenso II - Pendências** (`pendingIssues`) - divergências do mês; a pendência não sanada passa para o RMA seguinte.
- **Consolidação substancial** (`substantive`) - as análises dos CNPJs podem ir ao RMA consolidadas.
- **Consolidação processual** (`procedural`) - a análise no RMA é individualizada por CNPJ.

### Escopo

- O sistema trata **só de recuperação judicial**. Falência está fora (cliente, 2026-10-08).
