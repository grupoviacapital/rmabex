# Glossário - Domínio RMABEx

> Termos do domínio, em PT-BR. No código, os identificadores em inglês correspondentes aparecem em `code`. Extraído do material em [[fontes-escopo]].

## Como usar

- Sempre que um conceito de negócio aparecer numa spec, ele deve estar aqui.
- Ligue termos relacionados com `[[wikilinks]]`.

## Processo e atores

- **RMA** (`monthlyReport`) - Relatório Mensal de Acompanhamento de Atividades. Peça processual mensal produzida pela administração judicial, estruturada conforme a Recomendação nº 72 do CNJ. Anatomia em [[anatomia-rma]].
- **Recuperação judicial / RJ** (`reorganization`) - processo judicial de soerguimento da empresa devedora.
- **Recuperanda** (`debtor`) - empresa em recuperação judicial, objeto do RMA. Um processo pode ter várias recuperandas (grupo econômico).
- **Administrador judicial / AJ** (`trustee`) - responsável por elaborar e protocolar o RMA. Assina com OAB.
- **Técnico** (`analyst`) - quem faz o check list, valida a análise da IA e completa o relatório.
- **Revisor / coordenação** (`reviewer`) - aprova o RMA antes do protocolo.
- **Check list de documentação** (`documentChecklist`) - conferência do que a recuperanda entregou contra o que é exigido. Reexecutável até a documentação ficar completa.
- **Protocolo** (`filing`) - ato de juntar o RMA aos autos. Estado final do fluxo em [[fluxo-processo]].
- **Apenso** (`appendix`) - anexo do RMA. O Apenso I é o controle de documentos solicitados e itens do CNJ.
- **Pendência** (`openItem`) - item não resolvido que transita de um RMA para o seguinte (pasta 38).
- **Esclarecimento** (`clarificationRequest`) - pedido formal de explicação à recuperanda, disparado por divergência ou alerta de variação.

## Documentos e contabilidade

- **Pasta de documentos** (`documentCategory`) - uma das 61 categorias canônicas do OneDrive. Ver [[pastas-documentos]].
- **Balancete de verificação** (`trialBalance`) - relação de saldos das contas. Base de tudo: alimenta o Balanço Patrimonial e é o lado direito de toda conciliação.
- **Conciliação** (`reconciliation`) - verificação de que o valor de um documento bate com uma conta específica do balancete.
- **Divergência** (`discrepancy`) - resultado de conciliação que não fecha. Pode ser marcada como relevante pelo técnico.
- **Alerta de variação** (`varianceAlert`) - sinalização automática quando uma conta varia acima do limiar (referência de 15% a 20%) contra o mês anterior.
- **DRE** (`incomeStatement`) - Demonstração do Resultado do Exercício.
- **Balanço patrimonial** (`balanceSheet`) - posição de ativo, passivo e patrimônio líquido.
- **Aging list** (`agingSchedule`) - segregação de contas a pagar/receber por faixa de vencimento: 0-30d, 30-90d, 90-180d, acima de 180 dias.
- **Passivo extraconcursal** (`nonSubjectLiabilities`) - obrigações não sujeitas aos efeitos da RJ.
- **Planilhão técnico** (`consolidationWorkbook`) - planilha legada onde o balancete é consolidado e os gráficos são gerados. Artefato a substituir ou manter por decisão de ADR.
- **Segmento** (`sector`) - ramo de atuação da recuperanda. Altera a estrutura do RMA: agronegócio ganha seção própria.

## Siglas fiscais e trabalhistas

- **GIA** - Guia de Informação e Apuração do ICMS.
- **EFD** - Escrituração Fiscal Digital (SPED). EFD-Contribuições apura PIS e COFINS; EFD ICMS/IPI apura ICMS.
- **GFIP** - guia de recolhimento de FGTS e informações à Previdência (INSS e FGTS).
- **ACC** - Adiantamento sobre Contrato de Câmbio.
- **CMV** - Custo da Mercadoria Vendida.
- **EBITDA** - resultado antes de juros, impostos, depreciação e amortização.
- **Dívida ativa** - débito inscrito para cobrança pela fazenda pública.
