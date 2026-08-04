# Motor de Cálculo - engenharia reversa da planilha padrão

> Fonte: `OLD_RMA/escopo/01.BASE RELATÓRIO_xi teste.XLSM`, 14 abas, lidas integralmente célula a célula, incluindo o VBA. Ver [[fontes-escopo]].
>
> Esta planilha **é** o motor do RMA. Tudo que o sistema novo precisa calcular está aqui, e a arquitetura dela deve ser preservada em conceito, não em forma.

## Arquitetura em quatro níveis

```
Balancete externo (.xlsx)
  -> [macro VBA, via ADODB] -> BALANCETES (razão completo, meses lado a lado, coluna "Ref 1")
       -> [SUMIF por Ref 1] -> BS (balanço) e "P&L + EBITDA" (DRE)
            -> [referência direta] -> INDICE (o cubo canônico de indicadores)
                 -> [HLOOKUP por nome do mês] -> FOLHA DE ROSTO e Dados para Graficos
```

Só existem quatro níveis de cálculo real. O resto é entrada manual (Folha, Estoques, Impostos, fluxo de caixa) ou espelho.

## O elo que faltava: a coluna "Ref 1"

Cada conta analítica do balancete recebe um **código de referência** que diz em qual linha do relatório ela entra. O dicionário está na aba `BdMeses`, com **90 códigos**. As 966 contas analíticas do balancete de exemplo estão **100% classificadas, sem uma lacuna**.

Isto é exatamente o `ContaContabil.canonicalRole` de [[modelo-dados]] - só que já existe, já está especificado, e tem nome próprio. O novo sistema deve adotá-lo.

Blocos e exemplos de código:

| Bloco | Códigos | Exemplos |
|---|---|---|
| Ativo circulante | `A` a `O` | `A` Caixa e Equivalentes, `B` Aplicações, `C` Contas a receber, `D` Estoque |
| Ativo não circulante | `P` a `J1` | `V` Realizável a Longo Prazo, `B1` Investimentos, `C1` Imobilizado Líquido, `D1` Intangível |
| Passivo circulante | `AA` a `II1` | `AA` Empréstimos, `BB` Fornecedores, `CC` Obrigações Trabalhistas, `II` Credores RJ |
| Passivo não circulante | `PP` a `FF1` | `QQ` Empréstimos, `RR` Obrigações tributárias parceladas, `SS` Provisões para contingências |
| Patrimônio líquido | `GG1`, `HH1` | Capital Social, Lucro/Prejuízo Acumulado |
| Receitas | `10.A` a `10.K` | `10.A` Receita de Vendas, `10.F` Mercado Externo |
| Deduções | `20.A` a `20.C` | Impostos incidentes, devoluções, abatimentos |
| Custos | `30.A` a `30.J` | `30.A` CMV/CPV, `30.E` Depreciações e Amortizações |
| Despesas | `40.A` a `40.L` | `40.J` Despesas Financeiras, `40.G` **Compromissos RJ** |
| Outras receitas | `50.A` a `50.C` | `50.B` Receitas Financeiras |
| Impostos sobre o lucro | `CSLL`, `IRPJ` | |
| Controle | `ATIVO`, `PASSIVO`, `RESULTADO` | usados pelas linhas de conferência |

O balanço e a DRE são montados por `SUMIF` sobre essa coluna. A DRE ainda aplica **des-acumulação**: valor do mês = acumulado do mês menos acumulado do mês anterior, com o sinal invertido, porque receita no balancete é credora.

## As quatro invariantes de conferência

A planilha tem seis linhas de "Check" e quatro delas são invariantes reais que o sistema novo deve executar e **falhar alto**:

1. **`Σ(refs do ativo) = conta raiz 1`** - garante que nenhuma conta ficou sem Ref.
2. **`Σ(refs do passivo) = conta raiz 2`**, excluindo o resultado do exercício, que o balancete ainda não transferiu ao PL.
3. **`Ativo + Passivo = 0`** - equação patrimonial fechada (passivo é negativo no balancete).
4. **`Σ(contas raiz 3 a 8, des-acumuladas) = Resultado do Exercício da DRE`**.
5. **`Lucro Líquido recomposto no INDICE = Resultado do Exercício da DRE`** - detecta linha de despesa esquecida na agregação.

Todas fecham em zero nos oito meses do exemplo. São testes prontos para a spec 005.

## Erro grave: o EBITDA soma "Compromissos RJ" como depreciação

A linha 45 da aba `P&L + EBITDA` tem o rótulo **"Depreciações e Amortizações"**, mas a referência dela é **`40.G`**, que no dicionário significa **"Compromissos RJ"**.

O cálculo do EBITDA estorna essa linha (`= -E29 - E45`) como se fosse depreciação. Ou seja: **compromissos do plano de recuperação judicial estão sendo somados de volta ao EBITDA**.

No balancete de exemplo o efeito é nulo, porque nenhuma conta usa `40.G` nem `30.E`. Numa recuperanda com compromissos contabilizados, o EBITDA sai inflado.

A fórmula que [[regras-negocio#RN-41]] registra continua correta em conceito. O que está errado é **de onde a planilha tira a depreciação**. No sistema novo, a depreciação vem de `30.E` e de uma referência dedicada de despesa - nunca de `40.G`.

Segundo problema no mesmo bloco: `EBITDA = SUM(E62:E70)` inclui a linha 63, que é a **linha de conferência**. Se o check não fechar, o erro entra silenciosamente no EBITDA. O correto é somar as parcelas explicitamente.

## Defeitos que explicam sintomas visíveis

**O mês de fechamento não chega ao relatório.** Os `HLOOKUP` da capa e dos gráficos usam faixas que terminam em junho ou julho, enquanto o `INDICE` vai até agosto. Resultado: faturamento, resultado líquido e todos os índices de liquidez do **mês de referência aparecem como `#N/A` na capa**. As faixas foram escritas quando o cubo ia até junho e nunca estendidas.

**A análise vertical da DRE está congelada em janeiro.** As linhas analíticas usam `$E$16` absoluto, dividindo todos os meses pela receita bruta de janeiro. Em junho o erro chega a 25%. Só os subtotais usam o denominador correto do mês.

**Uma coluna lê a célula errada.** No `INDICE`, as linhas de contas a receber, empréstimos, fornecedores e capital social, na coluna de agosto, leem a coluna de **variação** do balanço em vez da coluna de **saldo**. Só na última coluna; todas as outras estão certas.

**A análise horizontal da DRE está deslocada em uma linha** a partir da linha 91: o rótulo "Lucro Operacional Líquido" aponta para "Outras Despesas Operacionais", e assim por diante até o fim do bloco. A linha do lucro líquido nunca é usada.

**Somatórios truncados.** A variação da receita bruta soma 3 das 11 linhas; a dos custos soma 6 das 10.

**Sinais inconsistentes.** As liquidezes negam o passivo explicitamente (`/-C11`); os indicadores de endividamento não, e por isso saem **negativos**. Duas convenções na mesma aba.

## As duas relações já conhecidas, confirmadas e uma terceira

| Linha | Rótulo | Fórmula real |
|---|---|---|
| 36 | "RESULTADO / RECEITA LIQUIDA (%)" | Receita Líquida ÷ Lucro Líquido - invertida |
| 37 | "CMV + DESPESA / RECEITA LIQUIDA" | não há divisão nenhuma; é valor absoluto |
| 38 | "CMV + DESPESA / RECEITA LIQUIDA (%)" | divide pelo lucro líquido |
| 61 | "RELAÇÃO CUSTO / RECEITA LIQUIDA" | metade das colunas divide pela receita bruta, metade pela líquida |

A linha 61 é a mais insidiosa: é uma série temporal de doze meses com a metodologia trocada no meio.

## O importador, e por que ele não serve de modelo

A macro `inserirBalancete` abre o arquivo do cliente por ADODB, pede ao usuário para mapear as colunas de conta, descrição e valor, e casa linha a linha por código de conta - ou por código mais descrição. **Conta que não casa é inserida como linha nova, pintada de amarelo**, e o usuário recebe o aviso de que precisa atribuir a referência manualmente.

Esse é o fluxo de classificação que o sistema novo automatiza: casar conta, e escalar para humano o que não casou.

Mas o VBA está fora de sincronia com a própria planilha: referencia a aba pelo nome errado (com acento e minúscula), aponta para a coluna B quando os rótulos estão na C, usa a linha 33 como total do ativo quando ele está na 45, e procura a Ref 1 na coluna R quando ela está na N. **Rodar a macro hoje quebra o balanço.** Além disso tem limite fixo de 1500 linhas, e o balancete de exemplo já tem 972.

## Dependências que não se reproduzem

O fluxo de caixa previsto é alimentado por uma tabela dinâmica cuja fonte é um arquivo local na máquina de alguém: `C:\Users\nilto\Downloads\Giannini - Fluxo de Caixa Projetado 6 meses...xlsx`. As linhas de dados estão vazias, o saldo dá zero e o check da aba é inoperante.

A pasta ainda carrega **4.263 intervalos nomeados**, praticamente todos apontando para `#REF!`, herdados de templates de terceiros. Nada disso migra.

## O que isso determina para a spec

1. **`PlanoReferencia`** vira entidade: código, nome da linha do relatório, bloco, ordem. São os 90 códigos.
2. **`Balancete`** guarda saldo acumulado; o valor mensal das contas de resultado é derivado por diferença.
3. **As quatro invariantes** viram teste, e bloqueiam a geração do relatório quando falham.
4. **Toda razão é calculada por competência.** Nenhum denominador travado.
5. **Uma convenção de sinal só**: guardar o passivo positivo e inverter na apresentação.
6. **Período é parâmetro.** A planilha tem quatro janelas simultâneas incompatíveis - 8 meses no balanço, 6 na capa, 12 nos gráficos, 7 nas contas patrimoniais - e é exatamente essa divergência que produz o `#N/A` do mês de fechamento.

## Links

- Fórmulas confirmadas: [[regras-negocio#RN-41]] e [[formulas-sistema-anterior]]
- Formato de entrada do balancete: [[fontes-escopo]]
- Perguntas: [[perguntas-cliente]]
