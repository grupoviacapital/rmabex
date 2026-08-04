# Perguntas ao Cliente - rodada 1

> Consolidado do que precisa de confirmação externa antes de qualquer spec. Levantado a partir do material em [[fontes-escopo]] e das notas de domínio.
>
> Status: **a enviar**. Registre a resposta abaixo de cada item conforme forem chegando, e atualize [[pendencias-externas]] e [[regras-negocio]] em seguida.

Doze perguntas. As sete primeiras travam specs: sem elas, a regra correspondente fica marcada "a confirmar" e nenhuma implementação pode se apoiar nela. As cinco últimas são confirmações factuais sobre o material recebido.

## Bloqueantes

### P-1 · Indicadores da seção 12 do RMA

**Pergunta:** como são calculados os índices de liquidez, a relação receita x custo (CMV), a relação receita x resultado e o EBITDA apresentados na seção 12 do RMA?

**Por que importa:** nenhum documento do escopo traz as fórmulas. Trava [[regras-negocio#RN-41]] e toda a geração da seção 12.

**Resposta:**

### P-2 · Limiar do alerta de variação

**Pergunta:** a partir de que variação de saldo entre um mês e o anterior o sistema deve alertar o analista? Esse limite é o mesmo para todas as contas e todos os clientes?

**Por que importa:** o material recebido diz "geralmente superior a 15% ou 20%". Trava [[regras-negocio#RN-34]].

**Resposta:**

### P-3 · Tolerância de conciliação

**Pergunta:** qual diferença entre o valor de um documento e o saldo da conta ainda é aceitável, a ponto de a conciliação ser considerada correta?

**Por que importa:** nenhum documento define. Sem tolerância, arredondamento de centavos gera divergência falsa em toda competência. Trava [[regras-negocio#RN-33]].

**Resposta:**

### P-4 · Consolidação de grupo econômico

**Pergunta:** quando um processo tem várias recuperandas, o RMA é um por empresa, um consolidado do grupo, ou os dois? Se há consolidação, como os números das empresas se somam?

**Por que importa:** define se `Competencia` pende de recuperanda ou de processo. Muda o modelo de dados na raiz. Ver [[modelo-dados]].

**Resposta:**

### P-5 · Onde os arquivos vão viver

**Pergunta:** o OneDrive continua sendo o lugar onde a recuperanda deposita os documentos, com o sistema apenas lendo de lá, ou o sistema passa a ser o repositório e a recuperanda envia por ele?

**Por que importa:** determina se o documento é referência a um caminho externo ou arquivo armazenado, e se existe portal de envio para a recuperanda.

**Resposta:**

### P-6 · Planilhão técnico

**Pergunta:** o planilhão técnico e a planilha base das principais contas continuam existindo depois do novo sistema, ou são substituídos por ele? Se continuam, para quê?

**Por que importa:** decide se o sistema precisa gerar Excel no formato atual ou só apresentar os dados. Candidato a ADR.

**Resposta:**

### P-7 · Pastas de IA já existentes no OneDrive

**Pergunta:** as pastas `Entradas IA`, `Processando IA`, `Processados IA`, `Erros IA`, `Auditoria IA` e `Relatórios IA` que aparecem nos clientes são de um processo em uso hoje? Algo depende delas?

**Por que importa:** se há automação viva usando esse contrato, o sistema novo precisa conviver com ele em vez de substituí-lo. Candidato a ADR.

**Resposta:**

## Confirmações factuais

### P-8 · Numeração divergente das pastas

**Pergunta:** a numeração das pastas de documentos é a mesma para todos os clientes? Nos dados recebidos, "Resumo da folha de pagamento" é a pasta 15 num cliente e a pasta 09 em outro, e a numeração também muda de ano para ano dentro do mesmo cliente. Qual é a referência correta, e o que deve acontecer quando a pasta de um cliente não bate com ela?

**Por que importa:** é o achado que mais afeta o desenho. Confirma ou derruba [[regras-negocio#RN-5]] e a existência de `AliasCategoria` em [[modelo-dados]].

**Resposta:**

### P-9 · Pastas obrigatórias

**Pergunta:** das 61 pastas, quais são obrigatórias todo mês? Essa lista muda conforme o segmento da empresa ou o estágio do processo?

**Por que importa:** o check list de documentos faltantes depende disso. Hoje não há critério documentado de obrigatoriedade.

**Resposta:**

### P-10 · Seção 13 do RMA

**Pergunta:** o RMA de março de 2026 usado como referência vai da seção 12 direto para a 14. A seção 13 foi removida, ficou vazia naquele mês, ou a numeração é mesmo assim?

**Por que importa:** define se a numeração das seções é fixa ou variável por relatório. Afeta [[regras-negocio#RN-38]].

**Resposta:**

### P-11 · Telas do sistema atual

**Pergunta:** o conjunto de telas enviado tem 19 imagens, numeradas de 1 a 20 sem a 4. Falta alguma tela, ou o conjunto está completo? Elas representam o sistema como ele é hoje ou uma proposta de como deveria ser?

**Por que importa:** determina se as telas são referência de comportamento existente ou desejo de interface.

**Resposta:**

### P-12 · Outros produtos da área técnica

**Pergunta:** o Manual de Operações descreve fluxos de DAL, Constatação Prévia, Prospecção e Prestação de Contas, além do RMA. Esses fluxos fazem parte do que o sistema deve atender, agora ou no futuro?

**Por que importa:** define se o modelo de dados precisa nascer preparado para mais de um tipo de entrega, ou se pode ser específico do RMA.

**Resposta:**

## Texto para envio

```
Assunto: RMA BEx - confirmações necessárias antes de iniciarmos

Olá,

Concluímos a leitura de todo o material de escopo que vocês nos enviaram
e mapeamos o processo, as 61 pastas de documentos, as conciliações com o
balancete e a estrutura do relatório.

Antes de começarmos a construir, precisamos confirmar doze pontos com
vocês. Os sete primeiros nos impedem de avançar; os outros cinco são
dúvidas sobre o próprio material.

SOBRE OS CÁLCULOS

1. Como são calculados os índices de liquidez, a relação receita x custo
   (CMV), a relação receita x resultado e o EBITDA que aparecem na seção
   12 do RMA?

2. A partir de que variação de saldo de um mês para o outro o sistema
   deve alertar o analista? Esse limite é o mesmo para todas as contas e
   para todos os clientes?

3. Qual diferença entre o valor de um documento e o saldo da conta ainda
   é aceitável para considerarmos a conferência correta?

SOBRE A ORGANIZAÇÃO DO TRABALHO

4. Quando um processo tem várias empresas em recuperação, o relatório é
   um por empresa, um consolidado do grupo, ou os dois? Havendo
   consolidação, como os números se somam?

5. O OneDrive continua sendo o lugar onde a empresa deposita os
   documentos, com o sistema apenas lendo de lá, ou o sistema passa a
   receber os arquivos diretamente?

6. As planilhas de consolidação usadas hoje continuam existindo depois do
   novo sistema? Se sim, com que finalidade?

7. As pastas com nome de IA que encontramos no material (Entradas IA,
   Processando IA, Processados IA, Erros IA, Auditoria IA e Relatórios
   IA) fazem parte de algum processo em funcionamento hoje? Alguma coisa
   depende delas?

SOBRE O MATERIAL RECEBIDO

8. A numeração das pastas de documentos é a mesma para todos os clientes?
   No material que recebemos, "Resumo da folha de pagamento" é a pasta 15
   em um cliente e a pasta 09 em outro, e a numeração também muda de um
   ano para o outro dentro do mesmo cliente. Qual é a referência correta,
   e o que deve acontecer quando as pastas de um cliente não seguem ela?

9. Das 61 pastas, quais são obrigatórias todo mês? Essa lista muda
   conforme o segmento da empresa ou o estágio do processo?

10. No relatório de março de 2026 que usamos como referência, a numeração
    vai da seção 12 direto para a 14. A seção 13 foi removida, ficou
    vazia naquele mês, ou a numeração é assim mesmo?

11. O conjunto de telas que recebemos tem 19 imagens, numeradas de 1 a 20
    sem a de número 4. Falta alguma, ou está completo? Elas mostram o
    sistema como ele funciona hoje ou como vocês gostariam que fosse?

12. O Manual de Operações descreve também os fluxos de DAL, Constatação
    Prévia, Prospecção e Prestação de Contas. Esses fluxos fazem parte do
    que o sistema deve atender, agora ou mais adiante?

Ficamos no aguardo. Qualquer um dos pontos que precisar de conversa ao
vivo, podemos marcar.

Abraço,
```
