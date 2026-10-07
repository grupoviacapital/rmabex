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
| 0.1 | Perfis | ver abaixo | cliente | **Aguarda cliente** (D-21 a D-26) |
| 0.2 | Quem vê o quê | Coordenação vê tudo; técnico vê os processos atribuídos (campo "técnico responsável"); recuperanda vê só o seu (upload, pendências, status), sem análises nem RMA | cliente | A discutir |
| 0.3 | Login interno | e-mail e senha | nós | A discutir |
| 0.4 | Login da recuperanda | convite por e-mail com link para criar senha ("Comunica a recuperanda"); um login por pessoa | nós | A discutir |
| 0.5 | E-mail | envio próprio com modelos editáveis (convite, pedido de documentos, aviso ao técnico, aviso à coordenação, protocolo) | nós; remetente com o cliente | A discutir |
| 0.6 | "Comunica técnico" | painel de pendências ("minha fila") mais e-mail | nós | A discutir |
| 0.7 | Histórico | quem fez o quê e quando, por processo | nós | A discutir |
| 0.8 | LGPD e segurança | arquivos criptografados, acesso só com login, backup diário | nós; retenção com o cliente | A discutir |
| 0.9 | Hospedagem | a VM é da BEx ou nossa? Quem paga infra e IA? Pesa no orçamento | cliente | A discutir |
| 0.10 | Ambientes | homologação (call de teste) e produção (VM) | nós | A discutir |
| 0.11 | Identidade visual | pedir o manual de marca da BEx; sem ele, `/identidade` gera opções | cliente | A discutir |

Opcionais fora do valor fechado: **SSO Microsoft 365** (a BEx parece usar M365, ver D-17) e **verificação em duas etapas**.

## 0.1 Perfis (proposta)

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
