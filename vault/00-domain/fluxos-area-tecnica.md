# Fluxos da Área Técnica

> Fonte: `OLD_RMA/escopo/Manual de Operações_Área Técnica_V2.xlsx`. Os fluxos estavam presos em shapes do Excel, invisíveis para leitura normal. Renderizados em `OLD_RMA/escopo/fluxogramas/`. Ver [[fontes-escopo]].
>
> Este documento descreve o processo **como a área técnica opera hoje**, manualmente. O fluxo automatizado proposto está em [[fluxo-processo]] e vem de outro arquivo (`Fluxo Processo RMA IA_v3.xlsx`, renderizado como `fluxogramas/rma-ia.png`).

A área técnica entrega **cinco produtos**, cada um com fluxo próprio. O RMA é apenas um deles.

| Produto | Imagem | Prazo de entrega |
|---------|--------|------------------|
| RMA | `manual-fluxo-rma.png` | Último dia útil, referente ao mês anterior |
| Relatórios Contábeis da Falência (DAL) | `manual-fluxo-dal.png` | Até dia 5 ao jurídico, protocolo até dia 10 |
| Constatação Prévia | `manual-fluxo-constatacao-previa.png` | 3 dias por etapa |
| Prospecção | `manual-fluxo-prospeccao.png` | 2 horas |
| Prestação de Contas | `manual-fluxo-prestacao-de-contas.png` | Sob demanda judicial |

Objetivo declarado da área: subsidiar as decisões judiciais com análises financeiras, contábeis e patrimoniais de empresas em recuperação judicial ou falência. KPIs: cumprimento de prazos e percentual de qualidade na preparação dos relatórios.

## Fluxo do RMA (manual, hoje)

Este é o calendário mensal que o sistema novo precisa respeitar. Nenhum desses prazos aparecia nas notas anteriores.

1. Ao iniciar, insere a recuperanda na planilha de controle.
2. **Até o dia 10**: envia e-mail à recuperanda com link para anexar documentos. É mensal.
3. **Até o dia 20 ("D")**: prazo da recuperanda para anexar os documentos.
4. **D + 2 dias úteis**: checagem do recebimento, conferindo se todos os documentos foram anexados.
5. **D + 2 dias úteis**: envia e-mail à recuperanda detalhando e cobrando as pendências.
6. Realiza a integração dos dados contábeis no sistema, usando planilha padrão, para geração de indicadores.
7. Faz a análise cruzada dos dados do balancete com a documentação de suporte recebida.
8. Registra nos controles as pendências de documentos e de esclarecimentos enviados.
9. **Prazo fatal - último dia útil**: prepara e protocola o RMA, referente à movimentação do mês anterior.

Regras explícitas do fluxo:

- **As pendências de meses anteriores são cobradas junto com os documentos do mês vigente.** Confirma [[regras-negocio#RN-37]].
- **O histórico das cobranças de documentos e esclarecimentos deve ser salvo em apenso do RMA e detalhado no tópico Fatos Relevantes.** Isso é mais forte do que o modelado hoje: o histórico não é log interno, é conteúdo do relatório.

Documentos citados como necessários: balancetes, DREs, fluxo de caixa, extratos bancários, relatório de estoque, relatório de ativo imobilizado, folha de pagamento, comprovantes de pagamento de impostos e fornecedores, evolução de endividamento pós concursal, entre outros.

## DAL - Relatórios Contábeis da Falência

Produto para processos de **falência**, não de recuperação judicial. Envolve três equipes: Falência, Listas e Técnica.

- A equipe Falência disponibiliza os documentos arrecadados quando há atualização (rateio realizado, venda ou leilão de bem) e avisa por e-mail, anexando em pastas específicas.
- A equipe Listas disponibiliza a lista de credores e a relação de pagamentos. **Prazo até dia 10 ("D")**.
- A equipe Técnica verifica se todos os documentos de abertura e mensais foram disponibilizados, incluindo todos os extratos e o QGC ou lista de credores. Apresenta pendências em **D + 2 dias úteis**.
- Elabora quatro relatórios: **DAL** (Demonstração de Ativos Líquidos), **DMAL** (Demonstração de Mutação de Ativos Líquidos), **DFC** (Fluxo de Caixa) e um relatório com notas explicativas dos três.
- Encaminha ao jurídico **até o dia 5 do mês subsequente**; o jurídico acrescenta a parte jurídica e protocola **até o dia 10**.

## Constatação Prévia

Etapa anterior ao deferimento, com diligência presencial.

- O jurídico/RJ alinha e envolve o time técnico, e coordena reunião com o requerente.
- A equipe de prazos baixa a documentação do processo principal e disponibiliza em pasta específica.
- A equipe técnica analisa a documentação, prepara as análises contábeis (**3 dias**), realiza avaliação das atividades **in loco** (**3 dias**) e prepara o **Laudo Técnico** (**3 dias**).
- Se algum documento não estiver disponível, solicita complementação à recuperanda com prazo; **não havendo retorno no prazo, isso é informado no relatório**.
- Disponibiliza o laudo para o RJ acrescentar o laudo jurídico e protocolar.

## Prospecção

Produto comercial, não processual, e de ciclo muito curto.

- Nova oportunidade é identificada e validada; o coordenador envolve o técnico responsável.
- A equipe de prospecção baixa os documentos em pasta específica e avisa as coordenadoras **por WhatsApp** indicando o responsável.
- O técnico avalia se todos os documentos foram disponibilizados, preenche a planilha de análise e elabora o **Relatório de Prospecção**. **Prazo: 2 horas.**
- Encaminha o relatório à equipe RJ, também em 2 horas.

Documentos analisados: balanço patrimonial dos últimos 3 anos, DRE acumulada dos últimos 3 anos, DRE do exercício corrente assinada pelo contador, fluxo de caixa realizado dos 3 últimos anos mais o corrente, e fluxo de caixa projetado.

## Prestação de Contas

Acionado por determinação judicial, referente ao recebimento de vendas de ativos ou liberação de valores usados na operação.

- A equipe RJ acompanha as demandas emitidas pelo juiz, avalia e envia e-mail à área técnica indicando a determinação.
- A área técnica envia e-mail à recuperanda solicitando os documentos que lastreiam a venda.
- Realiza as análises e cruzamentos necessários e elabora o **Relatório de Prestação de Contas**.
- **As demandas são específicas para cada caso** - não há template fixo.

## Consequências de projeto

1. **O RMA é um de cinco produtos da mesma área, com estrutura parecida**: check list de documentos, prazo, análise técnica, relatório, protocolo. Se o sistema nascer específico do RMA, os outros quatro não entram sem refatoração no núcleo. Isso é a pergunta P-12 em [[perguntas-cliente]], e o fluxo reforça que ela é estrutural.
2. **O calendário mensal é regra, não detalhe**: dia 10 (cobrança), dia 20 (prazo da recuperanda), D+2 (checagem e cobrança de pendência), último dia útil (protocolo). Ainda não existe `RN-x` para isso.
3. **Há dois fluxos de RMA no material**: o manual (este) e o automatizado ([[fluxo-processo]]). Eles não são idênticos - o automatizado não menciona prazos, e o manual não menciona IA. O sistema novo precisa reconciliar os dois.
4. **DAL, Constatação Prévia e Prospecção envolvem outras equipes** (Falência, Listas, Prazos, Jurídico, RJ, Prospecção). O modelo de papéis em [[modelo-dados]] hoje só conhece técnico, revisor, coordenação e administrador judicial.

## Links

- Fluxo automatizado proposto: [[fluxo-processo]]
- Perguntas em aberto: [[perguntas-cliente]]
