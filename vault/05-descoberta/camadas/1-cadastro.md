# Camada 1 - Cadastro do processo

> Etapa E1 do [[fluxo-v8]] mais a aba "Cadastros" da planilha. Apresentada em 2026-10-07, **ainda não discutida**. Voltar ao [[index]].

## O que o desenho diz

1. Técnico cadastra a recuperanda, depois o contador com CRC, depois o nº do processo.
2. A IA consulta o nº nos TJs: se acha, cadastra a(s) recuperanda(s); se não, cadastro manual.
3. Técnico confere, marca **produtor rural** (S/N) e edita se algo estiver errado.
4. Comunica a recuperanda (segue para a camada 2).

Aba "Cadastros" (Cadastro Recuperanda): nome da recuperanda, nº do processo, CNPJs, "Seguimento" (segmento).

## Mudança em relação ao desenho (Saulo, 2026-10-08)

Quem cadastra processo, recuperanda e administrador judicial é a **coordenação** (o admin só cadastra coordenadores; nada se cadastra por fora), que também cadastra o magistrado e vincula o técnico (**um por processo**, trocável). O técnico não altera esses cadastros. Ver [[0-plataforma]].

## Já respondido (Saulo, 2026-10-08)

- A consulta aos TJs serve **só para buscar os dados do processo no cadastro** (TJSP, TJGO etc.).
- Vários CNPJs por processo, **análise separada por CNPJ** mais um consolidado; o cadastro precisa do **tipo de consolidação** (substancial ou processual), que decide como o RMA apresenta as análises. Ver [[../briefing|briefing]].

## Consulta ao tribunal: extra da v1 (Saulo, 2026-10-08)

Fica **fora do valor fechado**, como extra da v1. Na v1, o cadastro é **manual**, com validação do número CNJ (o número já identifica o tribunal).

Como será o extra: ao digitar o número, a plataforma consulta **TJ (scraper) + DJEN + DataJud**, junta os dados mais recentes e **autocompleta** o cadastro. Mesma base técnica do `Projects/iajuridica`. O que o levantamento de 2026-10-08 achou lá:

- **O que reaproveita**: Node/TS com axios + cheerio (e puppeteer onde precisa), cliente DataJud, cliente DJEN, proxy residencial brasileiro, resolução de captcha (2Captcha), infra AWS São Paulo (`sa-east-1`, x86).
- **O que é novo**: o iajuridica coleta **por janela de data** (jurisprudência), nunca **por número de processo**. Aqui a busca é pelo número, na **consulta processual** de cada tribunal (e-SAJ, PJe, Projudi, eproc), que são telas diferentes das de jurisprudência. Cada sistema de tribunal é um scraper novo.
- **DataJud** (busca por número, chave pública do CNJ): classe, órgão julgador (vara), assuntos, data de ajuizamento, movimentos. **Não traz as partes** (as recuperandas).
- **DJEN**: publicações com número do processo, órgão, classe e texto; o campo de destinatários traz as partes. O iajuridica não filtra por número; falta confirmar que a API aceita esse filtro.
- **Custos e riscos**: exige IP brasileiro (os `.jus.br` bloqueiam IP de fora); TJGO usa Cloudflare Turnstile e o e-SAJ (TJSP) usa reCAPTCHA na busca de 2º grau, com custo por captcha resolvido; os portais mudam sem aviso.

## Campos do cadastro (base: `Projects/sgcbex`, levantado em 2026-10-08)

O sgcbex tem 76 colunas em `processos`; a maior parte é do fluxo de lista de credores (cartas, editais dos arts. 52 e 7º, quadro QGC, corte de auditoria) e **não entra**. Proposta para o RMA:

**Processo**
- número CNJ (único; o tribunal sai do número), tipo de ação (recuperação judicial ou falência), vara, comarca, UF, sistema do tribunal (e-SAJ, PJe, Projudi, eproc), endereço do juízo
- data do pedido de RJ (= ajuizamento, base do "endividamento pós-RJ"), data do deferimento
- **consolidação**: processual ou substancial (já existe no sgcbex)
- **produtor rural** (novo; o sgcbex não tem)
- status (ativo, suspenso, encerrado)
- ligações: técnico (um), AJ, magistrado
- advogado da recuperanda (nome e contato)
- **contador**: nome e CRC (novo; o sgcbex não tem), **um por processo**

**Recuperanda** (N por processo, papel matriz ou filial)
- razão social, CPF ou CNPJ, tipo de pessoa (PF cobre o produtor rural pessoa física), nome fantasia
- inscrição estadual e municipal, data de constituição, natureza jurídica, porte, CNAE, situação cadastral na Receita
- endereço completo
- contato: nome, telefone, **e-mail (é o login da recuperanda)**
- **filiais**: razão social e CNPJ de cada uma (tabela à parte, como no sgcbex)

**Fora**: cartas, editais, quadro de credores, datas de corte, convolação em falência, e-mail do edital.

## Pontos a discutir

- ✅ **Estrutura** (C-1, Saulo, 2026-10-08): **um processo reúne várias recuperandas do mesmo grupo**, cada uma com o seu CNPJ. A análise mensal é **por recuperanda** (mais o consolidado); as filiais ficam só como dado cadastral.
- **Lista do Técnico** (checklist que a E2 usa): a raia chama "Cadastro e Check list", então nasce aqui. Lista padrão por tipo (normal ou produtor rural) ajustável por processo?
- ✅ **Contador** (Saulo, 2026-10-08): **um por processo**, cuida de todas as recuperandas do grupo. Sem login (D-25).
- **Produtor rural**: marcação do processo ou de cada recuperanda? Pode misturar?
- ✅ **Tipo de ação** (C-2, Saulo, 2026-10-08): **os dois**, recuperação judicial e falência. Na falência o **layout do RMA parece mudar** (a confirmar com o cliente; entra na camada 5).
