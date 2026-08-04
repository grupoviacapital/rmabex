# Regras de Negócio - RMABEx

> Fonte de verdade das regras. Toda spec que toca uma regra referencia esta nota por `[[regras-negocio#RN-x]]`. Termos em [[glossario]], entidades em [[modelo-dados]].
>
> Derivadas de [[pastas-documentos]], [[fluxo-processo]] e [[anatomia-rma]]. A origem de cada regra está anotada, para que qualquer uma possa ser reconferida contra o material em [[fontes-escopo]].

## Formato

Cada regra é numerada `RN-x` e escrita em **EARS** (testável, sem ambiguidade):

- Ubíquo: "O SISTEMA DEVE ..."
- Evento: "QUANDO <gatilho>, O SISTEMA DEVE ..."
- Estado: "ENQUANTO <estado>, O SISTEMA DEVE ..."
- Condicional: "SE <condição>, ENTÃO O SISTEMA DEVE ..."

Regras marcadas com **(a confirmar)** foram derivadas do material legado mas não estão afirmadas de forma explícita em nenhum documento. Elas não entram em spec sem validação humana. Ver [[pendencias-externas]].

## Cadastro e competência

### RN-1 · Processo com múltiplas recuperandas

O SISTEMA DEVE permitir que um processo de recuperação judicial tenha uma ou mais recuperandas, cada uma com nome, um ou mais CNPJs e segmento.

*Origem: aba `Cadastros` do fluxo; aba `Controle_Docs..` com grupo de 7 empresas.*

### RN-2 · Competência mensal

O SISTEMA DEVE organizar documentos, balancetes e relatórios por competência mensal (ano e mês), vinculada a uma recuperanda.

### RN-3 · Segmento altera a estrutura do relatório

SE a recuperanda for do segmento agronegócio ou produtor rural, ENTÃO O SISTEMA DEVE incluir no RMA a seção de atividade rural, imediatamente antes da seção "Fatos relevantes", com os tópicos definidos em [[anatomia-rma]].

*Origem: `retorno_da_plataforma.txt` (Provimento 216, de 09 de março de 2026).*

## Classificação de documentos

### RN-4 · Taxonomia canônica

O SISTEMA DEVE reconhecer as 61 categorias de documento definidas em [[pastas-documentos]], identificadas por número canônico.

### RN-5 · Classificação tolerante

QUANDO um documento for classificado, O SISTEMA DEVE comparar o nome da pasta de origem contra a taxonomia canônica ignorando acentuação, caixa, espaços e separadores, e DEVE tratar o número da pasta apenas como pista secundária.

*Origem: divergência comprovada nos dados reais - a mesma categoria aparece como pasta 09 num cliente e 15 em outro.*

### RN-6 · Não classificado é estado de primeira classe

SE nenhuma categoria atingir o critério de correspondência, ENTÃO O SISTEMA DEVE registrar o documento como não classificado e apresentá-lo ao técnico para classificação manual, sem descartá-lo e sem atribuir categoria por proximidade.

### RN-7 · Categoria fora da taxonomia

QUANDO uma pasta não corresponder a nenhuma das 61 categorias, O SISTEMA DEVE registrá-la como categoria de evento (por exemplo "Esclarecimentos RMA-12-2025", "Diligência Complementar") e mantê-la associada à competência, sem forçá-la na taxonomia.

## Check list de documentação

### RN-8 · Relação de faltantes

QUANDO o técnico executar o check list de uma competência, O SISTEMA DEVE comparar os documentos presentes contra os exigidos e gerar a relação dos faltantes.

### RN-9 · Reexecução idempotente

O SISTEMA DEVE permitir reexecutar o check list da mesma competência quantas vezes forem necessárias, preservando o histórico de cada execução.

### RN-10 · Solicitação à recuperanda

QUANDO a relação de faltantes não for vazia, O SISTEMA DEVE enviar e-mail à recuperanda solicitando a documentação e e-mail ao técnico responsável com a relação.

## Balancete

### RN-11 · Balancete é a base

QUANDO o balancete de uma competência for importado, O SISTEMA DEVE registrar os saldos de ativo, passivo, patrimônio líquido e resultado, que servem de base ao Balanço Patrimonial e à DRE.

*Origem: pastas 7 e 8.*

### RN-12 · Toda conciliação tem o balancete como referência

O SISTEMA DEVE tratar o saldo do balancete como lado de referência de toda conciliação: a divergência é sempre "valor do documento contra saldo da conta".

## Conciliações

Cada regra abaixo corresponde a uma pasta de [[pastas-documentos]] do tipo `Conciliação`. Todas produzem o mesmo resultado: conciliado ou divergente, com a diferença apurada.

### RN-13 · Fluxo de caixa (pasta 5)

O SISTEMA DEVE conciliar o saldo final do fluxo de caixa realizado contra o saldo final da conta Caixa e equivalentes de caixa.

### RN-14 · Estoques (pasta 9)

O SISTEMA DEVE conciliar o saldo final do relatório de controle de estoques contra o saldo da conta Estoques.

### RN-15 · Imobilizado (pasta 10)

O SISTEMA DEVE conciliar o saldo final do relatório de ativos imobilizados contra o saldo da conta Imobilizado.

### RN-16 · Notas fiscais de compras (pasta 11)

O SISTEMA DEVE conciliar o total da relação de notas fiscais de compras contra a movimentação mensal da conta Fornecedores, calculada como saldo atual menos saldo do mês anterior.

### RN-17 · Extratos bancários (pasta 13)

O SISTEMA DEVE conciliar o saldo final de cada extrato bancário, individualizado por banco, contra o saldo da conta específica do mesmo banco.

### RN-18 · Contas de investimento (pasta 14)

SE houver contas de investimento ou aplicação, ENTÃO O SISTEMA DEVE conciliar o saldo final de cada extrato, por banco, contra a conta específica correspondente.

### RN-19 · Folha de pagamento (pasta 15)

O SISTEMA DEVE conciliar o saldo líquido do resumo da folha de pagamento contra o saldo da conta Salários a pagar.

### RN-20 · Rescisões (pasta 16)

O SISTEMA DEVE conciliar o saldo líquido do relatório de rescisões contratuais contra o saldo da conta Rescisões a pagar.

### RN-21 · ICMS (pasta 18)

O SISTEMA DEVE conciliar o valor pago no comprovante de ICMS contra o saldo apurado na GIA ou na EFD ICMS/IPI e contra o saldo da conta ICMS a pagar.

### RN-22 · PIS e COFINS (pasta 19)

O SISTEMA DEVE conciliar o valor pago no comprovante contra o saldo apurado na EFD-Contribuições e contra os saldos das contas PIS a pagar e COFINS a pagar.

### RN-23 · Parcelamento tributário (pasta 20)

O SISTEMA DEVE conciliar o valor do demonstrativo de adesão a parcelamento contra o saldo da conta Parcelamentos tributários.

### RN-24 · INSS e FGTS (pasta 21)

O SISTEMA DEVE conciliar o valor pago no comprovante contra o saldo apurado na GFIP e contra os saldos das contas INSS a pagar e FGTS a pagar.

### RN-25 · Demais impostos (pasta 22)

O SISTEMA DEVE conciliar o valor pago de ISS, Funrural e demais impostos contra o saldo apurado no relatório de cada imposto e contra os saldos das contas correspondentes.

### RN-26 · Dívida ativa (pasta 23)

O SISTEMA DEVE conciliar o valor do relatório de inscrição na dívida ativa contra o saldo das contas de dívida ativa.

### RN-27 · Contas a pagar (pasta 25)

O SISTEMA DEVE conciliar o total de contas a pagar contra os saldos das contas Fornecedores, outras contas a pagar e empréstimos e financiamentos a pagar, e DEVE segregar o relatório nas faixas de vencimento 0-30d, 30-90d, 90-180d e acima de 180 dias.

### RN-28 · Contas a receber (pasta 26)

O SISTEMA DEVE conciliar o total de contas a receber contra o saldo da conta Clientes a receber, e DEVE segregar o relatório nas mesmas faixas de vencimento (aging list).

### RN-29 · ACC (pasta 35)

O SISTEMA DEVE conciliar o saldo de adiantamento sobre contrato de câmbio contra o saldo da conta Adiantamento de Contrato de Câmbio/ACC.

### RN-30 · Situação fiscal (pasta 40)

O SISTEMA DEVE conciliar o saldo do relatório de situação fiscal contra a soma das contas de impostos a recolher.

### RN-31 · Receita bruta (pasta 41)

O SISTEMA DEVE conciliar o total da relação analítica de notas fiscais contra a movimentação mensal da conta Receita bruta.

### RN-32 · Passivo fiscal (pasta 45)

O SISTEMA DEVE conciliar o saldo do relatório de impostos contra a soma das contas de impostos a recolher.

### RN-33 · Tolerância de conciliação **(a confirmar)**

O SISTEMA DEVE considerar conciliado o par documento/conta cuja diferença absoluta estiver dentro da tolerância configurada.

*Nenhum documento do escopo define tolerância. Sem ela, arredondamento de centavos gera divergência falsa. Pendente de definição da área técnica.*

## Alertas e divergências

### RN-34 · Alerta de variação

QUANDO o saldo de uma conta do balancete variar acima do limiar configurado em relação à mesma conta no mês anterior, O SISTEMA DEVE gerar alerta de atenção para o analista, identificando conta, valores comparados e percentual de variação.

*Origem: `retorno_da_plataforma.txt`. O documento cita "geralmente superior a 15% ou 20%"; o valor exato e o escopo de configuração estão pendentes.*

### RN-35 · Relevância é decisão humana

O SISTEMA DEVE permitir que o técnico marque cada divergência e cada alerta como relevante ou não relevante, e DEVE registrar quem marcou e quando.

### RN-36 · Divergência relevante gera esclarecimento

QUANDO houver divergência marcada como relevante, O SISTEMA DEVE permitir gerar pedido de esclarecimento à recuperanda e enviá-lo por e-mail.

### RN-37 · Pendências transitam entre competências

SE uma pendência não for resolvida na competência em que foi aberta, ENTÃO O SISTEMA DEVE mantê-la aberta e apresentá-la na seção de pendências do RMA da competência seguinte.

*Origem: pasta 38 e seção 17 do RMA.*

## Geração do RMA

### RN-38 · Estrutura em seções ordenadas

O SISTEMA DEVE montar o RMA como lista ordenada de seções, permitindo que a numeração tenha lacunas e que os subitens variem por caso.

*Origem: o exemplar real pula a seção 13 e tem subitens de "Fatos relevantes" específicos do processo.*

### RN-39 · Rastreabilidade da origem

O SISTEMA DEVE registrar, para cada valor apresentado no RMA, de qual documento ou conta ele foi derivado.

### RN-40 · Preenchimento manual

O SISTEMA DEVE permitir que o técnico preencha manualmente qualquer informação que a análise automática não tenha conseguido produzir.

*Origem: caixa "Insere as informações manualmente" no fluxo.*

### RN-41 · Indicadores da seção 12 **(a confirmar)**

O SISTEMA DEVE calcular e apresentar os índices de liquidez, a relação receita x custo (CMV), a relação receita x resultado e o EBITDA.

*As fórmulas não estão em nenhum documento do escopo. Pendente da área técnica.*

## Fluxo de aprovação e protocolo

### RN-42 · Estados do RMA

O SISTEMA DEVE controlar o RMA pelos estados observados no fluxo: em elaboração, revisar, aprovado e protocolado.

*A máquina de estados completa, incluindo transições de retorno, ainda precisa ser fechada em spec.*

### RN-43 · Revisão obrigatória antes da aprovação

ENQUANTO o RMA estiver no estado revisar, O SISTEMA DEVE impedir o protocolo e DEVE permitir ao revisor modificar o conteúdo ou confirmar a aprovação.

### RN-44 · Notificação na aprovação

QUANDO o RMA for aprovado, O SISTEMA DEVE enviar e-mail à coordenação e ao técnico responsável.

### RN-45 · Protocolo

QUANDO o RMA for protocolado, O SISTEMA DEVE arquivar o documento no diretório de protocolados e enviar e-mail comunicando o protocolo.

## Dados sensíveis

### RN-46 · Dados de terceiros não saem do ambiente

O SISTEMA DEVE tratar documentos da recuperanda como dados sensíveis de terceiros, e NÃO DEVE enviá-los a serviço externo sem base legal e sem registro do envio.

*Ver [[seguranca]] e a pendência de LGPD em [[pendencias-externas]].*
