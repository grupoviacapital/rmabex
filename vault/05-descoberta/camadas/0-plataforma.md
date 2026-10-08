# Camada 0 - Plataforma e acesso

> Não aparece no desenho do v8, mas tudo depende dela. Voltar ao [[index]].

## Atores que o v8 cita

| Ator | Onde aparece | O que faz |
| --- | --- | --- |
| Técnico (BEx) | raia "Técnico - Cadastro e Check list" | cadastra, confere, recebe relatórios, analisa, protocola |
| Coordenação (BEx) | passo dentro das raias (E11, P) | revisa RMA e parecer, devolve ou aprova |
| Recuperanda (externa) | raia "Recuperanda" | recebe acesso, faz upload |
| Contador | só "cadastro do contador e CRC" | não age em nenhum passo |
| IA | raia "IA - Validando as informações" | é o sistema, não é usuário |

Nenhum ator cria usuários, mantém o checklist padrão nem os modelos: falta um **administrador**.

## Itens da camada

| # | Tema | Proposta nossa | Onde decide | Status |
| --- | --- | --- | --- | --- |
| 0.1 | Perfis | 6 perfis com papéis definidos em 2026-10-08 (ver abaixo) | cliente | **Fechado** (D-31 a D-36 respondidas em 2026-10-08) |
| 0.2 | Quem vê o quê | matriz em "0.2 Quem vê o quê" abaixo | cliente | **Respondido** em 2026-10-08; matriz a validar |
| 0.3 | Login interno | e-mail e senha | nós | A discutir |
| 0.4 | Login da recuperanda | convite por e-mail com link para criar senha ("Comunica a recuperanda"); um login por pessoa | nós | A discutir |
| 0.5 | E-mail | envio próprio com modelos editáveis (convite, pedido de documentos, aviso ao técnico, aviso à coordenação, protocolo) | nós; remetente com o cliente | A discutir |
| 0.6 | "Comunica técnico" | painel de pendências ("minha fila") mais e-mail | nós | A discutir |
| 0.7 | Histórico | quem fez o quê e quando, por processo | nós | A discutir |
| 0.8 | LGPD e segurança | arquivos criptografados, acesso só com login, backup diário | nós; retenção com o cliente | A discutir |
| 0.9 | Hospedagem | a VM é da BEx ou nossa? Quem paga infra e IA? Pesa no orçamento | cliente | A discutir |
| 0.10 | Ambientes | homologação (call de teste) e produção (VM) | nós | A discutir |
| 0.11 | Identidade visual | pedir o manual de marca da BEx; sem ele, `/identidade` gera opções | cliente | A discutir |
| 0.12 | Esteira do processo | timeline detalhada por processo (ver abaixo) | nós, com o cliente | Novo (2026-10-08) |
| 0.13 | Painéis | um por perfil: coordenação, técnico, AJ | nós, com o cliente | Novo (2026-10-08) |

Opcionais fora do valor fechado: **SSO Microsoft 365** (a BEx parece usar M365, ver D-17) e **verificação em duas etapas**.

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
- **Administrador é perfil próprio** (responde metade de D-21; falta saber se uma pessoa pode acumular perfis).

O que a lista traz de novo e precisa de confirmação:

| Perfil | Leitura provável | Dúvida |
| --- | --- | --- |
| Administrador Judicial | o AJ responsável pelo processo, acima da coordenação (assina ou aprova o RMA?) | D-28 |
| Magistrado | o juiz da vara, externo, só leitura do que foi protocolado | D-29 |
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
- Recebe avisos: RMA pronto, precisa fazer protocolo. O aviso é **só informativo**: o protocolo físico é feito **fora do sistema** (D-33).
- Vê **só os processos ligados a ele** no cadastro (D-35).
- Fica **fora do fluxo de aprovação**: a revisão continua terminando na coordenação, como no v8.

**Magistrado.**
- Acessa o **RMA protocolado** e os gráficos (DRE e do RMA).
- Os gráficos que ele vê seguem uma **seleção padrão**, não escolhida a cada RMA (D-34).
- **Cadastrado pela coordenação**, como o AJ. Proposta nossa: ligado aos processos, e vê só os dele.

**Recuperanda.**
- Todo **fim de mês** sobe os documentos: balancete, relatórios e demais documentos. Responde em parte D-12: o ciclo é mensal.

## 0.2 Quem vê o quê (matriz a validar)

Montada a partir das respostas acima. ✅ = pode; 👁 = só vê; "seus" = só processos vinculados a ele.

| Ação | Admin | Coord. | Técnico | AJ | Magistrado | Recup. |
| --- | :-: | :-: | :-: | :-: | :-: | :-: |
| Gerenciar usuários e perfis | ✅ | depois (D-31) | | | | |
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
| Registrar que foi protocolado (o protocolo é feito fora) | ✅ | ✅ | ✅ seus | | | |
| Ver RMA pronto e protocolado | ✅ | ✅ | ✅ seus | 👁 | 👁 só protocolado, dos seus | |
| Ver gráficos escolhidos pela BEx | ✅ | ✅ | ✅ seus | 👁 | 👁 | |
| Notificações | | alteração no RMA, pedido de aprovação | pendências do processo | RMA pronto, precisa protocolar (informativo) | RMA protocolado (proposta) | pedido de documentos |

## 0.12 Esteira do processo

Pedido do cliente (Saulo, 2026-10-08): uma timeline do passo a passo de cada processo, **bem detalhista**. Exemplo dado: "passo 1 fazer tal coisa, passo 2 esperar tal prazo, passo 3 encaminhar para tal pessoa e esperar resposta", com **%**, **cores** e **avisos**.

Proposta nossa: os passos saem das etapas do v8 (E1 a E11 e P), cada um com responsável, prazo, status (cor) e aviso de atraso; o % do RMA, que a coordenação acompanha, vem da mesma esteira. **Passos e prazos fixos, iguais para todo processo, inicialmente** (D-36); torná-los configuráveis fica para depois. A esteira aparece para coordenação, técnico e AJ.

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
