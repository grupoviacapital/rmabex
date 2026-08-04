# Fluxo Ponta a Ponta - o ciclo do RMA, do início ao protocolo

> Reconcilia as **três** descrições do mesmo processo que temos:
>
> 1. **Como funciona hoje**: `fluxogramas/manual-fluxo-rma.png`, do `Manual de Operações_Área Técnica_V2.xlsx`. Ver [[fluxos-area-tecnica]].
> 2. **Como eles propuseram automatizar**: `fluxogramas/rma-ia.png`, do `Fluxo Processo RMA IA_v3.xlsx`. Ver [[fluxo-processo]].
> 3. **Como o cliente descreve o problema**, em 04/08/2026. É a fonte mais direta das três, e chegou por último.
>
> Esta nota fecha a pendência "reconciliar o fluxo manual e o automatizado, que divergem", aberta no [[ROADMAP]].

## O problema, na palavra do cliente

> *"Estamos tendo muito trabalho em gerar o RMA porque todos aqueles documentos por mês que a recuperanda coloca no OneDrive são lidos um a um de forma manual pela equipe, coloca as informações nesse planilhão que usa fórmulas para gerar os resultados, gráficos e outras informações, e tudo é inserido manual no RMA final. Por isso estamos desenvolvendo essa plataforma pra gerar tudo pela IA."*
>
> Luiz, 04/08/2026

Isso nomeia o gargalo com precisão, e **não é o cálculo**. As fórmulas já existem e funcionam ([[motor-calculo]]). O custo está em três trabalhos manuais em sequência:

| Trabalho manual | Volume real |
|---|---|
| Ler os documentos um a um | 397 arquivos numa única competência da GERATHERM (01.2026) |
| Digitar os valores no planilhão | 14 abas, alimentadas à mão |
| Colar os resultados no RMA | 40 imagens no RMA de março/2026 |

O sistema não é "um Excel melhor". Ele substitui **a leitura, a digitação e a colagem**.

## O ciclo hoje, em dez passos

Os passos em **negrito** são os que o cliente citou como o trabalho pesado.

| # | Passo | Quando | Quem |
|---|---|---|---|
| 1 | Insere a recuperanda na planilha de controle | ao iniciar | técnico |
| 2 | E-mail à recuperanda com link para anexar documentos | até o **dia 10** | técnico |
| 3 | Recuperanda anexa os documentos no OneDrive | até o **dia 20** (`D`) | recuperanda |
| 4 | Checagem do recebimento: todos os documentos vieram? | `D + 2` dias úteis | técnico |
| 5 | E-mail detalhando e cobrando pendências, e registro nos controles | `D + 2` dias úteis | técnico |
| 6 | **Leitura documento a documento** | - | técnico |
| 7 | **Digitação dos valores no planilhão**, que calcula indicadores e gráficos | - | técnico |
| 8 | Análise cruzada do balancete com a documentação de suporte | - | técnico |
| 9 | **Colagem manual dos gráficos e quadros no `.docx`** | - | técnico |
| 10 | Prepara e protocola o RMA | **último dia útil**, referente ao **mês anterior** | técnico |

Duas regras explícitas do fluxograma, que não são detalhe:

- **Pendência de mês anterior é cobrada junto com a do mês vigente** (ponto de atenção 1). É a [[regras-negocio#RN-48]].
- **O histórico de cobranças e esclarecimentos vai para apenso do RMA e para o tópico Fatos Relevantes** (ponto de atenção 2). Não é log interno, é conteúdo do relatório. É a [[regras-negocio#RN-49]], e bate com os "Apenso II" que aparecem no RMA real da XPT.

## O ciclo automatizado que eles desenharam

Quatro raias, no `rma-ia.png`. O esqueleto é o mesmo; o que muda é quem executa os passos 4 e 6 a 9.

**Raia 1 - Técnico: cadastro e check list.** Cadastra a recuperanda no Portal RMA, seleciona o segmento do relatório, clica em `Efetuar Check List Documentação`. Se falta documento, o sistema envia e-mail à recuperanda e ao técnico com a relação de faltantes, e o ciclo repete até fechar.

**Raia 2 - IA: recebe, confere e trata.** Executa o check list contra o OneDrive, gera a relação de faltantes, insere a planilha `BALANCETE`.

**Raia 3 - IA: valida.** Executa a Análise Técnica do Balancete, apresenta as divergências, faz a leitura dos comprovantes, compara comprovante contra as principais contas, insere na planilha base, joga no planilhão, atualiza o mês, gera os gráficos, insere os gráficos no RMA e gera o relatório. Se há divergência, e-mail para coordenação e técnico.

**Raia 4 - Técnico: valida.** Recebe o relatório, confere as informações, marca quais divergências são relevantes, insere manualmente o que a IA não conseguiu preencher. Depois: status `Revisar` -> revisor -> `Aprovado` -> `Protocolar` -> diretório "Documento Protocolado" -> e-mail comunicando o protocolo -> FIM.

## A reconciliação

Os dois fluxogramas **não se contradizem**: eles descrevem camadas diferentes do mesmo ciclo, e cada um cala sobre o que o outro diz.

| Passo do ciclo | Fluxo manual | Fluxo automatizado | O que o sistema faz |
|---|---|---|---|
| 1 cadastro | planilha de controle | Portal RMA, com segmento | substitui a planilha |
| 2 cobrança dia 10 | descrito, com prazo | **não menciona** | automatiza, e o prazo vem do manual |
| 3 entrega | OneDrive | OneDrive | mantém, até a plataforma virar repositório |
| 4 checagem | manual | botão `Efetuar Check List` | **automatiza por completo** |
| 5 cobrança de pendência | manual, `D+2` | e-mail automático | automatiza, e o prazo vem do manual |
| 6 leitura dos documentos | **manual, um a um** | IA lê comprovantes | **é o coração do produto** |
| 7 digitação e cálculo | **manual, no planilhão** | IA insere na planilha base | substitui o planilhão por modelo de dados |
| 8 análise cruzada | manual | Análise Técnica + divergências | automatiza, com o técnico julgando relevância |
| 9 montagem do relatório | **colagem manual** | gera gráficos e insere no RMA | gera o documento inteiro |
| 10 protocolo | manual, último dia útil | `Protocolar` + diretório + e-mail | automatiza, e o prazo vem do manual |

**A divergência real é uma só, e é omissão, não conflito: o fluxo automatizado não tem calendário.** Nenhum prazo aparece nele. Os prazos existem só no fluxo manual, e são obrigação de processo. O sistema tem de sobrepor um ao outro.

Isso corrige a ressalva de [[regras-negocio#RN-47]], que registrava os dois documentos como divergentes: eles não divergem, um é silencioso. **O fluxograma manual é uma segunda fonte confirmando os prazos do Manual de Operações**, o que enfraquece bastante a P-15 de [[perguntas-cliente]].

## O que este fluxo já responde

| Pergunta | O que o fluxo mostra |
|---|---|
| **P-6** planilhão | Está respondida na prática: o planilhão é o **artefato intermediário do trabalho manual**. Some junto com a digitação. Resta só decidir se exportamos Excel no formato dele. |
| **P-15** calendário | Confirmado por segunda fonte. O automatizado é omisso, não contraditório. |
| **P-22** status | O fluxo usa `Revisar`, `Aprovado`, `Protocolado`. É a lista operacional, contra as duas outras listas das telas. |
| **P-35** amostragem | O fluxo não tem etapa de amostragem. A amostragem é escolha do técnico dentro do passo 8, não etapa do processo. |

## A ordem lógica de execução que sai daqui

Se o gargalo declarado é a leitura dos documentos, a ordem das specs deve caminhar **pelo ciclo**, entregando valor no ponto em que a dor está, e não pela ordem de numeração.

| Ordem | Spec | Passo do ciclo que resolve | Valor entregue |
|---|---|---|---|
| 1 | 001 Scaffold | - | base |
| 2 | 002 Cadastro | 1 | substitui a planilha de controle |
| 3 | 003 Taxonomia | 4 | reconhece o documento pelo conteúdo |
| 4 | 004 Check list | 4 e 5 | **primeiro ganho visível**: acaba a conferência manual de recebimento |
| 5 | 005 Balancete | 6 e 7 | o eixo da conciliação entra no modelo |
| 6 | **008 Extração por IA** | 6 | **o gargalo declarado pelo cliente** |
| 7 | 006 Conciliação | 8 | substitui a análise cruzada |
| 8 | 007 Alertas | 8 | dirige a atenção do técnico |
| 9 | 009 Geração do RMA | 9 | acaba a colagem manual |
| 10 | 010 Revisão e protocolo | 10 | fecha o ciclo |
| 11 | 011 Esclarecimentos | 5 e 8 | fecha o laço de pendências |

**A mudança relevante em relação ao [[ROADMAP]] anterior é a 008 subir**, de oitava para sexta, antes da conciliação. O roadmap a colocava depois porque a dependência técnica dela é só a 004; mas ela é o passo que o cliente nomeou como o trabalho pesado, e a 006 sem ela concilia contra valores digitados à mão.

A **012 (shell de UI)** corre em paralelo, depois da 001.

## Links

- Como funciona hoje, com os cinco produtos: [[fluxos-area-tecnica]]
- O fluxo automatizado, passo a passo: [[fluxo-processo]]
- A planilha que some: [[motor-calculo]]
- O que o relatório final precisa ter: [[anatomia-rma]]
- Ordem e status das specs: [[ROADMAP]]
