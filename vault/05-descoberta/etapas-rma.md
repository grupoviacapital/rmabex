# Etapas do RMA - leitura

> Extraído de `etapas_do_rma.xlsx` (recebido do Saulo em 2026-10-08). Duas abas: **"Fluxograma RMA"** (tabela com 32 etapas) e **"Fluxo Macro"** (as mesmas etapas agrupadas em 20 blocos). A coluna STATUS veio vazia e **não há prazos** na planilha. É bem mais detalhada que a análise do [[fluxo-v8]]. Esta nota é leitura; as divergências com o que já decidimos estão no fim.

## As 32 etapas

Colunas da planilha: etapa, fase, atividade, **automação/IA**, **validação humana**, saída e próximo passo.

| # | Fase | Atividade | IA faz | Humano valida | Saída | Próximo passo |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | Recebimento | Upload único dos documentos da competência | Mapear arquivos; identificar recuperanda, competência e tipo documental | Conferir arquivos não reconhecidos | Lote documental mensal | Triagem |
| 2 | Triagem | Classificar documentos por empresa e tópico do RMA | Separar; detectar duplicidades, retificações e falhas de leitura | Validar classificações duvidosas | Relatório de triagem | Controle documental |
| 3 | Apenso I | Comparar recebidos com o checklist obrigatório | Recebido, parcial, ausente, ilegível ou não aplicável | Validar dispensas e exceções | **Apenso I - Controle de Documentos** | Pendência? Sim: solicitar; Não: análise |
| 4 | Operacional | Atividade empresarial, estrutura societária, estabelecimentos | Comparar com o mês anterior | Validar alterações relevantes | Quadros e texto preliminar | Trabalhista |
| 5 | Trabalhista | Colaboradores, admissões, demissões, PJs | Evolução mensal e variações | Avaliar justificativas | Quadro de funcionários + gráfico | Folha |
| 6 | Folha | Folha líquida x comprovantes de pagamento | Folha líquida menos pagamentos = diferença | Validar diferenças | Conciliação da folha | Diferença? Sim: Apenso II |
| 7 | Encargos | FGTS e INSS | Guia, competência, valor, vencimento, pagamento/PERDCOMP | Validar compensações | Status de quitação | Divergência? Sim: Apenso II |
| 8 | Contábil | **Importar balancetes por CNPJ e consolidado** | Ativo = Passivo + PL; continuidade dos saldos | Validar reclassificações e ajustes retroativos | Base contábil validada | Patrimonial |
| 9 | Ativo | Circulante e não circulante | Variações absolutas e %; contas relevantes | Razão e suporte documental | Evolução do ativo | Conciliações |
| 10 | Conciliações | Bancos, aplicações, estoque, imobilizado | Saldo contábil x extratos e auxiliares | Validar divergências | Matriz de conciliações | Não conciliado: Apenso II |
| 11 | Passivo | Circulante e não circulante | Contas responsáveis pelas variações | Razão, contratos, justificativas | Evolução do passivo | Extraconcursal |
| 12 | Extraconcursal | Fiscal, contingências, dívida ativa, garantias | Auxiliares x saldo contábil | Natureza e contabilização | Quadro extraconcursal | Pós-RJ |
| 13 | Pós-RJ | Obrigações vencidas após o ajuizamento | Vencidos/a vencer; pagos/não pagos; natureza | Justificativas e materialidade | Diagnóstico do endividamento pós-RJ | Regular ou inadimplente |
| 14 | Caixa | Fluxo de caixa realizado | Caixa final da DFC x disponibilidades | Validar diferenças | DFC conciliada | Projeções |
| 15 | Projeções | Fluxo projetado, 6 meses | Projeção anterior x atual; premissas | Validar justificativas | Quadro de projeções | Contas a pagar/receber |
| 16 | Contas a pagar | Aging e saldo | Aging x saldo contábil | Títulos divergentes | Aging de fornecedores | Diferença: Apenso II |
| 17 | Contas a receber | Aging, vencidos, inadimplência | Relatório financeiro x balancete | Risco e cobrança | Aging de clientes | Diferença: Apenso II |
| 18 | DRE | DRE e faturamento | DRE x balancete x faturamento/NFs | Eventos não recorrentes | DRE validada | Indicadores |
| 19 | Indicadores | Faturamento, custos, resultado, liquidez, EBITDA | Calcular e comparar histórico | Interpretar | Quadros e gráficos gerenciais | Rural, se aplicável |
| 20 | Rural | Cada fazenda e estágio da safra | Laudo atual x anterior | Validar laudo | Ficha por fazenda + cronograma | Colheita concluída? Sim: pós-colheita |
| 21 | Pós-colheita | Produção física e produtividade | Área x produtividade; romaneios, tickets, estoque | Divergências técnicas | Produção validada | Comercialização |
| 22 | Comercialização | Venda e fluxo financeiro da safra | Quantidade x preço; NF x recebimentos | Contratos e compradores | Quadro de comercialização | Garantias |
| 23 | Garantias rurais | CPR, barter, penhor, alienação fiduciária, vendas futuras | Produção/estoque x garantias | Produção livre/vinculada | Mapa de garantias | Diligências |
| 24 | Diligências | Realidade física x documentos | Laudo x termo de diligência x fotos | Equipe valida | Relatório de diligência | Divergência: Apenso II |
| 25 | Apenso II | Consolidar pendências e divergências | Empresa, tópico, documento, divergência, solicitação, data, status | Redação e materialidade | **Apenso II - Pendências** | Solicitação complementar |
| 26 | Reanálise | Respostas e documentos complementares | Reexecutar o teste que originou cada pendência | Validar resultado | Pendência sanada, mantida ou nova | Sanada: fecha; não: **mantém no próximo RMA** |
| 27 | Cruzamento global | Matriz final de conciliações | Folha, bancos, estoques, DRE, DFC, aging, rural, garantias | Exceções relevantes | Painel de inconsistências | Quadros e gráficos |
| 28 | Minuta | Textos preliminares do RMA | Descrever situação, variação, justificativa, pendência **sem criar informação** | Equipe técnica revisa | Minuta do RMA | Painel executivo |
| 29 | Conclusão | Consolidar situação operacional, financeira, trabalhista, fiscal, patrimonial, rural | Painel de exceções e pontos críticos | **AJ define a conclusão técnica/jurídica** | Conclusão do RMA | Revisão final |
| 30 | Revisão | Revisão técnica e jurídica | Checagem de números, tabelas, gráficos, pendências | **Equipe técnica + Administradora Judicial** | RMA validado | Fechamento |
| 31 | Fechamento | Fechar Apensos I e II e versão final | Checklist de completude | Aprovação final | RMA final | Protocolo |
| 32 | Protocolo | Protocolar nos autos | Registrar versão e competência | Conferência final | RMA protocolado | Fim |

## Conceitos novos

- **Competência**: o mês de referência do RMA e do lote de documentos.
- **Apenso I - Controle de Documentos**: o checklist do mês com a situação de cada documento (recebido, parcial, ausente, ilegível, não aplicável).
- **Apenso II - Pendências**: todas as divergências do mês, com empresa, tópico, documento, solicitação, data e status. **Pendência não sanada passa para o RMA seguinte.**
- Cada etapa separa o que a **IA** faz do que o **humano valida**: é o desenho de "IA propõe, técnico confirma".

## Divergências com o que já decidimos

Respostas de 2026-10-08 em [[duvidas]] (E-1 a E-5): **esta planilha substitui o v8 de E2 em diante**; a 32 vira um botão "registrar protocolo"; a diligência ganha camada própria; o protocolo automático é extra da v1, fora da proposta. E-1: o AJ não escreve, mas dá a aprovação final, pedindo ajustes até aprovar.

1. **Papel do AJ.** Aqui o AJ define a conclusão (29) e revisa junto com a equipe (30). Em 2026-10-08 decidimos que o AJ é **só leitura** e fica fora da aprovação. (E-1)
2. **Protocolo.** A etapa 32 protocola nos autos. Decidimos que o sistema termina no RMA final e no "liberar para o magistrado"; o protocolo é manual e externo. Leitura provável: a 32 vira só "registrar versão e competência". (E-2)
3. **Diligência.** Aqui é a etapa 24, dentro do fluxo (pelo menos no rural). Estava como opcional à parte. (E-3)
4. **Prazos.** A planilha não traz prazos, então a D-37 continua aberta. (E-4)
5. **Relação com o v8.** Esta planilha substitui as etapas E2 a E11 do v8 como roteiro da análise, ou as duas valem juntas? (E-5)
