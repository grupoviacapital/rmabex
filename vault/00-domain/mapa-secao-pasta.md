# Mapa Seção do RMA -> Pasta -> Conciliação

> Fonte: `OLD_RMA/escopo/Acessos da Plataforma RMA - Retorno da Plataforma/RMA_RMA-DIP-01-2026_jan_de_2026 indicação de pastas.docx`, nos **45 comentários** do documento. O corpo do arquivo é um RMA normal; a informação está nas anotações de margem, invisíveis em leitura comum.
>
> É o documento mais operacional do escopo: diz, para cada seção do relatório, de qual pasta sai a informação, se há conciliação, e que tipos de arquivo esperar.

## A descoberta que muda o modelo

**A conciliação não é propriedade da pasta. É propriedade do par (item do RMA, pasta).**

A mesma pasta 15 aparece duas vezes com regras opostas:

- Itens 5, 5.1 e 5.2 -> pasta 15 -> **não tem conciliação** com o balancete.
- Itens 5.4 e 5.5 -> pasta 15 -> **tem conciliação**: saldo líquido do resumo de folha do mês igual ao saldo da conta salários a pagar.

Ou seja: a mesma pasta alimenta a contagem de funcionários (parecer) e o valor da folha (conciliação). [[modelo-dados]] precisa de uma entidade de ligação entre seção e categoria, com a regra pendurada nela, não na categoria.

## Contradição entre dois documentos do escopo

| Pasta | `Código de Pastas ... identificação.xlsx` | Comentários do RMA anotado |
|---|---|---|
| 21 · GFIP, INSS e FGTS | Tem conciliação: valor pago = saldo apurado na GFIP = contas INSS e FGTS a pagar | **"não tem conciliação com balancete"** |

Duas fontes do escopo se contradizem. Isso vira pergunta ao cliente.

## Conciliação condicional

Três pastas têm conciliação **dependente do caso**, o que nenhuma nota anterior registrava:

- **Pasta 31 · Contingência**: "algumas empresas contabilizam, neste caso verificar a conciliação com o saldo da conta no balancete".
- **Pasta 34 · Arrendamento Mercantil**: "pode ter conciliação", com contas sugeridas (Direito de Uso, Ativos de arrendamento).
- **Pasta 35 · ACC**: "pode ter conciliação", com conta Adiantamento de Contrato de Câmbio.

## O mapa

| Item do RMA | Pasta | Regra |
|---|---|---|
| 1, 2, 3, 4 | 1 a 4 | Parecer. Resposta vem do arquivo de controle preenchido pela recuperanda; o documento só aparece se houve alteração. |
| 5, 5.1, 5.2 | 15 | Parecer (quadro de funcionários). Sem conciliação. |
| 5.3 | 17 | Parecer (pessoas jurídicas contratadas). Sem conciliação. |
| 5.4, 5.5 | 15 | **Conciliação**: saldo líquido da folha = conta salários a pagar. |
| 5.4.2 | 21 | Sem conciliação, segundo esta fonte. Ver contradição acima. |
| (rescisões) | 16 | **Conciliação**: saldo líquido do relatório de rescisões = conta rescisões a pagar. |
| 6 e subitens | 7 | Balancete: analisar se os saldos iniciais do mês (ativo, passivo, PL, receitas, custos, despesas) são iguais aos saldos finais do mês anterior. |
| 6.1 | 7 | Analisar variações do ativo total. |
| 6.1.x | 7 | Analisar variações dos grupos circulante e não circulante. |
| 6.1.3 | 9 | **Conciliação**: saldo final do relatório de estoques = conta Estoques. |
| 6.2 | 7 | Analisar variações do passivo total. |
| 6.2.1, 6.2.2 | 7 | Analisar variações dos grupos circulante e não circulante. |
| 6.3, 6.3.1 | 7 | Passivo fiscal extraído **direto do balancete**, das contas sintéticas: encargos sociais a pagar, parcelamentos de encargos sociais, obrigações tributárias e fiscais, impostos e contribuições retidos de terceiros, parcelamentos. |
| 6.3.2 | 31 | Contingência. Conciliação condicional. |
| 6.3.3 | 23 | **Conciliação**: relatório de dívida ativa = contas de dívida ativa. |
| 6.3.4 | 32 | Cessão fiduciária. Parecer. |
| 6.3.5 | 33 | Alienação fiduciária. Parecer. |
| 6.3.6 | 34 | Arrendamento mercantil. Conciliação condicional. |
| 6.3.7 | 35 | ACC. Conciliação condicional. |
| 6.3.8 a 6.3.11 | 27, 28, 29, 30 | Obrigações de dar, fazer, entregar e ilíquidas. Parecer. |
| 7 | 7 | Analisar variações das contas do PL. |
| 8, 8.1, 8.2, 8.3 | 24 | Declaração de dívidas vencidas. Sem conciliação. |
| 9 | 5 | **Conciliação**: saldo final do fluxo de caixa realizado = conta Caixa e equivalentes. |
| 9.1 | 5 | Analisar a variação entre o **projetado no arquivo do mês anterior** e o realizado no mês atual. |
| 9.2 | 6 | Fluxo projetado 6 meses. Sem conciliação, parecer. |
| 10 | 25 | **Conciliação**: saldo final do relatório = contas de fornecedores, outras contas a pagar e empréstimos e financiamentos a pagar. |
| 10.1, 10.2 | 25 | Segregar por vencimento: 0-30d, 30-90d, 90-180d, acima de 180 dias. |
| 11 | 26 | **Conciliação**: saldo final = conta clientes a receber. |
| 11.1, 11.2 | 26 | Mesma segregação por vencimento. |
| 12 | 7 | Balancete com a DRE. Analisar variações das contas que compõem todo o resultado. |
| 12.1.x | - | Gráficos construídos a partir das fórmulas e das contas do balancete. A análise segue o resultado da fórmula. |
| 15 e subitens | - | "Particularidade da DIP": informação inserida manualmente pelo técnico. |
| 16 · Conclusão | - | **Gerada pela IA** a partir do conjunto de análises do relatório. |
| 17 · Pendências | - | **Pode ser gerada pela própria IA**. |
| 18 · Apensos | - | Manual. |

## O que a IA gera e o que o técnico preenche

Os comentários separam explicitamente:

- **Gerado pela IA**: a conclusão (item 16), a lista de pendências (item 17), e as análises que seguem o resultado das fórmulas (12.1.x).
- **Manual pelo técnico**: fatos relevantes e particularidades do cliente, mais qualquer item marcado "informação adicionada manualmente".
- **Texto padrão**: a abertura do relatório é "texto padrão para todas as recuperandas".

Isso é a divisão de trabalho entre automático e humano, vinda do escopo. Confirma [[regras-negocio#RN-40]] e dá base para a spec de geração.

## Exemplos de documento por pasta

Os comentários listam, para cada pasta, que arquivos costumam aparecer. Isso alimenta direto a classificação automática e o treinamento de extração. Exemplos:

- **Pastas 1 a 4**: alteração de contrato ou estatuto social, atas de assembleia, termos de posse, organograma, QSA, cartão CNPJ, certidão da junta, alvarás, inscrições estadual e municipal, contratos de locação, documentos de abertura ou encerramento de filiais, procurações.
- **Pasta 15**: resumo da folha, folha analítica, relação de empregados ativos, admissões e desligamentos, holerites, quadro de funcionários, comprovantes bancários.
- **Pasta 21**: comprovante de transmissão da GFIP/SEFIP, recibo de fechamento do eSocial DCTFWeb, DARF previdenciário e seu comprovante, guia do FGTS Digital e comprovante, extratos que evidenciem a quitação.
- **Pasta 9**: inventário físico, relação de produtos armazenados, planilha de movimentação, relatórios de produção e de consumo de matéria-prima, laudos de inventário.
- **Pasta 23**: relatório e extrato da dívida ativa, CDA, relação de certidões, extrato fiscal, demonstrativo de débitos, relatório de parcelamentos.

## Links

- Taxonomia das pastas: [[pastas-documentos]]
- Estrutura do relatório: [[anatomia-rma]]
- Fórmulas: [[formulas-sistema-anterior]]
