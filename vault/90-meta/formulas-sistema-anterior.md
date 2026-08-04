# Fórmulas do sistema anterior - material para o cliente

> Resposta ao pedido do cliente na pergunta P-1 de [[perguntas-cliente]]. Todas as fórmulas foram lidas diretamente no código de `OLD_RMA/RMA-VS-1-FINAL-main` e `OLD_RMA/KANTIZ-VS-1-FINAL-main`, com arquivo e linha conferidos. Nada aqui é paráfrase.

## RESOLVIDO em 04/08/2026

A área técnica do cliente respondeu, e a resposta **bate exatamente** com a planilha `01.BASE RELATÓRIO_xi teste.XLSM`, que é escopo do cliente. Duas fontes independentes, mesmo resultado:

```
EBITDA             = Resultado do Exercício + Despesas Financeiras
                     - Receitas Financeiras + IRPJ/CSLL
                     + Depreciações e Amortizações
Liquidez Corrente  = Ativo Circulante / Passivo Circulante
Liquidez Seca      = (Ativo Circulante - Estoques) / Passivo Circulante
Liquidez Imediata  = Disponibilidades / Passivo Circulante
Liquidez Geral     = (Ativo Circulante + Realizável a Longo Prazo)
                     / (Passivo Circulante + Passivo Não Circulante)
CMV x Receita Líquida       = CMV / Receita Líquida
Resultado x Receita Líquida = Resultado Líquido / Receita Líquida
```

Nenhuma das cinco versões do sistema legado corresponde a isso. A mais próxima é a A, que só não devolve os tributos sobre o lucro. Registrado em [[regras-negocio#RN-41]].

O restante deste documento fica como registro do que existia no código, e da rastreabilidade que levou à resposta.

## Resumo honesto

O conflito é menor do que parecia. Dos quatro itens perguntados:

| Item | Situação |
|------|----------|
| 1.1 EBITDA | **5 versões.** Duas defensáveis, uma auto-declarada aproximada, duas que são atalhos. |
| 1.2 Liquidez | **Corrente, seca e imediata são idênticas em todo lugar.** Só a **Liquidez Geral** diverge, em 4 versões. |
| 1.3 Receita x Custo (CMV) | **Uma só definição.** Sem conflito. |
| 1.4 Receita x Resultado | **Uma só definição.** Sem conflito. |

Ou seja: o cliente precisa decidir **EBITDA** e **Liquidez Geral**. O resto está pacificado.

## 1.1 EBITDA - as cinco versões

### A · Bottom-up, a partir do resultado
`src/services/indicatorsEngine.ts:116,157`
```
LAJIR  = Resultado + |Despesas Financeiras| - |Receitas Financeiras|
EBITDA = LAJIR + |Depreciação| + |Amortização|
```
Motor principal de indicadores. Comentário no código diz que reconcilia com a planilha BEx/Kanitz. **Não soma de volta os tributos sobre o lucro.**

### B · Top-down, a partir da receita
`src/lib/financialVariations.ts:66-80` e `src/components/rma/RMADRETab.tsx:59-78`
```
Receita Líquida = Receita Bruta - Deduções
Lucro Bruto     = Receita Líquida - Custos
EBITDA          = Lucro Bruto - Despesas Operacionais
```
Depreciação e amortização são subtraídas **depois** do EBITDA, para chegar ao resultado antes dos impostos. Isso é coerente, **desde que "Despesas Operacionais" não inclua depreciação e amortização**. É a construção mais clássica das cinco.

### C · Aproximada, assim rotulada pelo próprio código
`src/config/dreBalanceteConciliacaoSpec.ts:108`
```
EBITDA_aprox = Resultado Bruto + Despesas Administrativas + Despesas de Vendas
             + Despesas Tributárias + Depreciação e Amortização
```
O código instrui: *"despesas com sinal negativo; excluir resultado financeiro, IR/CSLL e não recorrentes; classificar como APROXIMADO"*, e mais adiante *"rotular EBITDA como APROXIMADO até certificação do mapa de contas"*.

### D · Atalho com fator de 10%
`src/pages/Audit.tsx:2218`
```
EBITDA = LAJIR + (Despesas Financeiras × 0,10)
```
O comentário no código é literalmente `// simplified proxy`. Não há justificativa contábil registrada.

### E · Atalho sem depreciação
`src/pages/Audit.tsx:755`
```
EBITDA = Resultado Operacional + Despesas Financeiras
```
Rotulado na tela como "LAJIR + Desp. Financeiras". Não devolve depreciação nem amortização.

### G · A da planilha do cliente - **a correta**
`01.BASE RELATÓRIO_xi teste.XLSM`, aba `P&L + EBITDA`, linhas 62 a 71 (escopo do cliente)
```
EBITDA = Resultado do Exercício + Despesas Financeiras
       - Receitas Financeiras + IRPJ e CSLL
       + Depreciações e Amortizações
```
Confirmada pela área técnica em 04/08/2026. É a A somada aos tributos sobre o lucro, ou a F descontando as receitas financeiras.

### F · A versão da especificação BEx
`KANTIZ-VS-1-FINAL-main/docs/BS_DADOS_ESPECIFICACAO.md:179`, documento que se declara "Single Source of Truth"
```
EBITDA = Resultado + |Despesas Financeiras| + |Depreciação|
       + |Amortização| + |Tributos sobre o lucro|
```
É a versão A **mais os tributos sobre o lucro**. Essa é a diferença exata entre as duas mais sérias da lista.

## 1.2 Índices de liquidez

**Consistentes em todas as fontes:**
```
Liquidez Corrente = Ativo Circulante / Passivo Circulante
Liquidez Seca     = (Ativo Circulante - Estoques) / Passivo Circulante
Liquidez Imediata = Disponível (Caixa e equivalentes) / Passivo Circulante
```

**Liquidez Geral - quatro versões:**

| Versão | Fórmula | Onde |
|---|---|---|
| A | (AC + Realizável a Longo Prazo) / (PC + PNC), com queda para ANC inteiro quando o RLP não vem separado | `indicatorsEngine.ts:126,135` |
| B | (AC + Ativo Não Circulante) / (PC + PNC) | `FinancialInsightsPanel.tsx:68` |
| C | (AC + Ativo Não Circulante) / Passivo Total | `Audit.tsx:591` |
| D | (AC + Ativo Não Circulante × 0,10) / (PC + PNC) | `auditMockData.ts:151` |

A versão A é a correta em teoria: liquidez geral usa o **realizável a longo prazo**, não o ANC inteiro (que inclui imobilizado e investimentos, não realizáveis). O comentário do código admite que o parser em geral não separa o RLP, então na prática caía na versão B. A versão D usa 10% do ANC sem justificativa.

**Endividamento**, para contexto:
```
Endividamento Geral       = Passivo Total / Ativo Total       (indicatorsEngine)
Endividamento Geral       = (PC + PNC) / Patrimônio Líquido   (especificação BEx)
Composição Endividamento  = Passivo Circulante / Passivo Total
```
Aqui também há duas bases diferentes: sobre o ativo total ou sobre o patrimônio líquido.

## 1.3 Receita x Custo (CMV)

Definição única, em `src/services/bsDadosBuilder.ts:899-900` e na especificação BEx:
```
CMV sobre Receita          = |CMV| / Receita Líquida
(CMV + Despesa) sobre Receita = (|CMV| + |Despesas|) / Receita Líquida
```

Regra de sinal associada, em `bsDadosBuilder.ts:567`: se o CMV vier positivo, o sistema registra o erro *"CMV positivo (deveria ser negativo)"*.

## 1.4 Receita x Resultado

Definição única, em `bsDadosBuilder.ts:901`:
```
Resultado sobre Receita = Resultado / Receita Líquida     (mantém o sinal)
```

Composição do resultado, em `bsDadosBuilder.ts:556`:
```
Resultado = Receita Líquida + CMV + Despesas + Despesas Financeiras
```
(as contas de custo e despesa entram com sinal negativo)

## Termômetro de Kanitz - FORA DE ESCOPO

> Em 04/08/2026 o cliente determinou desconsiderar tudo que for Kanitz: veio de outro produto cujo código foi copiado. A fórmula fica aqui só como registro do que existia.

Já que o modelo aparece no material, a fórmula implementada em `src/services/kanitzCalculator.ts:167-189`:
```
X1 = Lucro Líquido / Patrimônio Líquido
X2 = (Ativo Circulante + Realizável a LP) / (Passivo Circulante + Exigível a LP)
X3 = (Ativo Circulante - Estoques) / Passivo Circulante
X4 = Ativo Circulante / Passivo Circulante
X5 = (Passivo Circulante + Exigível a LP) / Patrimônio Líquido

Kanitz = 0,05·X1 + 1,65·X2 + 3,55·X3 - 1,06·X4 - 0,33·X5

Faixas: > 0 saudável | entre 0 e -3 atenção | < -3 insolvência
```

Atenção: a tela que documenta esse modelo no sistema anterior **exibe rótulos errados** para as variáveis (mostra `X1 = CG/AT`, `X2 = LL/AT` etc.), que não correspondem ao que ela de fato calcula. Vale avisar quem usava aquela tela.

## Duas questões que acompanham a decisão

1. **Prazos médios** usam base de 30 dias no motor principal e 360 dias na tela de modelo matemático. Precisa ser uma coisa só.
2. **ROA e ROE** são anualizados multiplicando o resultado mensal por 12 (`indicatorsEngine.ts:154-155`). Confirmar se é isso mesmo que se espera num relatório mensal.
