# Pastas de Documentos - Taxonomia e regra de análise

> Fonte: `OLD_RMA/escopo/Acessos da Plataforma RMA - Retorno da Plataforma/Código de Pastas Onedrive_Documentos (2) - identificação.xlsx`, aba `Pastas Onedrive` (ver [[fontes-escopo]]).
>
> São **61 pastas**. Cada uma tem um número canônico e um tipo de análise. O número é a chave estável; o nome varia entre clientes.

## Tipos de análise

| Tipo | Significado |
|------|-------------|
| `Conciliação` | Valor do documento tem de bater com uma conta específica do balancete. É verificável por cálculo, logo automatizável. |
| `Base` | Documento que alimenta a montagem do Balanço Patrimonial / DRE. |
| `Parecer` | Análise textual pela IA com revisão do técnico. |
| `Parecer (controle)` | A resposta normalmente já está no arquivo de controle de documentos que a recuperanda preenche; o documento só aparece na pasta se houve alteração. |
| `Apartada` | O técnico analisa fora do fluxo padrão. |

## As 61 pastas

| # | Descrição | Tipo | Regra de conciliação |
|---|-----------|------|----------------------|
| 1 | Alteração na Atividade Empresarial | Parecer (controle) | - |
| 2 | Alteração na Estrutura Societária ou nos órgãos da Administração (Organograma) | Parecer (controle) | - |
| 3 | Abertura ou fechamento de estabelecimentos ou alteração de endereço | Parecer (controle) | - |
| 4 | Segmento de atuação ou fontes de informação sobre o segmento da recuperanda | Parecer (controle) | - |
| 5 | Fluxo de Caixa | Conciliação | Saldo final do fluxo realizado = saldo final de Caixa e equivalentes de caixa. |
| 6 | Fluxo de Caixa Projetado 6 meses | Parecer | - |
| 7 | Balancete de Verificação | Base | Sobe todos os saldos de ativo, passivo, PL e resultado; base do Balanço Patrimonial. |
| 8 | Demonstrativo do Resultado | Base | Sobe os saldos para elaboração da DRE. |
| 9 | Relatório de Controle de Estoques | Conciliação | Saldo final do relatório = conta Estoques. |
| 10 | Relatório de Ativos Imobilizados | Conciliação | Saldo final do relatório = conta Imobilizado. |
| 11 | Relação de Notas Fiscais de Compras | Conciliação | Saldo final = movimentação mensal (saldo atual menos saldo do mês anterior) da conta Fornecedores. |
| 12 | Comprovantes de Pagamentos a Fornecedores | Parecer | - |
| 13 | Extratos bancários de todas as contas correntes | Conciliação | Saldo final de cada extrato = conta específica do mesmo banco. |
| 14 | Extrato das contas de investimento/aplicações (se aplicável) | Conciliação | Idem 13, por banco. |
| 15 | Resumo da folha de pagamento | Conciliação | Saldo líquido da folha = conta Salários a pagar. |
| 16 | Rescisões contratuais de funcionários | Conciliação | Saldo líquido do relatório = conta Rescisões a pagar. |
| 17 | Pessoas Jurídicas contratadas (nome, CNPJ, atividade, valor mensal) | Parecer | - |
| 18 | G.I.A e comprovante de pagamento do ICMS | Conciliação | Valor pago = saldo apurado na GIA ou EFD ICMS/IPI (SPED Fiscal) = conta ICMS a pagar. |
| 19 | EFD-Contribuições e comprovante de pagamento | Conciliação | Valor pago = saldo apurado na EFD Contribuições = contas PIS a pagar e COFINS a pagar. |
| 20 | Demonstrativo de Adesão a Parcelamento Tributário | Conciliação | Valor do relatório = conta Parcelamentos tributários. |
| 21 | GFIP e comprovante de pagamento do INSS e FGTS | Conciliação | Valor pago = saldo apurado na GFIP = contas INSS a pagar e FGTS a pagar. |
| 22 | Comprovante de pagamento de demais impostos - ISS - Funrural | Conciliação | Valor pago = saldo apurado no relatório de cada imposto = contas dos demais impostos. |
| 23 | Inscrição na dívida ativa | Conciliação | Valor do relatório = contas de dívida ativa. |
| 24 | Declaração assinada de dívidas vencidas e não pagas | Parecer | Segregar entre fornecedores, empréstimos e financiamentos, dívidas sociais, dívidas tributárias e obrigações trabalhistas. |
| 25 | Contas a Pagar - vencidos e a vencer (aging) | Conciliação | Concilia com Fornecedores, outras contas a pagar (se houver) e empréstimos e financiamentos a pagar. Segregar por vencimento: 0-30d, 30-90d, 90-180d, acima de 180d. |
| 26 | Contas a Receber - vencidos e a vencer (aging) | Conciliação | Concilia com Clientes a receber. Mesma segregação de vencimento (aging list). |
| 27 | Obrigação de dar | Parecer (controle) | - |
| 28 | Obrigação de fazer | Parecer (controle) | - |
| 29 | Obrigação de entregar | Parecer (controle) | - |
| 30 | Obrigações Ilíquidas | Parecer (controle) | - |
| 31 | Contingência | Parecer (controle) | - |
| 32 | Cessão fiduciária de títulos e direitos creditórios | Parecer (controle) | - |
| 33 | Alienação fiduciária | Parecer (controle) | - |
| 34 | Arrendamento Mercantil | Parecer (controle) | - |
| 35 | Adiantamento de contrato de câmbio (ACC) | Conciliação | Saldo do relatório = conta Adiantamento de Contrato de Câmbio/ACC. |
| 36 | Comprovantes de Pagamentos a credores pelo Plano de RJ | Parecer | - |
| 37 | Última Alteração Contratual | Parecer (controle) | - |
| 38 | Informações de pendência de RMA anterior | Parecer (controle) | - |
| 39 | Outras Informações | Parecer (controle) | Pode receber documentos esporádicos; o técnico analisa. |
| 40 | Situação Fiscal | Conciliação | Saldo = soma das contas de impostos a recolher. |
| 41 | Relação analítica de notas fiscais | Conciliação | Saldo = movimentação mensal da conta Receita bruta. |
| 42 | Razão Fiscal - composição apurada dos impostos pela competência | Parecer | - |
| 43 | Leilões | Apartada | - |
| 44 | Lista de Ativos Essenciais | Parecer | - |
| 45 | Impostos (Passivo Fiscal) | Conciliação | Saldo = soma das contas de impostos a recolher. |
| 46 | Lista de Principais Fornecedores e Clientes | Apartada | - |
| 47 | Créditos sujeitos a não recuperação judicial | Apartada | - |
| 48 | Créditos com Partes Relacionadas | Apartada | - |
| 49 | Livro do Produtor Rural | Apartada | - |
| 50 | Imposto de Renda | Apartada | - |
| 51 | Bens Essenciais à Atividade | Apartada | - |
| 52 | Direitos de Transmissão (mensal) | Apartada | - |
| 53 | Patrocínios (mensal) | Apartada | - |
| 54 | Marketing e Publicidade (mensal) | Apartada | - |
| 55 | Merchandising (mensal) | Apartada | - |
| 56 | Franquia (se aplicável, mensal) | Apartada | - |
| 57 | Aluguéis (se aplicável, mensal) | Apartada | - |
| 58 | Acordos | Apartada | - |
| 59 | Comissões | Apartada | - |
| 60 | Plano Orçamentário | Apartada | - |
| 61 | Informações adicionais | Apartada | - |

Contagem: 20 pastas de `Conciliação`, 2 de `Base`, 7 de `Parecer`, 15 de `Parecer (controle)`, 17 de `Apartada` (total 61). As 20 de conciliação, apoiadas nas 2 de base, são o núcleo automatizável do produto.

## A realidade diverge da tabela

Conferido contra os dados reais de dois clientes (`OneDrive/DIPLOMATA/`, `OneDrive/GERATHERM/`, ~20 mil arquivos). Achados que o sistema novo **precisa** absorver:

1. **A numeração das pastas não é estável entre clientes.** Em GERATHERM, "Resumo da folha de pagamentos" é a pasta `15`, que bate com a tabela canônica. Em DIPLOMATA, é a pasta `09`. Vários outros itens estão deslocados. Concluir a pasta pelo número, sem olhar o nome, produz classificação errada.
2. **A numeração também mudou ao longo do tempo dentro do mesmo cliente.** GERATHERM usa um esquema em 2022-2023 (`01-Fluxo de caixa`, `02-Balancete`) e outro de 2024 em diante.
3. **Os nomes variam em grafia, acentuação e separador.** Coexistem `02 - Balancete de Verificação` e `02-Balancete de Verificação`; há erros de digitação persistentes (`34-Arrendamento Mercnatil`, `33-Alienanção fiduciária`) e duplicatas por acento.
4. **A hierarquia de ano/mês não é uniforme.** Convivem `2023/07.Julho`, `2024/01. Janeiro`, `2025/01.2025`, `2022/11_Novembro`, além de pastas fora do padrão (`2024/DOCUMENTAÇÃO`, `2026/ANUAL`, `2023/Plano de Recuperação Judicial`, `Diplomata/Acordos`).
5. **Pastas fora da taxonomia aparecem na prática**, geralmente por evento: `23 - Esclarecimentos RMA-12-2025`, `Diligência Complementar ...`, `EXTRATO SISBAJUD`, `Cras - Tresbomm - Cooatol`, `Plusval`.
6. **Já existe convenção de pipeline de IA no OneDrive**, replicada nos dois clientes: `Entradas IA`, `Processando IA`, `Processados IA`, `Erros IA`, `Auditoria IA`, `Relatórios IA`. O sistema novo deve decidir se mantém ou substitui esse contrato.

Consequência de projeto: a classificação de documento tem de ser por **correspondência tolerante de nome** (normalizando acento, caixa, separador e erro de digitação) com o número como pista secundária, e precisa de um caminho explícito para "não classificado".

## Links

- Processo que consome estas pastas: [[fluxo-processo]]
- Onde cada pasta desemboca no relatório: [[anatomia-rma]]
- Termos: [[glossario]]
