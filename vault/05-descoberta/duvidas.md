# Dúvidas - Projeto RMA

> Tudo o que não tem fonte é dúvida `D-x`. Esta lista é o **roteiro da reunião** com o Luiz e a Gisele. Ao responder, registre a resposta, a fonte (quem, quando) e leve o fato para [[briefing]] ou para `00-domain/`.

## Quebras no desenho do fluxo v8 (ver [[fluxo-v8]])

- **D-1** "Arrendamento mercantil" não tem saída e "Adiantamento, contrato e câmbio" não tem entrada. A sequência é uma depois da outra?
- **D-2** A seta de "Gerar fórmulas" está solta e "Tabelas com as fórmulas" não tem entrada. Ligam-se?
- **D-3** "Técnico recebe o relatório" (de faltantes ou de apontamentos) tem a seta solta, e "Falta documentos?" não tem entrada. Ligam-se?
- **D-4** "Teve diligência?": tanto o S quanto o N terminam em "Inseri no RMA" (o N passa por "Não haverá o tópico no RMA"). O mesmo acontece no ramo do produtor rural. O que o N insere no RMA?
- **D-5** Na revisão do RMA pela Coordenação, "Tem correções?" só tem a saída S (volta ao técnico). O N vai para o protocolo?
- **D-6** No Parecer, "Analisa relatório do parecer" não tem entrada, e "Recebe relatório do parecer" vai direto para "Efetua correção". A análise vem antes da correção?
- **D-7** Rótulos que parecem invertidos: (a) no RMA, técnico "Tem correções?" S vai para a Coordenação e N vai para o protocolo; (b) no Parecer, Coordenação "Tem correções?" N vai para "Retorna para técnico" e daí para o protocolo. Confirmar o sentido.
- **D-8** O ramo do produtor rural vai direto a "Gerar RMA" e pula "Gerar conclusão" e "Incluir informações do contador e da auditoria". É de propósito?
- **D-9** O desenho tem 7 setas em forma de pentágono, sem texto (perto de: cadastro do contador, parecer (2), imobilizado, fluxo de caixa realizado, análise da DRE, informações do contador e da auditoria). O que marcam? Novidades da v8?

## Produto e processo

- **D-10** Parecer e RMA: o Parecer é emitido só quando o balancete não vem? São dois documentos entregues e protocolados separadamente?
- **D-11** ✅ _Respondida (Saulo, 2026-10-08): substituída pela lista de 6 perfis (ver D-21 a D-36); o contador não acessa._ Papéis no sistema: técnico, coordenação, recuperanda. O contador (cadastrado com CRC) acessa a plataforma? Há mais perfis?
- **D-12** _(parcial, 2026-10-08: a recuperanda sobe os documentos todo fim de mês; falta o volume)_ Periodicidade: o RMA é mensal, com novo upload e nova análise a cada mês? Quantos processos e recuperandas ativos por mês?
- **D-13** Um processo pode ter várias recuperandas e vários CNPJs. A análise e o RMA são por CNPJ, por recuperanda ou consolidados?
- **D-14** ✅ _Respondida (Saulo, 2026-10-08): o sistema só gera o RMA; subir no portal do TJ (TJSP, TJGO etc.) e assinar com o certificado digital do AJ é manual, fora da plataforma._ Protocolo: é manual (o técnico protocola no tribunal e anexa) ou o sistema deve peticionar?
- **D-15** Modelos de RMA, gráficos e pareceres: há modelos atuais (Word, PDF) que servem de referência de conteúdo e layout?

## Integrações e dados (pesam no orçamento)

- **D-16** "Verifica nos TJs o nº do processo": quais tribunais, e por qual meio (API, serviço pago, consulta manual assistida)?
- **D-17** _(parcial, 2026-10-08: hospedagem na AWS, VM da BEx; o OneDrive segue em aberto)_ Arquivos acima de 1 GB vão para o OneDrive: é o OneDrive da BEx (Microsoft 365)? O sistema lê de lá ou só guarda?
- **D-18** Formatos dos documentos enviados (PDF, planilha, XML, imagem escaneada) e se o balancete tem layout padrão ou varia por contador.
- **D-19** O que se espera da "IA": ler e extrair dados dos documentos, apontar divergências, redigir texto do parecer e do RMA? O cálculo das fórmulas é determinístico (regra fixa) ou interpretado?

## Diligência (item opcional, fora do v8)

- **D-20** Agenda no cadastro do processo (por mês), virtual ou presencial, base de profissionais: quem cadastra, quem agenda, há notificação, e como o resultado entra no RMA?

## Perfis de acesso (camada 0, ver [[camadas/0-plataforma]])

- **D-21** ✅ _Respondida (Saulo, 2026-10-08): Administrador é perfil próprio; **1 pessoa = 1 perfil**, sem acúmulo._ O perfil de administrador (usuários, checklist padrão, modelos, parâmetros) é uma pessoa à parte ou alguém da coordenação acumula? Um usuário pode ter mais de um perfil?
- **D-22** ✅ _Respondida (Saulo, 2026-10-08): a coordenação cadastra processo, recuperanda e AJ e vincula os técnicos._ Quem cria o processo: o técnico (como no desenho) ou a coordenação, que cria e já atribui a um técnico?
- **D-23** ✅ _Respondida (Saulo, 2026-10-08): só os vinculados a ele; **um técnico por processo** (corrigido no mesmo dia); a coordenação troca o técnico quando precisar._ O técnico vê só os processos atribuídos a ele ou todos? Como fica a substituição em férias?
- **D-24** ✅ _Respondida (Saulo, 2026-10-08): **1 recuperanda = 1 login = 1 pessoa**. Num processo com várias recuperandas, cada uma tem o seu login._ Do lado da recuperanda entra uma pessoa ou várias? Num grupo com várias recuperandas no mesmo processo, um login vê todas?
- **D-25** ✅ _Respondida (Saulo, 2026-10-08): contador não tem login, a lista de perfis não o inclui._ O contador precisa de login (por exemplo, para enviar o balancete) ou é só um cadastro com CRC?
- **D-26** ✅ _Respondida (Saulo, 2026-10-08): não é usuário, a lista de perfis não a inclui._ A "auditoria" citada na etapa de conclusão (E10) é um ator externo que acessa o sistema ou só um documento recebido?

## Perfis novos (lista do cliente de 2026-10-08, ver [[camadas/0-plataforma]])

- **D-27** ✅ _Respondida (Saulo, 2026-10-08): Colaborador é o Técnico; o nome usado sempre é **Técnico**, compatível com os desenhos._ "Colaborador" é o mesmo papel que o desenho chama de "Técnico"? Há colaborador que não é técnico (por exemplo, administrativo, que só cadastra e pede documentos)?
- **D-28** ✅ _Respondida (Saulo, 2026-10-08): só leitura; painel com esteira e gráficos, acesso aos RMAs, aviso de RMA pronto; fora da aprovação._ O que o Administrador Judicial faz no sistema: só acompanha, ou aprova e assina o RMA e o parecer depois da coordenação? Ele entra no fluxo de revisão (E11)?
- **D-29** ✅ _Respondida (Saulo, 2026-10-08): só leitura; vê o RMA e os gráficos padrão depois que a BEx libera; é cadastrado pela coordenação (D-34)._ O que o Magistrado vê e faz: só lê os RMAs e pareceres protocolados dos processos da vara dele? Comenta ou pede algo? Como ganha acesso (convite da BEx, por vara, por processo)? Isso muda o protocolo (D-14): o RMA passa a ser entregue pelo sistema?
- **D-30** ✅ _Respondida (Saulo, 2026-10-08): só da BEx, sem multiempresa._ O sistema atende só a BEx como administradora judicial ou outros AJs também (cada um com sua equipe, processos e modelos)? Multiempresa pesa no orçamento.

## Pontos finos dos papéis (respostas de 2026-10-08, ver [[camadas/0-plataforma]])

- **D-31** ✅ _Respondida (Saulo, 2026-10-08): não se apegar agora; o "80%" foi só uma ideia. A divisão admin x coordenação fica para depois._ A coordenação tem "cerca de 80%" do administrador. Quais são os 20% que ficam só com o admin? Proposta: gerenciar usuários e perfis, modelos, parâmetros e treinar a IA.
- **D-32** ✅ _Respondida (Saulo, 2026-10-08): isso mesmo, vê os processos dele e não edita os cadastros._ "Técnico não altera nem visualiza nada do AJ, da recuperanda e dos processos": entendemos que ele **vê** os dados dos processos vinculados a ele (precisa deles para trabalhar), mas **não edita** os cadastros. É isso? Ele vê o nome e o contato da recuperanda?
- **D-33** ✅ _Respondida (Saulo, 2026-10-08): o AJ só recebe o aviso. O "protocolo" sai do sistema: a plataforma termina ao gerar o RMA; o envio ao portal do TJ e a assinatura digital do AJ são manuais e externos._ Quem protocola? O v8 diz técnico; o AJ recebe o aviso "precisa fazer protocolo", mas é só leitura. O aviso é informativo, ou o AJ protocola fora do sistema e alguém registra?
- **D-34** ✅ _Respondida (Saulo, 2026-10-08): a seleção de gráficos é padrão; quem cadastra o magistrado é a coordenação._ Magistrado: como ganha acesso (convite da BEx, por processo ou por vara)? A escolha dos gráficos que ele vê é por RMA ou um padrão? Ele recebe aviso quando um RMA é protocolado?
- **D-35** ✅ _Respondida (Saulo, 2026-10-08): só os ligados a ele._ O AJ vê todos os processos ou só os que a coordenação ligou a ele no cadastro?
- **D-36** ✅ _Respondida (Saulo, 2026-10-08): passos e prazos fixos, inicialmente._ Esteira: os passos e prazos são os mesmos para todo processo (a partir do v8) ou mudam por processo (produtor rural, parecer)? Quem define os prazos?

## Camada 0, itens que dependem do cliente (2026-10-08)

- **D-37** Prazos reais da esteira: até que dia do mês a recuperanda envia os documentos, e quantos dias tem cada etapa (conferência, análise, revisão do técnico, aprovação da coordenação)?
- **D-38** ✅ _Respondida (Saulo, 2026-10-08): **guardados para sempre, nada é apagado**._ Retenção dos dados (LGPD): por quanto tempo os documentos e RMAs ficam guardados depois que o processo encerra?
