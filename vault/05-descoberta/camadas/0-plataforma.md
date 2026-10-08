# Camada 0 - Plataforma e acesso

> Não aparece no desenho do v8, mas tudo depende dela. Voltar ao [[index]].

## Atores que o v8 cita

| Ator | Onde aparece | O que faz |
| --- | --- | --- |
| Técnico (BEx) | raia "Técnico - Cadastro e Check list" | cadastra, confere, recebe relatórios, analisa (o "protocolo" do v8 é feito fora do sistema) |
| Coordenação (BEx) | passo dentro das raias (E11, P) | revisa RMA e parecer, devolve ou aprova |
| Recuperanda (externa) | raia "Recuperanda" | recebe acesso, faz upload |
| Contador | só "cadastro do contador e CRC" | não age em nenhum passo |
| IA | raia "IA - Validando as informações" | é o sistema, não é usuário |

Nenhum ator cria usuários, mantém o checklist padrão nem os modelos: falta um **administrador**.

## Itens da camada

| # | Tema | Proposta nossa | Onde decide | Status |
| --- | --- | --- | --- | --- |
| 0.1 | Perfis | 6 perfis com papéis definidos em 2026-10-08 (ver abaixo) | cliente | **Fechado** (D-31 a D-36 respondidas em 2026-10-08) |
| 0.2 | Quem vê o quê | matriz em "0.2 Quem vê o quê" abaixo | cliente | **Fechado** 2026-10-08 |
| 0.3 | Login interno | e-mail, senha e **código por e-mail** (ver abaixo) | Saulo | **Fechado** 2026-10-08 |
| 0.4 | Cadastro e login externo | cadastro em cascata e convite por e-mail (ver abaixo) | Saulo | **Fechado** 2026-10-08 |
| 0.5 | E-mail | Brevo, mesma estrutura do sgcbex; tudo desviado para o Saulo até a produção | Saulo | **Fechado** 2026-10-08 |
| 0.6 | Notificações | sino na plataforma mais e-mail | Saulo | **Fechado** 2026-10-08 |
| 0.7 | Histórico | quem fez o quê e quando, mais versões do RMA | Saulo | **Fechado** 2026-10-08 |
| 0.8 | Segurança e LGPD | ver abaixo | Saulo | **Fechado** 2026-10-08 |
| 0.9 | Hospedagem | VM da BEx na AWS; infra e IA pagas pela BEx | cliente | **Fechado** 2026-10-08 |
| 0.10 | Ambientes | homologação local (dev) e produção na VM | Saulo | **Fechado** 2026-10-08 |
| 0.11 | Identidade visual | a mesma do sgcbex | Saulo | **Fechado** 2026-10-08 |
| 0.12 | Esteira do processo | uma esteira por RMA mensal (ver abaixo) | Saulo; prazos com o cliente | **Fechado**, faltam os prazos |
| 0.13 | Painéis | um por perfil (ver abaixo) | Saulo | **Fechado** 2026-10-08 |

Sem opcionais de login: o login com Microsoft 365 **saiu** e a verificação em duas etapas **entrou no valor fechado** (Saulo, 2026-10-08).

## 0.1 Perfis: lista do cliente (2026-10-08)

Fonte: Saulo, 2026-10-08, repassando a lista do cliente. **São todos os tipos de usuário do sistema:**

1. Administrador
2. Coordenação
3. Técnico (o cliente chamou de "Colaborador"; o Saulo confirmou que é o mesmo papel e que o nome usado em tudo é **Técnico**, igual aos desenhos)
4. Administrador Judicial
5. Recuperanda
6. Magistrado

O que a lista já responde:

- **Contador não tem login** (fecha D-25 e P5): fica só como cadastro com CRC.
- **Auditoria não é usuário** (fecha D-26 e P6): é só documento.
- **Administrador é perfil próprio**, e cada pessoa tem um só perfil (D-21).

O que a lista traz de novo e precisa de confirmação:

| Perfil | Leitura provável | Dúvida |
| --- | --- | --- |
| Administrador Judicial | o AJ responsável pelo processo, acima da coordenação (assina ou aprova o RMA?) | D-28 |
| Magistrado | o juiz da vara, externo, só leitura do RMA final | D-29 |
| (todos) | se o AJ é usuário, a plataforma pode atender **mais de um AJ** (multiempresa), o que muda o desenho e o orçamento | D-30 |

## 0.1 Papéis de cada perfil (2026-10-08)

Fonte: Saulo, 2026-10-08. Fecha D-22, D-23, D-28 e responde a maior parte de D-21 e D-29.

**Administrador.** Acesso a tudo.

**Coordenação.** Quase tudo o que o administrador tem. O "80%" foi só uma referência; a divisão fina fica para depois (D-31).
- Painel para acompanhar os técnicos: processos de cada um, informações de cada técnico, **% de evolução de cada RMA**.
- Recebe notificação quando o técnico altera o RMA, **vê a alteração e aprova**.
- **Cadastra** o processo, a recuperanda e o administrador judicial. Isso muda o v8, onde quem cadastra é o técnico (ver [[1-cadastro]]).
- **Vincula** o processo aos técnicos, e pode tirar um técnico e pôr outro.

**Técnico.**
- Acessa **só os processos vinculados a ele**; não vê os de outro técnico.
- **Um técnico por processo** (correção do Saulo, 2026-10-08). A coordenação pode trocar o técnico do processo quando precisar.
- Edita os pareceres (e o RMA), sobe documentação (inclusive a que está faltando).
- **Vê** os dados dos processos dele, mas **não altera** os cadastros de processo, recuperanda e AJ (D-32).
- **Treinar a IA** (ajustar regras e prompts): **em standby, para o final do projeto**. Fora do valor fechado até lá.

**Administrador Judicial.** **Só leitura**, não modifica nada.
- Painel com a esteira, gráficos e o que está sendo feito em cada processo.
- Acesso aos RMAs feitos.
- Recebe aviso de **RMA pronto**, para levá-lo ao tribunal.
- Vê **só os processos ligados a ele** no cadastro (D-35).
- Fica **fora do fluxo de aprovação**: a revisão continua terminando na coordenação, como no v8.

**Magistrado.**
- Acessa o RMA e os gráficos (DRE e do RMA) **só depois que a BEx clica "liberar para o magistrado"** (Saulo, 2026-10-08). Motivo: a plataforma não sabe quando o RMA chegou ao tribunal, então o juiz não lê algo que oficialmente ainda não foi entregue. Proposta nossa: quem libera é a coordenação.
- Os gráficos que ele vê seguem uma **seleção padrão**, não escolhida a cada RMA (D-34).
- **Cadastrado pela coordenação**, como o AJ. Proposta nossa: ligado aos processos, e vê só os dele.

**Recuperanda.**
- Todo **fim de mês** sobe os documentos: balancete, relatórios e demais documentos. Responde em parte D-12: o ciclo é mensal.

## Fim do fluxo: sem protocolo no sistema (Saulo, 2026-10-08)

**Esqueça o nome "protocolo".** A plataforma termina ao **gerar o RMA** final, já aprovado pela coordenação. Depois disso, tudo é **manual e fora da plataforma**: alguém sobe o RMA no portal do tribunal (TJSP, TJGO etc.) e o AJ assina com o **certificado digital** dele. A plataforma não faz mais nada. Os passos "protocolo" e "arquivamento" do v8 (E11 e P) saem do escopo.

## 0.2 Quem vê o quê

Montada a partir das respostas acima. ✅ = pode; 👁 = só vê; "seus" = só processos vinculados a ele.

| Ação | Admin | Coord. | Técnico | AJ | Magistrado | Recup. |
| --- | :-: | :-: | :-: | :-: | :-: | :-: |
| Cadastrar usuários | ✅ coordenadores | ✅ técnicos, recuperandas, AJ, magistrados | | | | |
| Modelos, parâmetros, checklist padrão | ✅ | depois (D-31) | | | | |
| Treinar a IA (regras, prompts) | ✅ | | standby | | | |
| Cadastrar processo, recuperanda, AJ, magistrado | ✅ | ✅ | 👁 seus | | | |
| Vincular e trocar o técnico (um por processo) | ✅ | ✅ | | | | |
| Painel de acompanhamento dos técnicos | ✅ | ✅ | | | | |
| Esteira e painel do processo | ✅ | ✅ | ✅ seus | 👁 só os ligados a ele | | |
| Subir documentos | ✅ | ✅ | ✅ seus | | | ✅ só os seus |
| Ver relatórios, apontamentos, análises | ✅ | ✅ | ✅ seus | 👁 | | |
| Editar RMA e parecer | ✅ | ✅ | ✅ seus | | | |
| Aprovar ou devolver RMA e parecer | ✅ | ✅ | | | | |
| Ver RMA final | ✅ | ✅ | ✅ seus | 👁 | 👁 só o liberado, dos seus | |
| Liberar o RMA para o magistrado | ✅ | ✅ | | | | |
| Ver gráficos (o magistrado vê a seleção padrão) | ✅ | ✅ | ✅ seus | 👁 | 👁 | |
| Notificações | | alteração no RMA, pedido de aprovação | pendências do processo | RMA pronto | RMA liberado (proposta) | pedido de documentos |

## 0.3 a 0.13 decididos (Saulo, 2026-10-08)

**0.3 Login interno.** E-mail e senha, "esqueci a senha" por e-mail, bloqueio temporário após 5 tentativas erradas, sessão expira após 8 h sem uso. **Verificação em duas etapas por código enviado por e-mail, obrigatória para todos os perfis, internos e externos.** Login com Microsoft 365: fora.

**0.4 Cadastro e login externo.** **Nada se cadastra por fora**, o cadastro é em cascata:
- o **admin** cadastra os **coordenadores**;
- a **coordenação** cadastra os **técnicos**, as **recuperandas** (um login por recuperanda), os **AJs** e os **magistrados**.

Cada pessoa cadastrada recebe convite por e-mail com link para criar a senha (vale 7 dias, pode ser reenviado). Um login por pessoa e **um perfil por pessoa** (D-21). **Cada recuperanda tem um único login** (D-24): num processo com várias recuperandas, cada uma entra com o seu. O sistema é **só da BEx**, sem multiempresa (D-30).

**0.5 E-mail.** Brevo, reaproveitando a estrutura do `Projects/sgcbex` (provedor, fila e webhook de eventos). **Até a produção, todo e-mail é desviado para `saulodesenvolvedor@gmail.com`**, com o destinatário real gravado, como o modo seguro do sgcbex (só que com um único destino). O desvio é tirado na liberação para produção. Textos fixos na v1.

**0.6 Notificações.** Sino na plataforma mais e-mail, para os eventos da matriz do 0.2. Sem preferências por usuário na v1.

**0.7 Histórico.** Registro por processo de quem fez o quê e quando. **Versões do RMA**: a coordenação vê o que mudou (antes e depois) entre uma versão e outra para aprovar (entra na camada 6).

**0.8 Segurança e LGPD.** HTTPS; senha com hash; arquivos fora de pasta pública, servidos só após checar login e perfil; permissão checada no servidor; backup diário com 30 dias. **Retenção: para sempre, nada é apagado** (D-38). Consequência: nenhuma exclusão definitiva no sistema (o que "sai" é desativado ou arquivado) e o armazenamento de arquivos só cresce, o que pesa no custo da AWS da BEx.

**0.9 Hospedagem.** **AWS, em VM da BEx.** Infraestrutura e consumo de IA são pagos pela BEx, fora do valor de desenvolvimento.

**0.10 Ambientes.** **Homologação = ambiente local de dev** (as calls de teste rodam nele). **Produção = a VM**, onde a BEx passa a usar. **No go-live, a base de produção é zerada** e começa do zero.

**0.11 Identidade visual.** **A mesma do sgcbex** (cores do Manual da Logomarca BEx: navy `#0B2A63`, teal `#00728C`; fonte em `Projects/sgcbex/vault/00-domain/ui-referencia.md`). O sgcbex usa Ant Design; aqui a stack é outra (Next.js), então importamos os tokens via `/identidade`, não os componentes.

**0.12 e 0.13** como descritos abaixo.

## 0.13 Painéis

- **Coordenação**: técnicos × processos, % de cada RMA, atrasos, aprovações pendentes.
- **Técnico**: "minha fila", com pendências e prazos dos processos dele.
- **AJ**: processos ligados a ele, com esteira, gráficos e RMAs.
- **Recuperanda**: o que falta enviar no mês e até quando.
- **Magistrado**: RMAs liberados, com os gráficos.
- **Admin**: tudo.

## 0.12 Esteira do processo

Pedido do cliente (Saulo, 2026-10-08): uma timeline do passo a passo de cada processo, **bem detalhista**. Exemplo dado: "passo 1 fazer tal coisa, passo 2 esperar tal prazo, passo 3 encaminhar para tal pessoa e esperar resposta", com **%**, **cores** e **avisos**.

Decidido: **uma esteira por RMA mensal** (o processo é contínuo; a esteira recomeça a cada mês). Passos tirados do v8: (1) pedido de documentos; (2) envio pela recuperanda; (3) conferência e faltantes; (4) análises (balancete, conciliações, DRE, documental, passivo); (5) cálculos e índices; (6) geração do RMA; (7) revisão do técnico; (8) aprovação da coordenação; (9) RMA final; (10) liberado para o magistrado. Cada passo tem responsável, prazo, cor (cinza não iniciado, azul em andamento, verde concluído, amarelo prazo perto, vermelho atrasado) e aviso. O % do RMA sai dos passos concluídos. **Falta o cliente dar os prazos reais** (D-37). **Passos e prazos fixos, iguais para todo processo, inicialmente** (D-36); torná-los configuráveis fica para depois. A esteira aparece para coordenação, técnico e AJ.

## 0.1 Perfis (proposta anterior, de 2026-10-07)

> Substituída pela seção "Papéis de cada perfil" acima. Fica como histórico.


O RMA é o relatório que o administrador judicial entrega ao juízo; os usuários internos são a equipe da BEx.

- **Admin** (interno): usuários, checklist padrão, modelos de e-mail e de RMA, parâmetros (ex.: tolerâncias).
- **Coordenação** (interno): tudo o que o técnico faz, mais ver todos os processos, atribuir processo a técnico, aprovar ou devolver RMA e parecer.
- **Técnico** (interno): cadastra processo, monta checklist, pede documentos, recebe relatórios e apontamentos, analisa e corrige o RMA, protocola.
- **Recuperanda** (externo): upload, vê pendências e status.
- **Contador** (externo): na v1, só cadastro (nome e CRC), sem login.

| Ação | Admin | Coord. | Técnico | Recup. |
| --- | :-: | :-: | :-: | :-: |
| Gerenciar usuários | ✅ | | | |
| Checklist padrão, modelos, parâmetros | ✅ | | | |
| Cadastrar processo e recuperandas | | ✅ | ✅ | |
| Atribuir processo a técnico | | ✅ | | |
| Pedir documentos, ver relatórios e apontamentos | | ✅ | ✅ (seus) | |
| Upload de documentos | | ✅ | ✅ | ✅ (seu) |
| Analisar e corrigir RMA ou parecer | | ✅ | ✅ (seus) | |
| Aprovar ou devolver RMA ou parecer | | ✅ | | |
| Protocolar | | ✅ | ✅ (seus) | |

Perguntas abertas (levadas ao cliente como D-21 a D-26 em [[duvidas]]):

| # | Pergunta | Proposta nossa |
| --- | --- | --- |
| P1 | Admin é pessoa à parte ou a coordenação acumula? | um usuário pode ter mais de um perfil |
| P2 | Quem cria o processo: técnico ou coordenação? | os dois; quem cria sem atribuir fica responsável |
| P3 | Técnico vê só os seus ou todos? E nas férias? | só os seus; a coordenação reatribui |
| P4 | Recuperanda: uma ou várias pessoas? Um login vê várias recuperandas do mesmo processo? | várias pessoas; login ligado a uma ou mais recuperandas |
| P5 | Contador precisa de login (ele costuma mandar o balancete)? | v1 sem login; se precisar, perfil externo só de upload |
| P6 | "Auditoria" (E10) é ator externo ou só documento? | só documento |
