# Perguntas ao Cliente - rodada 1

> Consolidado do que precisa de confirmação externa antes de qualquer spec. Levantado a partir do material em [[fontes-escopo]], das notas de domínio e da mineração do código legado em [[sistema-legado]].
>
> Registre a resposta abaixo de cada item conforme forem chegando, e atualize [[pendencias-externas]] e [[regras-negocio]] em seguida.

## Placar

| Estado | Itens |
|---|---|
| **Respondida** | P-1 (fórmulas, por Gisele em 04/08/2026, com corroboração no escopo) |
| **Respondida pelo escopo, falta confirmar** | P-4 (modelo de consolidação, achado em [[telas-legado]]), P-8 (OneDrive como origem, achado em [[sistema-legado]]) |
| **Em aberto, trava spec** | P-2, P-3, P-5, P-6 |
| **Em aberto, confirmação** | P-7, P-9 a P-27 |

**Versão 3.** A v1 tinha 12 perguntas abertas. A v2, após minerar o código legado, tinha 17 com evidência na mesa. Esta v3 vem depois da leitura integral do escopo: uma foi respondida, duas se resolveram no próprio material, e dez novas apareceram - a maioria por divergência entre documentos do cliente.

Lição registrada: **três perguntas que eu ia mandar já estavam respondidas no escopo**. As fórmulas estavam na planilha `01.BASE RELATÓRIO`, o modelo de consolidação estava na tela de cadastro, e o destino dos arquivos estava no código. Ler tudo antes de perguntar não é zelo, é o que evita queimar credibilidade com o cliente.

## A · Decisões que travam specs

### P-1 · Indicadores da seção 12 do RMA

**Pergunta:** qual é a fórmula correta de EBITDA, dos índices de liquidez, da relação receita x custo (CMV) e da relação receita x resultado?

**O que já sabemos:** o sistema anterior calculava EBITDA de **cinco formas diferentes**, no mesmo repositório - uma delas com um fator de 10% comentado apenas como "simplified proxy". Liquidez Geral tem quatro versões. Prazos médios usam base 30 dias num lugar e 360 noutro. Existe um documento em outro repositório que se declara "Single Source of Truth" e traz um conjunto coerente (ver [[sistema-legado]]) - é o candidato mais forte, mas não sabemos se foi aprovado por alguém.

**Por que importa:** trava [[regras-negocio#RN-41]] e a seção 12 inteira.

**RESPONDIDA - 04/08/2026, por Gisele (área técnica do cliente).**

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
Resultado x Receita Líquida = Resultado Líquido / Receita Líquida (margem líquida)
```

Corroborada de forma independente pela planilha `01.BASE RELATÓRIO_xi teste.XLSM`, que é escopo do cliente: aba `P&L + EBITDA` linhas 62 a 71 e aba `INDICE` linhas 42 a 45. As duas fontes coincidem termo a termo, inclusive no sinal negativo das receitas financeiras.

Registrada em [[regras-negocio#RN-41]]. Detalhe e rastreabilidade em [[formulas-sistema-anterior]].

**Ainda em aberto neste tópico**, por não terem sido perguntados:

- Endividamento tem duas bases na planilha: `(PC + PNC) / Patrimônio Líquido` e `(PC + PNC) / Ativo Total`. Qual vale em qual contexto?
- Prazos médios (recebimento, pagamento, estoque): base de 30 ou de 360 dias?
- ROA e ROE eram anualizados multiplicando o resultado mensal por 12. Confirma?
- Na aba `Dados para Graficos`, as linhas "RESULTADO / RECEITA LIQUIDA (%)" e "CMV + DESPESA / RECEITA LIQUIDA (%)" dividem pelo lucro líquido, e não pela receita líquida. É intencional?

### P-2 · Limiar do alerta de variação

**Pergunta:** a partir de que variação de saldo entre um mês e o anterior o sistema deve alertar? O limite é o mesmo para todas as contas e todos os clientes?

**O que já sabemos:** o material de escopo diz "geralmente superior a 15% ou 20%". O código tem três limiares diferentes em uso: queda de receita a -15%, alta de custos a +15%, e materialidade de variação a ±20%.

**Por que importa:** trava [[regras-negocio#RN-34]].

**Resposta:**

### P-3 · Tolerância de conciliação

**Pergunta:** qual diferença entre o valor de um documento e o saldo da conta ainda é aceitável?

**O que já sabemos:** o código usa R$ 0,01 para DRE x balancete, R$ 0,05 como padrão da conciliação por conta, 0,1% para a equação Ativo = Passivo + PL, 1% para conflito entre documentos, e uma política de materialidade com piso de R$ 50.000 ou 5% da receita líquida. As colunas para tolerância por empresa existem no banco, mas nunca foram preenchidas.

**Por que importa:** trava [[regras-negocio#RN-33]].

**Resposta:**

### P-4 · Grupo econômico

**Pergunta:** quando um processo tem várias empresas em recuperação, o relatório é um por empresa, um consolidado do grupo, ou os dois?

**O que já sabemos:** o sistema anterior era **exclusivamente por empresa**. Não havia tabela de processo judicial nem qualquer noção de grupo econômico. Mais: a planilha de controle que a recuperanda preenche **suporta layout multi-empresa, e o sistema descartava essa informação na leitura**, agregando os subitens. Queremos saber se isso era o desejado ou uma limitação.

**Por que importa:** define se a competência pende de empresa ou de processo. Muda [[modelo-dados]] na raiz.

**RESPONDIDA PELO ESCOPO (04/08/2026).** A tela de cadastro de recuperanda (`Telas/19.png`) pede o **modelo de consolidação** já no cadastro: **Consolidação Processual** (vários CNPJ, cada empresa gerida individualmente) ou **Consolidação Substancial** (um único CNPJ, todas tratadas como uma entidade para relatório e acompanhamento). Há também hierarquia de matriz e filial. Ver [[telas-legado]]. Resta confirmar que os dois modelos entram no produto.

**Resposta:**

### P-5 · Obrigatoriedade de documentos

**Pergunta:** das 61 pastas, quais são obrigatórias todo mês? Isso varia por segmento da empresa ou por estágio do processo?

**O que já sabemos:** **nada.** O sistema anterior tinha a tabela de obrigatoriedade pronta, com níveis obrigatório, condicional e opcional, e ela ficou **vazia**. Só duas pastas eram marcadas como exigidas no código: Balancete e DRE. Não havia nenhuma regra ligada a segmento ou a estágio processual.

**Por que importa:** sem isso, o check list de faltantes não tem critério. É a pergunta mais importante desta lista.

**Resposta:**

### P-6 · Planilhão técnico

**Pergunta:** as planilhas de consolidação usadas hoje continuam existindo depois do novo sistema? Se sim, para quê?

**Por que importa:** decide se o sistema precisa gerar Excel no formato atual. Candidato a ADR.

**Resposta:**

## B · Confirmações sobre o sistema anterior

### P-7 · Numeração das pastas

**Pergunta:** qual é a numeração canônica das pastas de documentos, e o que deve acontecer quando a pasta de um cliente não segue ela?

**O que já sabemos:** nos dados reais, "Resumo da folha de pagamento" é a pasta 15 num cliente e 09 em outro, e a numeração muda de ano para ano dentro do mesmo cliente. No código havia **três listas concorrentes**: duas com 61 itens numerados de 1 a 61 e uma com 60 itens numerados de forma diferente. O sistema tentava resolver isso normalizando nome e casando por semelhança, mas sem dicionário persistido.

**Resposta:**

### P-8 · Onde os arquivos vivem

**Pergunta:** o OneDrive continua sendo o repositório dos documentos, com o sistema apenas lendo de lá?

**O que já sabemos:** era assim. O sistema guardava só o ponteiro e buscava o arquivo sob demanda, com a hierarquia `Projeto RMA / Cliente / Ano / Mês` imposta em código. Havia também uma rota paralela de upload manual. Só precisamos confirmar que segue valendo.

**Resposta:**

### P-9 · A DRE vem acumulada

**Pergunta:** os balancetes que recebemos trazem os saldos de resultado acumulados no ano, exigindo subtrair o mês anterior para obter o mês isolado?

**O que já sabemos:** o sistema anterior fazia essa desacumulação de forma determinística, pulando a virada de ano. Não está em nenhum documento do escopo. Se a premissa estiver errada, todo indicador de resultado sai errado.

**Resposta:**

### P-10 · Plano de contas

**Pergunta:** no plano de contas dos clientes, o grupo 4 é receita ou custo da mercadoria vendida?

**O que já sabemos:** o sistema anterior tinha **duas convenções conflitantes** no mesmo código. Um módulo classificava 4 como receita e 5 como despesa; outro classificava 4 como CMV e 5 como custo industrial. Pode ser bug, pode ser que clientes diferentes usem planos diferentes.

**Resposta:**

### P-11 · Faixas de aging

**Pergunta:** as faixas de vencimento de contas a pagar e a receber são 0-30, 30-90, 90-180 e acima de 180 dias, ou há corte adicional em 60 dias?

**O que já sabemos:** o escopo define quatro faixas. O código tinha três definições diferentes, uma delas com seis faixas.

**Resposta:**

### P-12 · Referencial de ativo não circulante

**Pergunta:** continua valendo a regra de que o Ativo Não Circulante é o sintético do grupo 12, e que o grupo 13 (Ativo Permanente) é bucket independente, não compondo ANC nem Ativo Total?

**O que já sabemos:** essa regra está documentada no código como "Referencial Giannini, 28/05/2026". É decisão de domínio tomada com alguém, e queremos saber se segue de pé.

**Resposta:**

### P-13 · Dados da Geratherm no código

**Pergunta:** o sistema anterior tinha valores contábeis reais de um cliente (Geratherm) e textos de parecer prontos embutidos em arquivos de configuração. Isso era calibração intencional?

**Por que importa:** não vamos replicar. Perguntamos para entender se havia motivo.

**Resposta:**

## C · Sobre o material e o escopo do produto

### P-14 · Os outros quatro produtos

**Pergunta:** o sistema deve atender também DAL, Constatação Prévia, Prospecção e Prestação de Contas, agora ou mais adiante?

**O que já sabemos:** o Manual de Operações descreve os cinco produtos com estrutura parecida (check list, prazo, análise, relatório, protocolo). Dos cinco, o código legado cobre RMA e um módulo pequeno de Prospecção. **DAL, Constatação Prévia e Prestação de Contas não existem em nenhum repositório.**

**Por que importa:** se entrarem, mesmo que no futuro, o modelo precisa nascer preparado para mais de um tipo de entrega. Descobrir depois custa refatoração no núcleo.

**Resposta:**

### P-15 · O calendário mensal

**Pergunta:** os prazos do Manual de Operações continuam valendo? Dia 10 para a cobrança, dia 20 como prazo da recuperanda, dois dias úteis para a checagem, e último dia útil como prazo fatal de protocolo.

**O que já sabemos:** estão no fluxo manual da área técnica, mas o fluxo automatizado proposto não menciona prazo nenhum. Os dois documentos divergem.

**Resposta:**

### P-16 · Seção 13 do RMA

**Pergunta:** o RMA de março de 2026 usado como referência vai da seção 12 direto para a 14. A seção 13 foi removida, ficou vazia naquele mês, ou a numeração é assim mesmo?

**Resposta:**

### P-17 · Telas e pastas de IA

**Pergunta:** o conjunto de telas tem 19 imagens numeradas de 1 a 20, sem a 4 - falta alguma? E as pastas com nome de IA que aparecem no OneDrive dos clientes (Entradas IA, Processando IA, Processados IA, Erros IA, Auditoria IA, Relatórios IA) pertencem a algum processo em funcionamento hoje?

**Resposta:**

## D · Novas, vindas da leitura integral do escopo (04/08/2026)

### P-18 · Contradição sobre a pasta 21

**Pergunta:** a pasta 21 (GFIP, INSS e FGTS) tem conciliação com o balancete?

**Por que importa:** dois documentos do escopo se contradizem. O `Código de Pastas ... identificação.xlsx` diz que sim, com regra detalhada. Os comentários do RMA anotado dizem "não tem conciliação com balancete". Ver [[mapa-secao-pasta]].

**Resposta:**

### P-19 · Conciliação por seção, não por pasta

**Pergunta:** confirmam que a mesma pasta pode ter conciliação em um item do RMA e não ter em outro?

**Por que importa:** a pasta 15 aparece sem conciliação nos itens 5, 5.1 e 5.2, e com conciliação nos itens 5.4 e 5.5. Se for regra, o modelo precisa pendurar a conciliação no par seção/pasta, não na pasta.

**Resposta:**

### P-20 · Conciliação condicional

**Pergunta:** para contingência, arrendamento mercantil e ACC, o escopo diz "algumas empresas contabilizam" e "pode ter conciliação". Como o sistema decide se concilia ou não nesses casos?

**Resposta:**

### P-21 · Tipos de documento nas telas

**Pergunta:** as telas mostram 7 tipos de documento (demonstrações contábeis, extratos bancários, relatório de atividades, folha de pagamento, comprovantes de recolhimentos, contratos, outros). Isso substitui as 61 pastas ou é só agrupamento de visualização?

**Resposta:**

### P-22 · Status do RMA

**Pergunta:** qual é a lista correta de status? As próprias telas mostram duas listas diferentes, e o fluxograma mostra uma terceira.

**Por que importa:** telas de recuperandas mostram `Em elaboração`, `Em andamento`, `Aguardando dados`, `Concluído`; a tela de RMAs mostra `Protocolado`, `Em análise`, `Aguardando peças`, `Finalizado`, `Aguardando retorno`, `Cancelado`; o fluxo fala em `Revisar` e `Aprovado`. Ver [[telas-legado]].

**Resposta:**

### P-23 · Seis seções ou dezoito

**Pergunta:** a tela de progresso mostra 6 blocos (informações gerais, resumo das atividades, informações financeiras, créditos, informações complementares, conclusão), mas o RMA real tem 18 seções. São agrupamentos de progresso ou outra estrutura de relatório?

**Resposta:**

### P-24 · Perfis de acesso

**Pergunta:** confirmam os seis perfis das telas - Administrador, Coordenador, Colaborador, Administrador Judicial, Recuperanda e Magistrado? O magistrado acessa o sistema diretamente?

**Resposta:**

### P-25 · Multi-tenant por administrador judicial

**Pergunta:** o sistema atende mais de um administrador judicial, cada um com seu logotipo aplicado nos relatórios, como sugere a tela de cadastro de AJ?

**Resposta:**

### P-26 · Balancete acumulado e formato

**Pergunta:** o balancete chega como no exemplo - uma coluna por mês, código de conta hierárquico - e os valores de resultado vêm acumulados no ano?

**Por que importa:** junta-se à P-9. O formato do arquivo de exemplo confirma a estrutura de entrada.

**Resposta:**

### P-27 · Índice de Solvência Geral

**Pergunta:** o parecer da Raízen registra a decisão de não usar o Termômetro de Kanitz e usar o Índice de Solvência Geral. Quando cada um se aplica?

**Por que importa:** o escopo mostra os dois em uso, com critério de escolha que hoje é do técnico.

**Resposta:**

## Texto para envio

```
Assunto: RMA BEx - confirmações necessárias antes de iniciarmos

Olá,

Concluímos a leitura de todo o material de escopo e também a análise dos
três sistemas desenvolvidos pela equipe anterior. Isso respondeu boa
parte das nossas dúvidas, e transformou outras em perguntas mais
específicas.

São 17 pontos. Os seis primeiros nos impedem de começar; o resto é
confirmação, e a maioria se responde em uma linha.

BLOQUEANTES

1. Qual é a fórmula correta de EBITDA, dos índices de liquidez, da
   relação receita x custo (CMV) e da relação receita x resultado?
   Encontramos cinco fórmulas diferentes de EBITDA no sistema anterior,
   uma delas com um fator de 10% marcado no código apenas como
   "aproximação simplificada". Precisamos saber qual é a boa.

2. A partir de que variação de saldo de um mês para o outro o sistema
   deve alertar? O material diz "geralmente 15% ou 20%", e o sistema
   anterior usava três valores diferentes conforme o caso.

3. Qual diferença entre o valor de um documento e o saldo da conta ainda
   é aceitável para considerarmos a conferência correta? O sistema
   anterior usava de um centavo a um por cento, dependendo do ponto.

4. Quando um processo tem várias empresas em recuperação, o relatório é
   um por empresa, um consolidado do grupo, ou os dois? O sistema
   anterior trabalhava sempre por empresa e descartava a informação de
   grupo que vem na planilha de controle. Isso era o desejado?

5. Das 61 pastas de documentos, quais são obrigatórias todo mês? Essa
   lista muda conforme o segmento da empresa ou o estágio do processo?
   O sistema anterior tinha a estrutura pronta para isso e nunca foi
   preenchida, então não temos de onde tirar.

6. As planilhas de consolidação usadas hoje continuam existindo depois
   do novo sistema? Se sim, com que finalidade?

CONFIRMAÇÕES

7. Qual é a numeração canônica das pastas de documentos? Nos dados que
   recebemos, "Resumo da folha de pagamento" é a pasta 15 em um cliente
   e a 09 em outro, e muda de um ano para o outro dentro do mesmo
   cliente. E o que deve acontecer quando as pastas não seguem o padrão?

8. O OneDrive continua sendo o lugar onde a empresa deposita os
   documentos, com o sistema apenas lendo de lá?

9. Os balancetes trazem os valores de resultado acumulados no ano,
   exigindo subtrair o mês anterior para obter o mês isolado? O sistema
   anterior fazia essa conta.

10. No plano de contas dos clientes, o grupo 4 é receita ou custo da
    mercadoria vendida? O sistema anterior tratava das duas formas em
    lugares diferentes.

11. As faixas de vencimento de contas a pagar e a receber são 0-30,
    30-90, 90-180 e acima de 180 dias, ou existe corte adicional em 60?

12. Continua valendo a regra de que o Ativo Não Circulante é o grupo 12,
    e que o grupo 13 (Ativo Permanente) fica de fora do ANC e do Ativo
    Total? Está registrada no sistema anterior como definição de
    28/05/2026.

13. O sistema anterior tinha valores contábeis reais de um cliente e
    textos de parecer prontos gravados dentro do código. Isso foi
    intencional?

SOBRE O ESCOPO E O MATERIAL

14. O sistema deve atender também DAL, Constatação Prévia, Prospecção e
    Prestação de Contas, agora ou mais adiante? Os cinco processos estão
    no Manual de Operações, mas só RMA e parte de Prospecção existem no
    sistema anterior.

15. Os prazos do Manual de Operações continuam valendo? Dia 10 para a
    cobrança, dia 20 como prazo da empresa, dois dias úteis para a
    checagem e último dia útil para o protocolo. O fluxo automatizado
    que recebemos não menciona prazo nenhum.

16. No relatório de março de 2026, a numeração vai da seção 12 direto
    para a 14. A seção 13 foi removida, ficou vazia naquele mês, ou é
    assim mesmo?

17. O conjunto de telas tem 19 imagens numeradas de 1 a 20, sem a de
    número 4 - falta alguma? E as pastas com nome de IA que aparecem no
    OneDrive (Entradas IA, Processando IA, Processados IA, Erros IA,
    Auditoria IA, Relatórios IA) fazem parte de algum processo em
    funcionamento hoje?

Qualquer um desses pontos que renda conversa, podemos marcar uma call.

Abraço,
```
