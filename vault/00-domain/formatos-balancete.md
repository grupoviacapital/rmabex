# Formatos de Balancete

> Levantado em 04/08/2026 sobre os dados reais em `OLD_RMA/escopo/OneDrive/`, depois de o cliente informar que **o insumo do sistema é o balancete, e que ele chega em PDF, Excel, TXT e outros formatos**.
>
> **Correção importante:** eu havia registrado em [[motor-calculo]] e em [[regras-negocio#RN-50]] regras de estrutura de balancete como se fossem universais. Elas vieram de **um único arquivo**, o `XPT S.A_Balancete_xi testete.xlsx`, e **não valem para os outros formatos**. Esta nota corrige.

## Quantos e em quê

Nas pastas de balancete dos dois clientes, 339 arquivos:

| Cliente | PDF | XLSX |
|---|---|---|
| DIPLOMATA | 256 | 52 |
| GERATHERM | 22 | 31 |

O PDF é maioria no conjunto, mas o papel dele muda por cliente: na DIPLOMATA os PDFs **são balancetes**, um por empresa do grupo por competência; na GERATHERM os PDFs são **balanços patrimoniais** e o balancete é o XLSX.

**Os PDFs têm camada de texto**, entre 1.200 e 3.200 caracteres na primeira página. `pdftotext -layout` já devolve a tabela alinhada. **Não é caso de OCR**, o que reduz muito o custo da extração.

Nenhum TXT foi encontrado nos dados reais, embora o cliente cite o formato como possível.

## Três estruturas distintas

### Formato A · XPT, o do escopo

`XPT S.A_Balancete_xi testete.xlsx`

- Colunas: `Conta`, `Descricao`, e **uma coluna por mês** (Janeiro 2024 a Julho 2024).
- Código de conta **sem separador**, hierarquia **pelo comprimento**: 1, 2, 3 e 6 dígitos são sintéticas, 10 dígitos é analítica. Pai por truncamento de prefixo.
- Sinal **algébrico**: ativo positivo, passivo e receitas negativos; prefixo `(-)` na descrição marca conta redutora.
- Valores **acumulados no exercício**; o movimento do mês sai por diferença entre colunas.

### Formato B · GERATHERM, XLSX

`Balancete de Verificação MM_AAAA.xlsx`

- Cabeçalho com título, nome da empresa e `Periodo: 01/08/2025 a 31/08/2025`.
- Colunas: `Conta contábil`, `Descrição da Conta`, `Saldo anterior`, `Débito`, `Crédito`, `Saldo Atual`.
- Código de conta **pontuado**, hierarquia pelos segmentos: `1`, `1.1`, `1.1.1`, `1.1.1.01`, `1.1.1.02.10101`.
- **Um mês por arquivo.** Não há coluna por mês.
- Traz **saldo anterior e movimento**, não só o saldo final.

### Formato D · DIPLOMATA / Dip Frangos, sistema Agrosys (AgroWeb)

`Dip Frangos MM-AAAA.xlsx` e `Balancete Dip Frangos MM-AAAA.pdf` - **o mesmo relatório nos dois formatos**, exportado do sistema Agrosys.

- Bloco de cabeçalho com parâmetros da exportação: `Empresa`, `Período` ("Fevereiro/2025"), **`Acumulado`**, `Apenas Sintético`, `Contas de Compensação`.
- **O campo `Acumulado` declara o regime**: no exemplo vem `Não`, ou seja, é movimento do mês. O importador deve **ler esse campo**, não inferir o regime.
- Colunas: `Cta.Estrut.`, `Conta`, `Descrição Conta`, `Saldo Inicial`, `D/C`, `Débito`, `Crédito`, `Saldo Final`, `D/C`.
- **Dois códigos de conta**: `Cta.Estrut.` é hierárquico pontuado (`1`, `1.1`, `1.1.01`, `1.1.01.001.001`); `Conta` é um sequencial interno (1, 4, 5, 6, 404, 1017).
- A descrição traz a **profundidade em pontos à esquerda**: `.ATIVO`, `..ATIVO CIRCULANTE`, `...DISPONÍVEL`.
- Sinal em **coluna `D/C` própria**, não em sufixo.

Este formato explica o C: o `Código` do formato C é o mesmo sequencial `Conta` daqui. O XLSX é estritamente mais rico, porque traz também a `Cta.Estrut.`.

### Formato C · DIPLOMATA, empresas menores, PDF

`MMAAAA-CNPJ NOME DA EMPRESA.pdf`

- Cabeçalho com `Empresa`, `C.N.P.J.`, `Período` como intervalo de datas, `Folha` e `Número livro`.
- Colunas: `Código`, `Descrição da conta`, `Saldo Anterior`, `Débito`, `Crédito`, `Saldo Atual`.
- Código de conta é um **identificador sequencial sem significado hierárquico** (1, 501, 69, 76, 532, 639...). A hierarquia é expressa por **indentação**, não pelo código.
- Sinal como **sufixo literal `D` ou `C`** no valor: `49.639.220,42D`, `51.070.737,90C`.
- Um arquivo por empresa por competência; o nome do arquivo carrega competência e CNPJ.
- De 1 a 16 páginas, conforme o porte da empresa.

## O que isso corrige

| Registrado antes | Correção |
|---|---|
| "A hierarquia do plano de contas é por comprimento do código" | Vale só no formato A. No B é por segmentos pontuados; no C não existe hierarquia no código. |
| "O balancete é acumulado no ano" | Vale no formato A. B e C trazem saldo anterior, débito, crédito e saldo atual do mês - estrutura melhor, que dispensa a desacumulação. |
| "Validado: 114 de 114 sintéticas batem" | Vale para o arquivo da XPT. Não foi verificado nos outros formatos. |
| "Convenção de sinal algébrica" | Vale no formato A. No C o sinal é sufixo `D`/`C`. |

A `RN-50` (desacumulação) e a `RN-51` (natureza da conta) passam a ser **regras por formato**, não regras do domínio.

## Consequências para a spec de importação

1. O importador precisa de **detecção de layout** antes de qualquer parsing, e de um adaptador por formato.
2. A **hierarquia é derivada de forma diferente** em cada um: comprimento, segmentos, ou indentação da linha no PDF.
3. Só o formato A exige desacumulação. B e C já entregam o movimento do mês.
4. O nome do arquivo é fonte de metadado no formato C (competência e CNPJ) e no B (competência).
5. A invariante de fechamento (ativo igual a passivo mais PL) vale nos três, mas com aritmética diferente por causa do sinal.

**Por decisão do cliente em 04/08/2026, o primeiro alvo é a GERATHERM**, ou seja, o formato B - o mais limpo dos quatro, com código hierárquico explícito e movimento do mês já separado.

O cliente também definiu o papel do arquivo: *"tem uma planilha de Excel Balancete, esse é o arquivo principal para iniciarmos a referência cruzada dos demais documentos em cada pasta"*. Ou seja, o balancete é o **eixo da conciliação**, e não apenas mais um documento - o que confirma [[regras-negocio#RN-12]].

## A pasta do balancete na GERATHERM

Confirmado nos dados e por captura de tela do OneDrive: na GERATHERM o balancete é a **pasta 07**, que bate com a taxonomia canônica de [[pastas-documentos]]. Só em 2022 aparece também como `02-Balancete de Verificação`; de 2023 em diante é sempre `07`.

Isso é evidência direta para a [[perguntas-cliente]] P-7: **a numeração não é arbitrária, ela migrou para a canônica** dentro do mesmo cliente. A DIPLOMATA ainda usa `02`.

Em janeiro de 2026 a pasta 07 tem dois arquivos: `BALANCETE_01_2026.xlsx` e `Balanço Patrimonial 01_2026.pdf`. Confirma que na GERATHERM o balancete é o Excel e o PDF é outro documento.

## Estrutura de pastas hoje e amanhã

O cliente informou que **a estrutura de pastas será criada dentro da plataforma**, e que o OneDrive é solução temporária até o relatório estar correto. Isso reabre a [[perguntas-cliente]] P-8, que eu havia dado como resolvida: o sistema deixa de ser só um índice do OneDrive e passa a ser o repositório.

O cliente também ofereceu **limpar toda a base de dados já gerada** pelo sistema anterior. Ou seja: **não há requisito de migração de dados**. Isso simplifica o escopo e deve ser registrado como decisão.

## Links

- Motor de cálculo que consome o balancete: [[motor-calculo]]
- Regras afetadas: [[regras-negocio#RN-50]] e [[regras-negocio#RN-51]]
