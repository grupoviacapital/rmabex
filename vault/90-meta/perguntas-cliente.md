# Perguntas ao Cliente - rodada 1

> Consolidado do que precisa de confirmação externa antes de qualquer spec. Levantado a partir do material em [[fontes-escopo]], das notas de domínio e da mineração do código legado em [[sistema-legado]].
>
> Registre a resposta abaixo de cada item conforme forem chegando, e atualize [[pendencias-externas]] e [[regras-negocio]] em seguida.

## Situação em 04/08/2026

São 35 itens, mas a contagem bruta engana. O que importa é o que cada um trava.

| Estado | Quantos | Itens |
|---|---|---|
| **Resolvido** | 6 | P-1 fórmulas · P-4 consolidação · P-8 origem dos arquivos · P-9 DRE acumulada · P-26 formato do balancete · P-32 segundo ciclo de cobrança |
| **Estreitado pelos dados, virou revisão de tabela** | 2 | P-5 obrigatoriedade · P-33 vocabulário de status (resposta anterior **corrigida**) |
| **Estreitado pelos dados, virou confirmação de número** | 2 | P-2 limiar de variação (15%) · P-3 tolerância (zero) |
| **Decisão de produto, não bloqueia código** | 1 | P-6 planilhão |
| **Achado nosso, não é dúvida** | 9 | P-18, P-22, P-28, P-29, P-30 e as demais divergências que encontramos no material do cliente |
| **Confirmação, não bloqueia** | 14 | P-7, P-10 a P-17, P-19 a P-21, P-23 a P-25, P-27, P-31 a P-32 |
| **Pedido de material** | 2 | P-34 (`Gestão Técnico2.xlsx` e os check lists) · P-35 metodologia de amostragem |

### O conjunto que trava encolheu

A versão 2 tinha **seis** perguntas bloqueantes. Hoje **nenhuma trava spec**, e sobra um único ponto de desenho em aberto (o piso de valor do alerta, na P-2):

| Spec | Depende de | Situação |
|---|---|---|
| 001 Scaffold | nada | **liberada** |
| 002 Cadastro | P-4, resolvida | **liberada** |
| 003 Taxonomia de pastas | nada bloqueante | **liberada** |
| 005 Importação do balancete | P-9 e P-26, resolvidas | **liberada** |
| 004 Check list | P-5, estreitada em 04/08/2026 | **liberada** com a tabela observada de [[controle-entrega]] como padrão editável |
| 006 Conciliação | P-3, estreitada em 04/08/2026 | **liberada** com tolerância zero e encerramento por justificativa |
| 007 Alertas | P-2, estreitada em 04/08/2026 | **liberada** com 15% configurável; resta decidir se a regra tem piso de valor |
| 009 Geração do RMA | P-1, resolvida | liberada quando 006 estiver |

As sete specs podem ser escritas agora.

As três destravaram pelo mesmo motivo: a pergunta mudou de natureza. Não sabíamos quais documentos são obrigatórios, qual o limiar de alerta nem qual a tolerância. Agora sabemos o que **75 meses de operação real** e **dois RMAs reais** mostram, e o que falta é o cliente confirmar um padrão. Pelo critério do Saulo, "sim" e "não" levam ao mesmo código: a resposta vira valor de configuração, não estrutura.

**A única exceção honesta** é o piso de valor do alerta de variação (P-2). Se a regra for só percentual ou percentual mais piso em reais, isso muda a regra e o formulário de configuração. É o único ponto onde a resposta ainda mexe no desenho, e mesmo ele se resolve nascendo com o piso opcional, com padrão zero.

### Sobre a lista crescer

Ela cresce porque muda de natureza, não porque sabemos menos. A v1 perguntava "como vocês calculam EBITDA". Hoje sabemos a fórmula, sabemos de onde ela sai, e a pergunta virou "a planilha de vocês soma Compromissos RJ como se fosse depreciação, é intencional?".

Nove dos itens **não são dúvidas nossas** - são defeitos que encontramos no material do cliente. Não bloqueiam nada do nosso lado; existem porque descobrir e não avisar seria pior.

**Versão 5.** v1: 12 perguntas abertas, nenhuma evidência. v2: 17, com o código legado minerado. v3: 27, com o escopo lido por cima. v4: 35, com o escopo lido integralmente. v5: as mesmas 35, com as **104 planilhas de controle** lidas célula a célula - a P-5, que era "a pergunta mais importante desta lista", virou revisão de tabela, e a P-32 fechou.

Lição registrada: **seis perguntas que eu ia mandar já estavam respondidas no material recebido.** As fórmulas na planilha `01.BASE RELATÓRIO`, o modelo de consolidação na tela de cadastro, o destino dos arquivos no código, o regime acumulado do balancete nos próprios dados. Ler tudo antes de perguntar não é zelo: é o que evita gastar a paciência do cliente com o que ele já entregou.

Lição da v5, que é o contrário e vale igual: **uma resposta que dei como "resolvida pelos dados" estava errada.** A P-33 dizia que o vocabulário de status vinha "do uso real em 105 planilhas"; vinha de 3. Contei ocorrências sem olhar em quantos arquivos elas estavam. Evidência é quantidade **e** distribuição.

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

**O que já sabemos:** o material de escopo diz "geralmente superior a 15% ou 20%", no `retorno_da_plataforma.txt`. É o **único número em todo o escopo**. O código tem três limiares diferentes em uso: queda de receita a -15%, alta de custos a +15%, e materialidade de variação a ±20%. O motor de cálculo não tem limiar nenhum: as únicas regras de formatação condicional das duas instâncias da planilha destacam valor negativo.

**O que a varredura de 04/08/2026 acrescentou.** Os dois RMAs reais mostram a escala que o técnico usa na prática, e ela é consistente com a faixa de 15% a 20%:

| Variação | O que o técnico fez |
|---|---|
| até 4,30% | descartou explicitamente ("sem grandes variações") |
| 10,90% a 17,96% | narrou com justificativa, sem escalar |
| 24% a 44% | apontou como "principais variações" |
| 50% e 139% | "aumentos bem significativos" |
| 531% e 750% | pedido formal de esclarecimento, em apenso |

**Por que continua travando:** trava [[regras-negocio#RN-34]]. A escala observada sustenta **15% como padrão**, mas não responde duas coisas que mudam o código:

1. **Piso de valor.** A variação é calculada por conta do balancete, e o balancete é analítico. Uma conta que vai de R$ 10 para R$ 100 varia 900% e não interessa a ninguém. Sem um piso em reais, o alerta vira ruído no primeiro mês de uso. O sistema anterior tinha esse piso (R$ 50.000 ou 5% da receita líquida), mas nunca ligado ao alerta de variação.
2. **Se o limiar é um só.** Nada no material sugere limiar por conta ou por cliente. O sistema anterior tinha limiares diferentes para receita e para custo, o que é outra coisa: sinal por natureza de conta.

**Resposta:**

### P-3 · Tolerância de conciliação

**Pergunta:** qual diferença entre o valor de um documento e o saldo da conta ainda é aceitável?

**O que já sabemos:** o código usa R$ 0,01 para DRE x balancete, R$ 0,05 como padrão da conciliação por conta, 0,1% para a equação Ativo = Passivo + PL, 1% para conflito entre documentos, e uma política de materialidade com piso de R$ 50.000 ou 5% da receita líquida. As colunas para tolerância por empresa existem no banco, mas nunca foram preenchidas.

**O que a varredura de 04/08/2026 acrescentou: na prática a tolerância é zero, e o que existe no lugar dela é um fluxo de justificativa.**

Quatro fontes, todas na mesma direção:

- O quadro **"Saldos Bancários em Março/2026"** do RMA real traz uma linha `DIFERENÇA` explícita. As sete contas fecham em **zero, ao centavo** (91,51 · 5.125,95 · 87,55 · 422,43 · 36.419,41 · 849,34). Foi este quadro que o técnico chamou de "conciliados".
- A taxonomia de pastas diz "o valor do relatório **deve conciliar** com o saldo da conta". Sem faixa, sem percentual.
- O texto dos dois RMAs é binário: "está conciliado" ou "não está conciliado". A palavra tolerância não aparece uma vez.
- O motor de cálculo não tem nenhuma regra de limiar.

E quando a diferença **não** é zero, ela não é absorvida por faixa nenhuma: vira pedido de esclarecimento, e é encerrada por justificativa registrada no corpo do relatório. Em março/2026, fornecedores não conciliou porque notas de serviço e faturas não entram no livro fiscal; o passivo fiscal não conciliou porque PIS e COFINS foram compensados com créditos do período. Nos dois casos a divergência ficou registrada com a explicação, não foi silenciada. Ver [[regras-negocio#RN-33.1]].

**Por que ainda vale perguntar:** trava [[regras-negocio#RN-33]]. Tolerância zero é defensável como padrão e é o que a evidência mostra, mas há um caso que a evidência não cobre: **diferença de centavos por arredondamento**, quando o relatório da recuperanda vem em milhares e o balancete em reais. Nenhum dos quadros que vimos tinha esse problema. Se o cliente confirmar zero, a resposta certa é gerar divergência mesmo de R$ 0,01, e deixar o técnico encerrar com justificativa.

**Resposta:**

### P-4 · Grupo econômico

**Pergunta:** quando um processo tem várias empresas em recuperação, o relatório é um por empresa, um consolidado do grupo, ou os dois?

**O que já sabemos:** o sistema anterior era **exclusivamente por empresa**. Não havia tabela de processo judicial nem qualquer noção de grupo econômico. Mais: a planilha de controle que a recuperanda preenche **suporta layout multi-empresa, e o sistema descartava essa informação na leitura**, agregando os subitens. Queremos saber se isso era o desejado ou uma limitação.

**Por que importa:** define se a competência pende de empresa ou de processo. Muda [[modelo-dados]] na raiz.

**RESPONDIDA PELO ESCOPO (04/08/2026).** A tela de cadastro de recuperanda (`Telas/19.png`) pede o **modelo de consolidação** já no cadastro: **Consolidação Processual** (vários CNPJ, cada empresa gerida individualmente) ou **Consolidação Substancial** (um único CNPJ, todas tratadas como uma entidade para relatório e acompanhamento). Há também hierarquia de matriz e filial. Ver [[telas-legado]]. Resta confirmar que os dois modelos entram no produto.

**Resposta:**

### P-5 · Obrigatoriedade de documentos

**Pergunta:** das 61 pastas, quais são obrigatórias todo mês? Isso varia por segmento da empresa ou por estágio do processo?

**O que já sabemos:** o sistema anterior tinha a tabela de obrigatoriedade pronta, com níveis obrigatório, condicional e opcional, e ela ficou **vazia**. Só duas pastas eram marcadas como exigidas no código: Balancete e DRE. Não havia nenhuma regra ligada a segmento ou a estágio processual.

**Por que importa:** sem isso, o check list de faltantes não tem critério. É a pergunta mais importante desta lista.

**RESPONDIDA EM PARTE PELOS DADOS (04/08/2026).** Deixou de ser pergunta aberta. As **75 planilhas de controle preenchidas** dos dois clientes dão a obrigatoriedade observada, documento a documento, em 75 meses de operação. Ver [[controle-entrega]].

- **18 documentos** foram entregues em 100% dos meses nos dois clientes. É o núcleo obrigatório.
- **6 documentos** nunca foram entregues uma única vez em 75 meses (obrigação de dar, de fazer, obrigações ilíquidas, cessão fiduciária, alienação fiduciária, arrendamento mercantil). São condicionais à existência da garantia.
- **8 documentos** variam de fato, e para um deles a condição está identificada: ICMS é GIA ou SPED conforme a **UF**, não conforme o segmento.
- **4 itens não são documentos**, são perguntas de questionário. Hoje geram pendência falsa.

**O que resta perguntar** deixa de ser "quais são obrigatórias" e passa a ser: (a) confirmar a tabela de [[controle-entrega]]; (b) dizer se a condição dos 8 variáveis é por UF, por segmento ou por estágio processual. É uma revisão de tabela, não um levantamento.

**Consequência:** a spec 004 (Check list) **destrava** com a tabela observada como padrão, desde que a obrigatoriedade seja dado editável e não constante de código - o que os dados já exigem por outro motivo, já que a lista de itens muda por cliente e por período.

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

**RESOLVIDA PELO CÓDIGO (04/08/2026).** Era assim: o sistema guardava só o ponteiro (`file_id`, `drive_id`, `path`, `etag`, `hash`) e buscava os bytes sob demanda, com a hierarquia `Projeto RMA / Cliente / Ano / Mês` imposta em código, lançando exceção se o caminho saísse da base. Os artefatos produzidos iam para storage próprio. Havia ainda uma rota paralela de upload manual. Ver [[sistema-legado]]. Resta só confirmar que segue valendo.

**Resposta:**

### P-9 · A DRE vem acumulada

**Pergunta:** os balancetes que recebemos trazem os saldos de resultado acumulados no ano, exigindo subtrair o mês anterior para obter o mês isolado?

**RESOLVIDA PELOS DADOS (04/08/2026).** Sim, e está **provado**, não inferido: no balancete de exemplo, a conta `311010 Vendas - Mercado Interno` vai de −7,16 mi em janeiro a −49,08 mi em julho, crescendo monotonicamente. O sistema anterior já fazia a desacumulação, pulando a virada de ano. Ver [[motor-calculo]] e [[regras-negocio#RN-50]]. Resta só o cliente confirmar que é assim em todos os clientes, não só neste.

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

**RESOLVIDA PELOS DADOS (04/08/2026).** Confirmado célula a célula: uma coluna por mês, com o cabeçalho em texto no padrão "Mês por extenso AAAA"; código de conta como texto, com hierarquia por comprimento (1, 2, 3 e 6 dígitos são sintéticas, 10 dígitos é analítica), pai obtido por truncamento de prefixo; convenção de sinal em partida dobrada (ativo positivo, passivo e receitas negativos), com o prefixo `(-)` na descrição marcando conta redutora; e a soma algébrica dos grupos de nível 1 fechando em zero. A validação aritmética bateu em 114 de 114 sintéticas, nos 7 meses. Ver [[motor-calculo]]. Absorve a P-9.

**Resposta:**

### P-27 · Índice de Solvência Geral

**Pergunta:** o parecer da Raízen registra a decisão de não usar o Termômetro de Kanitz e usar o Índice de Solvência Geral. Quando cada um se aplica?

**Por que importa:** o escopo mostra os dois em uso, com critério de escolha que hoje é do técnico.

**Resposta:**

## E · Da leitura exaustiva com agentes (04/08/2026)

### P-28 · O EBITDA soma "Compromissos RJ" como depreciação **(urgente)**

**Pergunta:** na planilha `01.BASE RELATÓRIO`, a linha rotulada "Depreciações e Amortizações" dentro das despesas usa a referência `40.G`, que no dicionário de referências significa **"Compromissos RJ"**. O cálculo do EBITDA estorna essa linha como se fosse depreciação. Isso é intencional?

**Por que importa:** numa recuperanda com compromissos do plano contabilizados, o EBITDA sai inflado. Ver [[motor-calculo]].

**Resposta:**

### P-29 · O mês de fechamento não aparece na capa

**Pergunta:** vocês sabiam que, na planilha padrão, o faturamento, o resultado líquido e os índices de liquidez **do mês de referência** aparecem como `#N/A` na capa e nos gráficos?

**Por que importa:** as faixas de busca terminam em junho ou julho enquanto os dados vão até agosto. Se o relatório é montado a partir dessa capa, o mês corrente está saindo em branco. Ver [[motor-calculo]].

**Resposta:**

### P-30 · Qual conceito de RMA é o certo

**Pergunta:** nas telas, o RMA aparece como duas coisas diferentes. Nas telas 7 a 17 é o relatório mensal de uma recuperanda numa competência, com seções e percentual de preenchimento. Na tela 20 é um protocolo numerado (`RMA-2024-000587`) com solicitante, setor e prioridade, no estilo de chamado. Qual é o certo, ou os dois coexistem?

**Por que importa:** são entidades diferentes, e nenhuma tela liga uma à outra. Ver [[telas-legado]].

**Resposta:**

### P-31 · Perfis sem interface

**Pergunta:** Administrador Judicial, Recuperanda e Magistrado estão declarados como perfis de acesso, mas nenhuma tela foi desenhada do ponto de vista deles. Esses perfis entram no produto?

**Resposta:**

### P-32 · O segundo ciclo de cobrança nunca foi usado

**Pergunta:** a planilha de controle de entrega tem as colunas "Dúvidas / Esclarecimentos" e "Status 2", para uma segunda rodada de cobrança. O segundo ciclo existe na prática?

**RESOLVIDA PELOS DADOS (04/08/2026).** As duas colunas estão vazias em **3.900 de 3.900 linhas**, nas 104 planilhas dos dois clientes, de 2022 a 2026. Não é amostra: é a série inteira que temos. O segundo ciclo **não existe na operação atual**. Ver [[controle-entrega]].

Vira **aviso**, não pergunta: o modelo nasce com uma rodada de esclarecimento, e a segunda entra quando alguém pedir. Continua no envio só para o cliente saber que reparamos.

**Resposta:**

### P-33 · Vocabulário de status da entrega

**Pergunta:** confirmam que os únicos status possíveis de um documento entregue são **Apresentado**, **Não Apresentado**, **Não aplicável** e **Parcial**?

**CORRIGIDA EM 04/08/2026.** A resposta anterior dizia que o vocabulário vinha "do uso real em 105 planilhas". **Não vinha.** Aquelas 110 ocorrências (`Apresentado` 78, `Não aplicável` 17, `Não Apresentado` 14, `Parcial` 1) estão todas na coluna `STATUS 1`, que foi preenchida em **3 planilhas apenas**, todas da GERATHERM, em janeiro e fevereiro de 2024. Foi uma tentativa abandonada, não a prática.

O que a operação usa de verdade, em 75 planilhas preenchidas e 2.926 linhas, é a coluna **`APRESENTADO PELA RECUPERANDA`, em texto livre**, com **41 grafias distintas** e uma convenção por cliente: a DIPLOMATA escreve `Apresentado pasta one drive` e `Não possui tal operação`; a GERATHERM escreve em caixa alta o que enviou (`RELATÓRIO EM EXCEL ENVIADO`, `NÃO EXISTE ESSA OBRIGAÇÃO`, `DISPENSA GIA`). Não há lista suspensa em nenhum dos 104 arquivos. Ver [[controle-entrega]].

A pergunta ao cliente continua válida e fica **mais forte**: os quatro estados cobrem o que a operação escreve à mão? Em particular, `DISPENSA GIA` e `NÃO EXISTE ESSA OBRIGAÇÃO` são o mesmo `Não aplicável`, ou são coisas diferentes?

Consequência prática: a migração do histórico não pode casar por igualdade de string.

**Resposta:**

### P-34 · Materiais que faltam no escopo

**Pergunta:** podem enviar dois arquivos que faltam? (a) `Gestão Técnico2.xlsx`, que é a fonte real dos indicadores de desempenho do Manual de Operações; (b) os **check lists**, que o próprio manual diz terem sido retirados dele em 04/04/2024 e transformados em arquivos individualizados.

**Por que importa:** o check list é o coração da operação e não está no material recebido.

**Resposta:**

### P-35 · Metodologia de amostragem

**Pergunta:** o RMA declara que a validação de comprovantes é feita "por amostragem, devido ao grande volume". Existe critério definido de tamanho de amostra, forma de seleção ou percentual mínimo?

**Por que importa:** é o método de asseguração declarado do relatório e não tem nenhum parâmetro documentado.

**Resposta:**

## Filtro aplicado em 04/08/2026

Critério, sugerido pelo Saulo: **se "sim" e "não" levam ao mesmo código, não é pergunta.** Passei os 30 itens do envio anterior por ele.

### Os 6 que caíram

| Item cortado | Por que a resposta não muda nada |
|---|---|
| Balanço patrimonial dentro da pasta 07 da GERATHERM | A classificação é por arquivo, não por pasta. Qualquer pasta pode conter mais de um tipo de documento, e o sistema tem que tratar isso de qualquer forma. |
| Qual é a numeração oficial das pastas | A GERATHERM migrou de `02` para `07` em 2023; a DIPLOMATA segue no `02`. O histórico não vai ser reescrito, então a classificação precisa ser tolerante independentemente da resposta. Vira aviso. |
| O formato de grupo (19 documentos x 7 empresas) ainda é usado | A DIPLOMATA já tem cinco empresas com balancete separado. O modelo precisa da dimensão empresa de qualquer jeito. |
| O grupo contábil 4 e 5 é padrão para todos os clientes | O mapeamento conta-para-referência é por cliente por construção, já que cada um tem seu plano de contas. Não existe resposta que dispense o mapeamento. |
| Os balancetes trazem resultado acumulado em todos os clientes | O arquivo do Agrosys **declara o próprio regime** no cabeçalho, e os outros formatos entregam o movimento do mês. O importador lê ou trata os dois casos, sem depender da resposta. |
| A capa saindo `#N/A` e as linhas 36 e 38 dividindo pelo lucro líquido | São defeitos na planilha deles. Nosso cálculo já está definido pela resposta da Gisele. Continuam no envio como **aviso**, não como pergunta. |

Restam **24 itens**: 20 perguntas, 2 pedidos de material e 2 avisos.

## Textos para envio

Uma linha por item, começando pelo arquivo e pelo lugar exato.

### Bloco 1 · Urgente - **EM ESPERA**

> Aguardando a planilha mais atual, que o Luiz informou existir em 04/08/2026. Os pontos abaixo podem já estar corrigidos nela.

```
Olá! Mapeamos em detalhe a planilha "01.BASE RELATÓRIO_xi teste.XLSM".
Uma pergunta e dois avisos.

PERGUNTA

1. Aba "P&L + EBITDA", linha 45: o rótulo é "Depreciações e
   Amortizações", mas a referência da linha é 40.G, que no dicionário
   (aba BdMeses) é "Compromissos RJ". O EBITDA soma essa linha de volta.
   Está correto?

AVISOS - não precisam de resposta, é só para vocês saberem

2. Aba "FOLHA DE ROSTO": o faturamento, o resultado líquido e os quatro
   índices de liquidez do mês de referência estão saindo como #N/A.

3. Aba "Dados para Graficos", linhas 36 e 38: estão dividindo pelo lucro
   líquido, e não pela receita líquida como diz o rótulo.

Abraço!
```

### Bloco 2 · Decisões que travam o desenvolvimento

```
Olá! Três definições que dependem de vocês, e dois arquivos que
faltam. Nas duas primeiras já fomos atrás nos RMAs que vocês nos
mandaram, então elas viraram confirmação de um número, não pergunta
aberta.

1. ALERTA DE VARIAÇÃO. O retorno de vocês diz "superior a 15% ou 20%".
   Olhando o "DIP - RMA - Março.2026 final.docx" e o "XPT S.A - RMA-
   BEx 08.2024 teste.docx", a prática bate com isso: variação de até
   4,30% vocês descartam ("sem grandes variações"), de 24% a 44% vocês
   apontam como principal variação, e 531% e 750% viraram pedido de
   esclarecimento em apenso.
   Vamos adotar 15% como padrão, configurável. Confirmam?
   E uma coisa que o material não resolve: como a variação é por conta
   do balancete analítico, uma conta que sai de R$ 10 para R$ 100 varia
   900%. Faz sentido só alertar acima de um valor mínimo em reais
   também? Se sim, qual?

2. CONCILIAÇÃO. Procuramos tolerância em todo o material e não existe
   nenhuma. No RMA de março o quadro "Saldos Bancários em Março/2026"
   tem uma linha DIFERENÇA e as sete contas fecham em zero, ao centavo.
   E quando não fecha, vocês não ignoram: em fornecedores e no passivo
   fiscal a diferença virou pedido de esclarecimento e foi encerrada
   com a justificativa da recuperanda dentro do relatório.
   Então vamos fazer assim: diferença zero concilia, qualquer diferença
   vira divergência, e o técnico encerra com justificativa registrada.
   Confirmam? Só um caso nos preocupa: se algum relatório vier em
   milhares e o balancete em reais, o arredondamento gera diferença de
   centavos. Isso acontece com vocês?

3. As planilhas de consolidação continuam existindo depois do novo
   sistema? Para quê?

4. Podem enviar o Gestão Técnico2.xlsx? É a fonte das tabelas do
   "Manual de Operações_Área Técnica_V2.xlsx", aba "TD consolidada".

5. O "Manual de Operações_Área Técnica_V2.xlsx" (aba CAPA, controle de
   alterações de 04/04/2024) diz que os check lists foram retirados dele
   e viraram arquivos individualizados. Podem enviar esses arquivos?

Abraço!
```

### Bloco 3 · Confirmações

```
Olá! Pontos que se respondem em uma linha cada. Quase todos vêm de
divergências entre arquivos que vocês nos enviaram.

PASTAS E DOCUMENTOS

1. Em "Código de Pastas Onedrive_Documentos (2) - identificação.xlsx" a
   pasta 21 (GFIP) tem conciliação com o balancete; nos comentários do
   "RMA_RMA-DIP-01-2026_jan_de_2026 indicação de pastas.docx" ela
   aparece sem. Qual vale?

2. Nos mesmos comentários, a pasta 15 aparece sem conciliação nos itens
   5, 5.1 e 5.2 e com conciliação nos itens 5.4 e 5.5. É assim mesmo?

3. Ainda nos comentários, as pastas 31, 34 e 35 dizem "pode ter
   conciliação". Como se decide caso a caso?

4. Em "01 - Controle de entrega de documentos 2025.xlsx", a coluna
   STATUS 1 tem 4 valores (Apresentado, Não Apresentado, Não aplicável,
   Parcial), mas na prática vocês preenchem a coluna "APRESENTADO PELA
   RECUPERANDA" em texto livre. Os 4 valores dão conta de tudo que
   aparece lá? "DISPENSA GIA" e "NÃO EXISTE ESSA OBRIGAÇÃO" são os dois
   "Não aplicável", ou são coisas diferentes?

5. Levantamos, nas 75 planilhas de controle preenchidas de GERATHERM e
   DIPLOMATA, quais documentos foram entregues em todos os meses e
   quais nunca foram. Vamos usar isso como a obrigatoriedade padrão do
   check list. Mandamos a tabela para vocês conferirem?
   Uma dúvida específica: os 8 documentos que variam (extrato de
   aplicações, rescisões, PJ contratadas, ACC, GIA/ICMS, contingência,
   parcelamentos, pagamentos a credores) dependem do quê? Da UF, do
   segmento, ou do estágio do processo?

NÚMEROS

6. Em "01.BASE RELATÓRIO_xi teste.XLSM", aba INDICE, linhas 51 e 52: o
   endividamento é calculado sobre o patrimônio líquido e também sobre o
   ativo total. Qual dos dois vai no relatório?

7. A Gisele confirmou CMV sobre receita líquida, mas em "DIP - RMA -
   Março.2026 final.docx" o item 12.1.3 usa receita bruta. Varia por
   cliente?

8. Em "01.BASE RELATÓRIO_xi teste.XLSM", aba INDICE, ROA e ROE
   multiplicam o resultado do mês por 12. É isso que sai no relatório
   mensal?

9. Em "DIP - RMA - Março.2026 final.docx", o item 10.1 usa as faixas
   0-30, 30-90, 90-180 e acima de 180 dias. Existe algum caso com corte
   em 60 dias?

10. O Ativo Não Circulante é o grupo contábil 12, com o grupo 13 (Ativo
    Permanente) ficando de fora dele e do Ativo Total?

11. Em "Parecer Técnico - Raizen 2023-2025.docx" vocês usaram o Índice
    de Solvência Geral. Ele entra no RMA também, ou é só de parecer
    avulso?

12. Em "DIP - RMA - Março.2026 final.docx", a validação dos comprovantes
    é feita "por amostragem". Existe um critério de quantos conferir?

SISTEMA E TELAS

13. Em Telas/20.png, o RMA é um protocolo numerado (RMA-2024-000587) com
    solicitante e prioridade. Nas Telas/7.png a 17.png, é o relatório
    mensal da recuperanda. São a mesma coisa?

14. Em Telas/6.png existem seis perfis de acesso. Magistrado,
    Recuperanda e Administrador Judicial não têm nenhuma tela desenhada.
    Eles usam o sistema?

15. Em Telas/3.png, o logotipo do administrador judicial "será exibido
    nos relatórios". O sistema atende mais de um administrador judicial?

16. Em Telas/11.png existem 7 tipos de documento. Eles substituem as 61
    pastas ou são um agrupamento para visualizar?

17. Nas pastas do OneDrive dos dois clientes existem "Entradas IA",
    "Processando IA", "Processados IA" e "Erros IA". Tem algum processo
    usando essas pastas hoje?

AVISOS, sem necessidade de resposta

18. A numeração das pastas mudou ao longo do tempo: na GERATHERM o
    balancete era a pasta 02 até 2022 e é a 07 desde 2023; na DIPLOMATA
    continua sendo a 02. Vamos tratar as duas formas.

19. As colunas "DUVIDAS / ESCLARECIMENTOS" e "STATUS 2" do controle de
    entrega estão vazias nas 104 planilhas que recebemos, de 2022 a
    2026. Vamos assumir uma rodada de esclarecimento só, e a segunda
    entra depois se vocês precisarem.

20. Um ponto de privacidade: os arquivos de controle de entrega da
    GERATHERM e da DIPLOMATA têm uma segunda aba, em branco, que ficou
    do template de outro cliente. Ela leva o nome "Grupo TTT" e o número
    de processo dele em todo arquivo dos outros dois, desde 2022. Não
    tem dado preenchido, mas o identificador viaja junto. No sistema
    novo isso não acontece.

Abraço!
```
