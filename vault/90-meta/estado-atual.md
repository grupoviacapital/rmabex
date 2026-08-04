# Estado Atual - ponto de retomada

> **Leia esta nota primeiro ao abrir uma sessão nova.** Ela resume onde o projeto está, o que já foi decidido, o que está travado e em quem. Atualize-a ao fim de cada bloco de trabalho.
>
> Última atualização: 04/08/2026.

## Onde estamos

**Nenhuma linha de código foi escrita. Nenhuma spec foi aberta.** Por determinação do usuário, nada de spec até as perguntas ao cliente serem respondidas.

O que foi feito até aqui:

1. O material legado foi indexado, e o escopo foi **lido integralmente**, arquivo por arquivo, incluindo shapes de Excel, comentários de Word, macros VBA e as capturas de tela em resolução nativa.
2. Os três repositórios do sistema anterior foram minerados.
3. O domínio foi documentado em 12 notas.
4. As perguntas ao cliente foram consolidadas, filtradas e a primeira rodada começou a ser enviada.
5. **As 104 planilhas de controle de entrega foram lidas célula a célula** (3.900 linhas de item). Isso destravou a spec 004, fechou a P-32 e corrigiu a P-33. Ver [[controle-entrega]].
6. **O escopo foi varrido atrás de limiar e tolerância**, incluindo os quadros do RMA, que são imagens. Achou a escala de variação que o técnico usa na prática e a prova de que a tolerância de conciliação é zero. Destravou as specs 006 e 007. Ver [[regras-negocio#RN-33]] e [[regras-negocio#RN-34]].

**Nenhuma pergunta trava spec hoje.** As sete podem ser escritas. O que resta com o cliente é confirmação de padrão, e um único ponto de desenho: se o alerta de variação tem piso de valor em reais além do percentual.

## Decisões do cliente, com data

| Data | Decisão | Quem | Onde está registrada |
|---|---|---|---|
| 04/08/2026 | As fórmulas de EBITDA, liquidez, CMV e resultado são as da planilha padrão | Gisele, coordenadora técnica | [[regras-negocio#RN-41]] |
| 04/08/2026 | **Kanitz sai de escopo.** O código do repositório KANTIZ veio de outro projeto e deve ser desconsiderado | Luiz | [[sistema-legado]] |
| 04/08/2026 | A planilha que temos é de teste; existe uma mais atual, **ainda não enviada** | Luiz | [[formatos-balancete]] |
| 04/08/2026 | O insumo é o **balancete**, e ele chega em PDF, Excel e outros formatos | Luiz | [[formatos-balancete]] |
| 04/08/2026 | O balancete é o **eixo da referência cruzada** dos demais documentos da pasta | Luiz | [[regras-negocio#RN-12]] |
| 04/08/2026 | **Começar pela GERATHERM** | Luiz | [[formatos-balancete]] |
| 04/08/2026 | A estrutura de pastas **será criada na plataforma**; o OneDrive é temporário | Luiz | [[formatos-balancete]] |
| 04/08/2026 | **Não há requisito de migração**: a base do sistema anterior pode ser descartada | Luiz | [[formatos-balancete]] |
| 04/08/2026 | **"Usa as informações do OneDrive. Começa por essa recuperanda."** Não existe planilha nova: o insumo é a pasta do OneDrive, e o ponto de partida é a **GERATHERM**, competência **01.2026**, pasta **07-Balancete de Verificação** (marcada no print) | Luiz | [[fontes-escopo]], [[formatos-balancete]] |
| 04/08/2026 | **O `01.BASE RELATÓRIO` é a ferramenta interna da AJ.** *"Usamos as informações que estão no OneDrive para gerar as informações nessa planilha, gerando gráficos que depois são copiados e colocados de forma manual no RMA."* É o ciclo inteiro que o projeto substitui | Luiz | [[motor-calculo]] |
| 04/08/2026 | Enviou o `XPT S.A_balancete_mensal_xi teste.xls`: **um quinto formato de balancete**, export de Crystal Reports, com o movimento do mês em coluna própria | Luiz | [[formatos-balancete]] |

## Pendente com o cliente

**Resolvido em 04/08/2026.** A pergunta era se existia uma planilha "mais atual" por enviar. O Luiz respondeu: *"usa as informações do OneDrive, começa por essa recuperanda"*, com print da pasta `GERATHERM / 2026 / 01.2026` e a pasta `07-Balancete de Verificação` marcada.

**Leitura correta:** nunca houve planilha nova. O insumo é a **pasta do OneDrive**, não um arquivo Excel de cálculo. O `01.BASE RELATÓRIO` é ferramenta interna da AJ, e é exatamente o que este projeto substitui. Duas das nossas hipóteses anteriores estavam erradas, e a terceira era esta.

Verificações de apoio, para não refazer o caminho:

- **Não existe planilha de cálculo dentro das pastas de cliente.** Varredura dos **2.083 arquivos Excel** do escopo pela assinatura de abas do motor (`BS`, `P&L + EBITDA`, `INDICE`, `FOLHA DE ROSTO`, `Dados para Graficos`, `BdMeses`): só dois arquivos batem, o `xi teste` e o da GIANNINI, e nenhum dos dois está em `OneDrive/`.
- **Os três defeitos do template continuam na instância mais nova** (GIANNINI, 10/03/2026, contra 02/03/2026 do `xi teste`), verificados célula a célula: `P&L + EBITDA` linha 45 com referência `40.G` nos dois, e `FOLHA DE ROSTO!N3` com a mesma `=HLOOKUP(N2,INDICE!$B$17:$M$34,2,FALSE)` terminando na coluna M. A análise de [[motor-calculo]] **se sustenta**.
- **`GERATHERM/2026/01.2026` é a última competência completa**: 397 arquivos, contra 87 em 02.2026. As pastas de 03 a 12/2026 já existem, vazias, criadas com antecedência. Pasta vazia de competência futura **não é documento faltante**, e o check list precisa saber disso.

**A enviar:** os três blocos de [[perguntas-cliente]]. **O bloco 1 está liberado**: não há planilha nova para esperar, e a pergunta do `40.G` continua valendo porque define se o nosso EBITDA estorna Compromissos RJ.

## O que está travado, e em quem

| Spec | Situação |
|---|---|
| 001 Scaffold, 002 Cadastro, 003 Taxonomia, 005 Balancete | Sem bloqueio técnico. **Travadas por decisão do usuário**, não por falta de informação. |
| 004 Check list | **Destravada em 04/08/2026.** A obrigatoriedade foi medida em 75 meses reais ([[controle-entrega]]); o que falta é o cliente revisar a tabela, e ela é dado editável de qualquer forma. |
| 006 Conciliação | **Destravada em 04/08/2026.** A tolerância na prática é zero, e a divergência se encerra por justificativa registrada. Ver [[regras-negocio#RN-33]] e [[regras-negocio#RN-33.1]]. |
| 007 Alertas | **Destravada em 04/08/2026** com 15% como padrão configurável. Resta um ponto de desenho: se a regra tem piso de valor em reais além do percentual. Ver [[regras-negocio#RN-34]]. |

## Mapa das notas

| Preciso saber sobre | Leia |
|---|---|
| Que arquivo do escopo contém o quê | [[fontes-escopo]] |
| As 61 categorias de documento e a regra de cada uma | [[pastas-documentos]] |
| De qual pasta sai cada seção do relatório | [[mapa-secao-pasta]] |
| Como o relatório é calculado, e a coluna "Ref 1" | [[motor-calculo]] |
| Os quatro layouts de balancete | [[formatos-balancete]] |
| Qual documento é obrigatório, medido em 75 meses reais | [[controle-entrega]] |
| A estrutura das 18 seções do RMA | [[anatomia-rma]] |
| O processo, manual e automatizado | [[fluxo-processo]] e [[fluxos-area-tecnica]] |
| O que o sistema anterior fez, e onde falhou | [[sistema-legado]] |
| O que as telas revelam | [[telas-legado]] |
| As regras numeradas | [[regras-negocio]] |
| As entidades | [[modelo-dados]] |
| O que falta perguntar | [[perguntas-cliente]] |

Material de referência não versionado fica em `OLD_RMA/`. Os fluxogramas renderizados estão em `OLD_RMA/escopo/GoogleDrive/fluxogramas/`, e os gráficos do RMA em `OLD_RMA/escopo/GoogleDrive/graficos-rma/`.

Página HTML com as fórmulas, compartilhável com o cliente: `vault/90-meta/formulas-sistema-anterior.html`, publicada em https://claude.ai/code/artifact/d5a7e9d3-210d-4d0e-87cc-9b1ee1e3e658

## Erros já cometidos, para não repetir

Registrados porque uma sessão nova pode refazer o mesmo caminho.

1. **Classifiquei arquivos pelo nome sem abrir.** O `01.BASE RELATÓRIO` foi marcado como "apoio" quando é o motor de cálculo. As fórmulas que eu ia perguntar ao cliente estavam dentro dele.
2. **Li o rótulo em vez da fórmula.** A linha "Ativo Não Circulante" da aba `INDICE` na verdade desconta investimentos, imobilizado e intangível: é o realizável a longo prazo.
3. **Resumi material em vez de ler.** Montei as telas em grade reduzida e perdi texto; a leitura em resolução nativa achou 24 inconsistências.
4. **Generalizei de uma amostra.** Registrei a estrutura do balancete da XPT como se fosse regra de domínio. Existem quatro layouts diferentes.
5. **Tratei documentação do KANTIZ como autoridade.** O cliente depois informou que aquele repositório é de outro produto.

6. **Contei ocorrências sem olhar a distribuição.** Dei a P-33 como "resolvida pelo uso real em 105 planilhas". As 110 ocorrências estavam em **3 planilhas**, de um cliente, em dois meses. Volume de dado não é cobertura de dado.
7. **Cruzei dois clientes pelo número do item.** As listas de check list se deslocam em uma posição a partir do item 23, então "item 28" é um documento na DIPLOMATA e outro na GERATHERM. A primeira versão da análise de obrigatoriedade acusou divergências que não existiam. Refeita chaveando pelo nome do documento.

O padrão é o mesmo nos sete: **trocar o material real por um resumo dele**, ou trocar a chave certa por uma conveniente. Em escopo, ler o conteúdo antes de decidir o que ele é, e conferir em quantas fontes distintas cada evidência aparece.

## Próximo passo

Aguardar a análise do [[perguntas-cliente]] pelo usuário e o envio dos blocos. Nada de spec até lá.
