# Anatomia do RMA - estrutura do relatório

> Fonte: `OLD_RMA/escopo/DIP - RMA - Março.2026 final.docx` (RMA real, 18 seções) e `retorno_da_plataforma.txt`. Ver [[fontes-escopo]].
>
> O RMA é peça processual: abre endereçado ao juízo ("AO JUÍZO DA ... VARA CÍVEL"), com autos, incidente de relatórios mensais e assinatura do administrador judicial com OAB. Estrutura e ordem das seções seguem a **Recomendação nº 72 do CNJ**.

## Seções

| # | Seção | Origem |
|---|-------|--------|
| 1 | Houve alteração da atividade empresarial? | Pasta 1 |
| 2 | Houve alteração da estrutura societária e dos órgãos de administração? | Pasta 2 |
| 3 | Houve abertura ou fechamento de estabelecimentos? | Pasta 3 |
| 4 | Segmento de atuação - fontes de informação - associação - sindicato | Pasta 4 |
| 5 | Quadro de funcionários | Pastas 15, 16, 17 |
| 5.1 | Número de funcionários/colaboradores total | |
| 5.2 | Número de funcionários CLT | |
| 5.3 | Número de pessoas jurídicas | |
| 5.4 | Folha de pagamentos CLT (5.4.1 valores e quitação, 5.4.2 quitação de INSS e FGTS) | Pastas 15, 21 |
| 6 | Análise dos dados contábeis e informações financeiras | Pastas 7, 8 |
| 6.1 | Ativo - descrição e evolução (6.1.1 circulante, 6.1.2 não circulante, 6.1.3 estoques, 6.1.4 imobilizado) | Pastas 9, 10 |
| 6.2 | Passivo (6.2.1 circulante, 6.2.2 não circulante) | |
| 6.3 | Passivo extraconcursal (6.3.1 fiscal, 6.3.2 contingência, 6.3.3 inscrito na dívida ativa, 6.3.4 cessão fiduciária, 6.3.5 alienação fiduciária, 6.3.6 arrendamentos mercantis, 6.3.7 ACC, 6.3.8 obrigação de fazer, 6.3.9 de entregar, 6.3.10 de dar, 6.3.11 obrigações ilíquidas) | Pastas 23, 27-35, 40 |
| 7 | Patrimônio líquido | Pasta 7 |
| 8 | Endividamento pós ajuizamento da RJ - declaração (8.1 tributário, 8.2 trabalhista, 8.3 fornecedores) | Pasta 24 |
| 9 | Fluxo de caixa (9.1 previsto x realizado no mês, 9.2 projetado 6 meses) | Pastas 5, 6 |
| 10 | Contas a pagar (10.1 vencidos, 10.2 a vencer - aging 0-30, 30-90, 90-180, acima de 180 dias) | Pasta 25 |
| 11 | Contas a receber (11.1 vencidos, 11.2 a vencer - mesmo aging) | Pasta 26 |
| 12 | Demonstração de resultados - evolução (12.1 observações gerais e análise de faturamento, 12.1.2 índices de liquidez, 12.1.3 receita x custo/CMV, 12.1.4 receita x resultado, 12.1.5 EBITDA) | Pasta 8 |
| 13 | *(ausente no exemplar consultado)* | |
| 14 | Remuneração do administrador judicial | |
| 15 | Fatos relevantes (subitens variam por caso: recuperandas inativas, glosa fiscal, leilões e vendas diretas, débitos tributários dos bens, depósito tributário, contratos específicos) | Pastas 43 e afins |
| 16 | Conclusão | |
| 17 | Pendências | Pasta 38 |
| 18 | Apensos/anexos | |

O **Apenso I** é o controle dos documentos já solicitados e dos itens exigidos pelo CNJ. As seções 1 a 4 costumam se resolver por remissão a ele ("A Recuperanda informou que não houve alteração no mês de ... - Apenso I").

## Seção condicional - Agronegócio

Para empresas do agronegócio e produtores rurais, o RMA deve conter uma seção **antes de "Fatos relevantes"** com:

- Da aplicação do Provimento 216, de 09 de março de 2026
- Atividade rural - safra
- Estágio da safra e cronograma produtivo
- Insumos utilizados
- Riscos identificados
- Perspectiva de colheita e produção
- Situação das garantias
- Controle de estoques
- Cronograma rural

Isso confirma que o **segmento** cadastrado na recuperanda (ver [[fluxo-processo]], passo 1) altera a estrutura do relatório. O gerador precisa de seções condicionais por segmento, não de um template fixo.

## Observações de projeto

- A numeração das seções **não é densa nem estável**: o exemplar consultado pula a seção 13, e os subitens da seção 15 são específicos do caso. Modelar seções como lista ordenada de blocos, não como campos fixos.
- Seções 6, 9, 10, 11 e 12 são majoritariamente numéricas e derivam de conciliação; 1 a 4, 15, 16 e 17 são textuais e derivam de parecer.
- A seção 12 exige indicadores calculados: liquidez, CMV, EBITDA. São fórmulas que precisam virar regra explícita e testável.

## Links

- De onde vem cada número: [[pastas-documentos]]
- Como o relatório é produzido e aprovado: [[fluxo-processo]]
