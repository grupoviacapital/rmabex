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
- **D-11** Papéis no sistema: técnico, coordenação, recuperanda. O contador (cadastrado com CRC) acessa a plataforma? Há mais perfis?
- **D-12** Periodicidade: o RMA é mensal, com novo upload e nova análise a cada mês? Quantos processos e recuperandas ativos por mês?
- **D-13** Um processo pode ter várias recuperandas e vários CNPJs. A análise e o RMA são por CNPJ, por recuperanda ou consolidados?
- **D-14** Protocolo: é manual (o técnico protocola no tribunal e anexa) ou o sistema deve peticionar?
- **D-15** Modelos de RMA, gráficos e pareceres: há modelos atuais (Word, PDF) que servem de referência de conteúdo e layout?

## Integrações e dados (pesam no orçamento)

- **D-16** "Verifica nos TJs o nº do processo": quais tribunais, e por qual meio (API, serviço pago, consulta manual assistida)?
- **D-17** Arquivos acima de 1 GB vão para o OneDrive: é o OneDrive da BEx (Microsoft 365)? O sistema lê de lá ou só guarda?
- **D-18** Formatos dos documentos enviados (PDF, planilha, XML, imagem escaneada) e se o balancete tem layout padrão ou varia por contador.
- **D-19** O que se espera da "IA": ler e extrair dados dos documentos, apontar divergências, redigir texto do parecer e do RMA? O cálculo das fórmulas é determinístico (regra fixa) ou interpretado?

## Diligência (item opcional, fora do v8)

- **D-20** Agenda no cadastro do processo (por mês), virtual ou presencial, base de profissionais: quem cadastra, quem agenda, há notificação, e como o resultado entra no RMA?

## Perfis de acesso (camada 0, ver [[camadas/0-plataforma]])

- **D-21** _(parcial, 2026-10-08: Administrador é perfil próprio; falta o acúmulo)_ O perfil de administrador (usuários, checklist padrão, modelos, parâmetros) é uma pessoa à parte ou alguém da coordenação acumula? Um usuário pode ter mais de um perfil?
- **D-22** Quem cria o processo: o técnico (como no desenho) ou a coordenação, que cria e já atribui a um técnico?
- **D-23** O técnico vê só os processos atribuídos a ele ou todos? Como fica a substituição em férias?
- **D-24** Do lado da recuperanda entra uma pessoa ou várias? Num grupo com várias recuperandas no mesmo processo, um login vê todas?
- **D-25** ✅ _Respondida (Saulo, 2026-10-08): contador não tem login, a lista de perfis não o inclui._ O contador precisa de login (por exemplo, para enviar o balancete) ou é só um cadastro com CRC?
- **D-26** ✅ _Respondida (Saulo, 2026-10-08): não é usuário, a lista de perfis não a inclui._ A "auditoria" citada na etapa de conclusão (E10) é um ator externo que acessa o sistema ou só um documento recebido?

## Perfis novos (lista do cliente de 2026-10-08, ver [[camadas/0-plataforma]])

- **D-27** ✅ _Respondida (Saulo, 2026-10-08): Colaborador é o Técnico; o nome usado sempre é **Técnico**, compatível com os desenhos._ "Colaborador" é o mesmo papel que o desenho chama de "Técnico"? Há colaborador que não é técnico (por exemplo, administrativo, que só cadastra e pede documentos)?
- **D-28** O que o Administrador Judicial faz no sistema: só acompanha, ou aprova e assina o RMA e o parecer depois da coordenação? Ele entra no fluxo de revisão (E11)?
- **D-29** O que o Magistrado vê e faz: só lê os RMAs e pareceres protocolados dos processos da vara dele? Comenta ou pede algo? Como ganha acesso (convite da BEx, por vara, por processo)? Isso muda o protocolo (D-14): o RMA passa a ser entregue pelo sistema?
- **D-30** O sistema atende só a BEx como administradora judicial ou outros AJs também (cada um com sua equipe, processos e modelos)? Multiempresa pesa no orçamento.
