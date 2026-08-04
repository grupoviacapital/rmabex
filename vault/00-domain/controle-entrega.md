# Controle de Entrega - o que 75 meses de uso real mostram

> Fonte: as **104 planilhas de controle de entrega** encontradas em `OLD_RMA/escopo/OneDrive/DIPLOMATA/` e `OneDrive/GERATHERM/`, lidas célula a célula em 04/08/2026. O template em branco correspondente está em `escopo/01 - Controle de entrega de documentos 2025.xlsx`.
>
> Esta nota é a base de evidência da obrigatoriedade de documento ([[perguntas-cliente]] P-5) e do vocabulário de status (P-33). Ela **corrige** duas afirmações anteriores feitas sobre o mesmo material.

## O que é o arquivo

A planilha que a recuperanda preenche todo mês, uma por competência. Cabeçalho com nome da empresa, mês, ano e número do processo; depois uma linha por documento pedido.

Colunas: `ITEM`, `DOCUMENTO`, `SUB-ITEM`, `RECUPERANDA`, `APRESENTADO PELA RECUPERANDA`, `STATUS 1`, `INFORMAÇÃO ADICIONAL`, `DUVIDAS / ESCLARECIMENTOS`, `STATUS 2`. Cabeçalho idêntico nos 104 arquivos.

## Quantas planilhas existem de fato

| | Quantidade |
|---|---|
| Arquivos de planilha de controle | **104** |
| Delas, **preenchidas** | **75** (43 DIPLOMATA, 32 GERATHERM) |
| Delas, templates em branco | 29 |
| Linhas de item lidas no total | 3.900 |

Os 29 "vazios" não são meses sem controle: são **cópias em branco do template guardadas na mesma pasta do mês**, distinguíveis pelo nome. O arquivo preenchido leva mês no nome (`... 06_2025.xlsx`); o template leva só o ano (`... 2025.xlsx`). Os dois convivem na mesma pasta.

Uma busca ingênua encontra 105 arquivos. O 105º é `~$Controle de entrega de documentos.xlsx`, arquivo de trava do Excel, não uma planilha.

## Onde a informação realmente está

**Na coluna `APRESENTADO PELA RECUPERANDA`, em texto livre.** Não há lista suspensa em nenhum dos 104 arquivos.

As colunas de vocabulário controlado estão praticamente mortas:

| Coluna | Linhas preenchidas | Em quantas planilhas |
|---|---|---|
| `APRESENTADO PELA RECUPERANDA` | 2.926 | 75 |
| `STATUS 1` | 110 | **3** (GERATHERM, jan e fev/2024) |
| `DUVIDAS / ESCLARECIMENTOS` | **0** | 0 |
| `STATUS 2` | **0** | 0 |

Cada cliente tem sua convenção de escrita, e elas não se parecem:

- **DIPLOMATA**: `Apresentado pasta one drive`, `Não possui tal operação`, `Não Houve`.
- **GERATHERM**: caixa alta e descritivo do que foi enviado - `RELATÓRIO EM EXCEL ENVIADO`, `COMPROVANTES ENVIADOS`, `EXTRATOS DE CONTA CORRENTE ENVIADOS`, `NÃO EXISTE`, `NÃO EXISTE ESSA OBRIGAÇÃO`, `DISPENSA GIA`.

São 41 grafias distintas para o que são quatro estados. O sistema novo, que oferece lista suspensa, elimina o problema na origem, mas **precisa migrar o histórico por normalização de texto**, não por igualdade.

## A obrigatoriedade, medida

Classificação por **documento**, não por número de item (ver o deslocamento na seção seguinte). Base: 75 meses preenchidos dos dois clientes. "n meses" é o total de meses em que aquele documento aparece na lista.

### Sempre apresentado nos dois clientes, em 100% dos meses

Fluxo de Caixa mensal · Fluxo de Caixa Projetado 6 meses · Balancete de Verificação · DRE · Relatório de controle de estoque · Relatório de ativos imobilizados · Relação totalizada de NF de compra · Comprovantes de pagamento a fornecedores · Extratos bancários · Resumo da folha de pagamento · Comprovante de demais impostos · Inscrição na dívida ativa · Declaração assinada pelo contador · Contas a Pagar · Obrigação de entregar (15 documentos, 75/75)

Mais três que não existiam no início da série, mas nunca faltaram depois: EFD-Contribuições (74/74), GFIP e FGTS/INSS (55/55), Contas a Receber (53/53).

**Este é o núcleo obrigatório observado: 18 documentos.**

### Condicionais de verdade

| Documento | Apresentado | Não aplicável |
|---|---|---|
| Demonstrativo de Adesão a Parcelamentos | 70/75 | 4 |
| Comprovantes de pagamento aos credores concursais | 70/75 | 5 |
| Pessoas Jurídicas contratadas | 66/75 | 0 (9 meses "não houve") |
| Rescisões contratuais | 47/75 | 0 (28 meses "não houve") |
| Extrato de contas de investimento/aplicações | 45/75 | 30 |
| Adiantamento de contrato de câmbio (ACC) | 26/75 | 43 |
| G.I.A e comprovante de ICMS | 17/37 | 20 |
| Contingência | 4/75 | 71 |

### Nunca aplicável em 75 meses

Obrigação de dar · Obrigação de fazer · Obrigações Ilíquidas · Cessão fiduciária de títulos e direitos creditórios · Alienação fiduciária · Arrendamento Mercantil

Seis documentos que **nenhum dos dois clientes entregou uma única vez**. São garantias e obrigações do plano: existem na lista porque podem existir na empresa, não porque costumam existir.

### Os quatro primeiros itens não são documentos

`Houve alteração na Atividade empresarial`, `Houve alteração na Estrutura Societária`, `Houve abertura ou fechamento de estabelecimentos` são perguntas de sim/não, respondidas `Não Houve` em 75 de 75 meses. `Segmento de atuação` é campo de texto livre (a DIPLOMATA responde sempre "Prestação de Serviços de Abate e Ind.Ração e Esmagamento Soja").

Consequência de modelo: o check list mistura **item de questionário** e **item de documento**. Tratar tudo como "documento a entregar" gera quatro pendências falsas por mês em todo cliente.

### ICMS depende da jurisdição, não do cliente

O mesmo dever fiscal aparece com documento diferente: a DIPLOMATA entrega `SPED comprovante de entrega do ICMS` (38/38); a GERATHERM entrega `G.I.A e comprovante de pagamento do ICMS` (17/37, com 20 meses de `DISPENSA GIA`). A GIA é obrigação estadual paulista; o SPED Fiscal é federal. A condição de obrigatoriedade aqui é **a UF do estabelecimento**, não o segmento nem o estágio processual.

## A numeração se desloca entre clientes

A partir do item 23 os dois clientes deixam de estar alinhados: a DIPLOMATA põe "Inscrição na dívida ativa" no item 23, a GERATHERM põe no 30. Do 23 em diante, o mesmo número significa documentos diferentes nos dois clientes.

| Item | DIPLOMATA | GERATHERM |
|---|---|---|
| 23 | Inscrição na dívida ativa | Declaração do contador |
| 25 | Contas a Pagar | Contas a Receber |
| 28 | Obrigação de fazer | Obrigação de entregar |
| 30 | Obrigações Ilíquidas | Inscrição na dívida ativa |
| 37 | Última Alteração Contratual | Relação analítica de NF emitidas |

**Isto invalida qualquer cruzamento por número de item entre clientes.** A primeira versão desta análise foi feita por número e concluiu que os dois clientes divergiam quanto a "Obrigação de fazer" e "Obrigação de entregar"; refeita por documento, não divergem. O erro está registrado em [[estado-atual]].

Há uma segunda pista do mesmo problema dentro da própria DIPLOMATA: o `SUB-ITEM` desalinha do `ITEM` a partir do 31 (item 31 leva sub-item `32.1`, item 36 leva `37.1`). A lista perdeu um item em algum momento e os sub-itens não foram renumerados.

## A lista de itens muda com o tempo e com o cliente

| Cliente | Período | Itens |
|---|---|---|
| DIPLOMATA | 11/2022 a 02/2026 | 36, estável |
| GERATHERM | 2022 a 2023 | 36 |
| GERATHERM | jan-fev/2024 | 38 |
| GERATHERM | 2024 a 02/2026 | 39 |
| Template atual (ambos) | 2025-2026 | 42, e uma cópia com 44 |

O template distribuído hoje pede 42 itens; a GERATHERM entrega contra uma lista de 39 e a DIPLOMATA contra uma de 36. Os itens acrescentados na GERATHERM foram Situação Fiscal, Razão Fiscal e Relação analítica de NF emitidas.

Consequência de modelo: a lista de itens é **versionada por cliente e por período**. Não é constante do sistema, é dado. Um check list de uma competência antiga precisa ser reconstituído com a lista vigente naquele mês, senão o histórico passa a acusar faltas que nunca foram pedidas.

## A segunda aba é de outro cliente

99 dos 104 arquivos têm uma segunda aba, `Controle_Docs..`, com:

- Cabeçalho `Grupo TTT` e processo `115033-97.2016.809.0051`, **que não é nenhum dos dois clientes**.
- 19 documentos x 7 empresas (TTT, RMJ, TEC, TEF, TCA, NASSON, TH), uma linha por par documento/empresa, sub-item no formato `item.índice_da_empresa`.
- **Zero células preenchidas**, nos 99 arquivos.

Duas leituras, ambas úteis:

1. **O layout multi-empresa existe e é o modelo certo para grupo econômico**: um item se desdobra em uma linha por empresa. Mas em 99 planilhas ele **nunca foi usado**, o que confirma que o controle real hoje é por empresa, uma planilha cada. Ver [[perguntas-cliente]] P-4.
2. **Vaza identificador de terceiro.** O número do processo do Grupo TTT viaja dentro de todo arquivo de dois outros clientes, há anos, por cópia de template. É o tipo de coisa que o sistema novo tem de tornar impossível. Ver [[seguranca]].

## O que isto decide

| Decisão | Evidência |
|---|---|
| Item de check list tem tipo: documento ou questionário | 4 itens de questionário em 100% dos meses |
| Obrigatoriedade é atributo do par cliente/período, não da pasta | listas de 36, 38, 39, 42 e 44 itens convivendo |
| A chave do item é o documento, não o número | deslocamento de uma posição a partir do item 23 |
| Migração do histórico exige normalização de texto | 41 grafias para 4 estados, sem lista suspensa |
| O check list precisa da dimensão empresa | aba multi-empresa do Grupo TTT |
| Segundo ciclo de cobrança não existe na prática | 0 preenchimentos em 3.900 linhas |

## Links

- Taxonomia das 61 pastas: [[pastas-documentos]]
- Perguntas que esta nota fecha ou estreita: [[perguntas-cliente]]
- Regras derivadas: [[regras-negocio]]
- Entidades afetadas: [[modelo-dados]]
