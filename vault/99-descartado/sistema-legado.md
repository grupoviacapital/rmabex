# Sistema Legado - o que foi implementado

> Mineração dos três repositórios em `OLD_RMA/`, feita em 04/08/2026. Referências de arquivo e linha apontam para o código legado, não para este projeto.
>
> **Peso desta nota:** o código mostra o que a empresa anterior *fez*, não o que o cliente *aprovou*. Onde o código contradiz o escopo, o escopo vence (ver [[fontes-escopo]]). Cada achado aqui é candidato a confirmação, não regra.

> [!warning] O repositório KANTIZ saiu de escopo em 04/08/2026
> O cliente determinou: *"se tiver alguma coisa de Kanitz nesse projeto ou código, pode desconsiderar. Porque no mínimo teve uma cópia de código para fazer outro projeto."*
>
> Consequências, todas já aplicadas abaixo:
> - **O Termômetro de Kanitz sai do domínio.** Não é indicador do RMA.
> - **Tudo que veio do repositório KANTIZ perde autoridade**, inclusive o `docs/BS_DADOS_ESPECIFICACAO.md`, que se autodeclarava "Single Source of Truth". Ele é a especificação do outro produto, não do RMA.
> - Em particular, o **"Referencial Giannini 2026.05.28"** (grupo 12 é o ANC, grupo 13 fica de fora) veio dessa fonte e **volta a ser pergunta em aberto**. Eu havia cortado essa pergunta do envio dizendo que estava "datada e assinada no material" - a premissa era errada.
> - O que **não** é afetado: a `RN-41`, porque foi confirmada pela Gisele e pela planilha do escopo, não pelo KANTIZ.

## Os três repositórios

| Repositório | O que é | Banco |
|---|---|---|
| `RMA-VS-1-FINAL-main` | O sistema RMA. ~330 tabelas, 329 migrations, 19 mil linhas de tipos. | Supabase `rmurnpsjbdyplviqnzfd` |
| `PROSPECCAO-VS1-main` | **Fork do RMA** em 26/06/2026 (212 arquivos byte-idênticos, 141 das 143 migrations em comum) mais um módulo pequeno de Prospecção (3 tabelas, 2 telas). O módulo nunca voltou ao RMA. | Supabase `waachpgyqlecufrjldjw` |
| `KANTIZ-VS-1-FINAL-main` | Produto diferente: SaaS por assinatura **BEx Brasil** (`bexbrasil.online`) vendido a escritórios de contabilidade. Zero ocorrências de "RMA". O nome é grafia errada de **Kanitz**, o Termômetro de Insolvência. | Supabase `mrvizydgxysaxazhmfqk` |

Três bancos separados, sem referência cruzada. Os três são Vite + React + shadcn gerados por Lovable.

**Cobertura de produto:** dos cinco produtos da área técnica ([[fluxos-area-tecnica]]), o código cobre **RMA** e **Prospecção**. DAL, Constatação Prévia e Prestação de Contas não existem em nenhum repositório - nem tabela, nem rota, nem string.

## O que confirma as nossas notas

**A taxonomia de 61 pastas está correta.** `onedriveFolders.ts` é auto-gerado da mesma planilha que usamos, numeração 1 a 61 sequencial e sem buracos, e marca exatamente as mesmas 20 pastas como conciliação: 5, 9, 10, 11, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 25, 26, 35, 40, 41, 45. Confirma [[pastas-documentos]] e as regras `RN-13` a `RN-32` por fonte independente.

**A classificação tolerante de nome é necessária, e eles chegaram nela.** `dipFolderPaths.ts` normaliza por NFD removendo acento, minúsculas e colapso de não-alfanuméricos; remove o prefixo `NN -` com qualquer separador; e casa em três camadas (igualdade, substring bidirecional, palavras fortes com tolerância a plural). Confirma [[regras-negocio#RN-5]].

**O estado "não classificado" é real.** A UI classifica em `ok`, `orphan` (pasta `NN` cujo número não existe), `unclassified` (fora de pasta canônica) e `topic_empty`. Confirma [[regras-negocio#RN-6]] e [[regras-negocio#RN-7]].

## O que contradiz, ou revela buraco

### O núcleo do produto não foi implementado

O motor de conciliação existe e roda, mas **não conhece as 20 regras**. Ele cria uma unidade por conta do balancete e concilia genericamente. A ponte documento para conta é feita por `reconciliation-auto-mapping` em três tentativas: código exato no nome da pasta, similaridade de bigramas **com corte em 0,95**, ou histórico.

Isso não pode funcionar: "15 - Resumo da folha de pagamento" nunca atinge 0,95 de similaridade com "2.1.03 - Salários a Pagar". Some-se a isso:

- **10 das 20 conciliações não têm regra tipada** (pastas 14, 19, 20, 21, 22, 23, 35, 40, 41, 45 caem em `{ kind: 'NONE' }`).
- O arquivo que declara as regras **não é consumido por nenhum motor de execução** - serve só para gerar texto de dica para o LLM.
- Das 15 cross-validations catalogadas, **apenas 4 estão implementadas**; as demais retornam `pending_data`.

É exatamente o problema que `ContaContabil.canonicalRole` resolve em [[modelo-dados]].

### Não existe processo judicial no modelo

Nenhuma tabela de processo. A chave natural do relatório é `UNIQUE (company_id, year, month)`. Nenhuma coluna de empresa-mãe, grupo ou holding. O frontend lê `companies.process_number`, mas **essa coluna não existe em migration nenhuma** - código órfão.

E o mais relevante: **o grupo econômico existe na planilha do cliente e é descartado na ingestão**. O parser suporta layout multi-empresa, mas agrega: se qualquer subitem marcou apresentado, considera apresentado. Um comentário no código diz `Recuperanda -> IGNORADO (o RMA já conhece a empresa)`.

Ou seja: a P-4 tem resposta implícita, e ela joga informação fora.

### A obrigatoriedade nunca foi definida

A tabela `rma_topic_document_requirements` existe, com níveis `MANDATORY`, `CONDITIONAL`, `OPTIONAL` e flags por estágio - e **está vazia, sem nenhum seed**. Só duas pastas são marcadas obrigatórias no código: 7 (Balancete) e 8 (DRE). Não há nada que condicione obrigatoriedade a segmento ou a estágio do processo, embora `companies.sector` exista.

A P-9 continua sem resposta. Eles também não sabiam.

### A categoria do documento nunca é persistida

`onedrive_files` guarda `path`, `metadata` e `status`. Não há coluna de categoria resolvida, nem FK para catálogo. **A categoria é sempre re-derivada do caminho**, e os aliases de pasta são calculados em memória a cada execução, a partir dos próprios dados, sem dicionário persistido de sinônimos ou erros de digitação.

### Três numerações concorrentes para a mesma coisa

`ONEDRIVE_FOLDERS` (61 itens, 1..61), `RMA_TOPICS` (61, mesma ordem) e `DIP_FOLDERS` (60 itens, com um campo `rmaTopicNumber` que **não** é igual ao `id`). O mesmo documento tem número diferente conforme a lista consultada. "Balancete de Verificação" é pasta 7 numa, tópico 5 noutra.

## Fórmulas: cinco EBITDAs

Nenhuma decisão foi tomada. Convivem no mesmo repositório:

```
resultado + |despFin| - |recFin| + |dep| + |amort|     (indicatorsEngine)
lucro_bruto - despesas                                 (RMADRETab, sem somar depreciação)
resultado_bruto + desp_adm + desp_vendas + desp_trib + dep_amort   (spec, rotulado APROXIMADO)
lajir + (despFin * 0.1)                                (Audit.tsx, "simplified proxy")
resOp + despFin                                        (Audit.tsx, outro ponto)
```

Mesma situação em Liquidez Geral (quatro versões, uma usando `ANC × 0.1`) e em prazos médios (`×30` no motor real, `×360` na tela de modelo). A tela que documenta o Kanitz exibe rótulos de variáveis que não correspondem ao que ela calcula.

**A fonte mais coerente é outro repositório:** `KANTIZ/docs/BS_DADOS_ESPECIFICACAO.md`, que se declara "Single Source of Truth" e traz um conjunto único e consistente:

```
CMV / RL                    = |CMV| / Receita Líquida
(CMV + Despesa) / RL        = (|CMV| + |Despesas|) / RL
Resultado / RL              = Resultado / RL   (mantém sinal)
EBITDA                      = Resultado + |Desp. Financeiras| + |Depreciação|
                              + |Amortização| + |Tributos sobre lucro|
Liquidez Imediata           = Disponível / PC
Liquidez Corrente           = AC / PC
Liquidez Seca               = (AC - Estoques) / PC
Endividamento Geral         = (PC + PNC) / PL
Composição do Endividamento = PC / (PC + PNC)
```

Kanitz implementado: `0.05*RPL + 1.65*LG + 3.55*LS - 1.06*LC - 0.33*GE`.

## Tolerâncias e limiares encontrados

| Contexto | Valor |
|---|---|
| DRE x balancete | R$ 0,01 |
| Fluxo de caixa, aging, conciliação por conta (default) | R$ 0,05 |
| Ativo = Passivo + PL | 0,1% (ou R$ 1) |
| Ativo = Passivo + PL (spec do BEx) | ±1% |
| Conflito entre documentos para a mesma conta | 1% (ou R$ 1) |
| Catálogo de cross-validation | 15 tolerâncias, de 0,1% a 10%, com severidade `blocker` ou `warning` |
| Materialidade | piso R$ 50.000 **ou** 5% da receita líquida, com overrides por capítulo |
| Queda de receita mês a mês | alerta em -15% |
| Alta de custos mês a mês | alerta em +15% |
| Materialidade de variação | ±20% contra o período anterior |
| Salto anômalo entre períodos | 75% |

Variação mês a mês tem fórmula oficial declarada: `valorMes / valorMesAnterior - 1`, com uma fórmula alternativa explicitamente proibida de ser rotulada como "variação m/m" - o comentário registra um caso real em que as duas deram 374% e 19%.

**Nenhuma tolerância parametrizada por empresa foi populada.** As colunas existem, sem seed e sem tela; o worker sempre usa o default.

## Regras contábeis que nenhum documento do escopo tinha

1. **A DRE vem acumulada e precisa ser desacumulada.** O builder converte saldos YTD em mensais subtraindo o mês anterior, e pula na virada de ano. Sem isso, todo indicador de resultado sai errado.
2. **Duas convenções de plano de contas coexistem.** Um serviço classifica o grupo 4 como receita e 5 como despesa; outro classifica 4 como CMV e 5 como custo industrial.
3. **Natureza da conta pelo primeiro dígito**, com `DEVEDORA: SI + D - C` e `CREDORA: SI + C - D`.
4. **Aging tem três definições** no mesmo repositório: 4 faixas nas pastas, 6 faixas na spec de capital de giro (com corte extra em 60 dias), 4 nas migrations.
5. **Referencial Giannini, 2026.05.28**: o totalizador de Ativo Não Circulante autoritativo é o sintético do grupo 12; o grupo 13 (Ativo Permanente) é bucket independente e não compõe ANC nem Ativo Total.

## Arquitetura de arquivos

Os documentos de origem **ficam no OneDrive**. O sistema guarda apenas ponteiro (`file_id`, `drive_id`, `path`, `etag`, `hash`) e busca os bytes sob demanda, em streaming, na hora do OCR. A hierarquia é imposta em código: `Projeto RMA/{CLIENTE}/{ANO}/{MM.AAAA}`, com exceção lançada se o caminho sair da base.

Os artefatos que o sistema **produz** (relatórios, anexos) vão para buckets do Supabase Storage. Existe também uma rota paralela de upload manual que grava no bucket `documents`.

Isso responde a P-5 na prática: OneDrive é a origem, o sistema é o índice.

## Estados: quatro máquinas sem unificação

- **Documento** (`rascunho`, `em_producao`, `pre_parecer`, `finalizado`): só um CHECK, nenhuma transição validada.
- **Seção** (`pendente`, `em_edicao`, `revisado`, `aprovado`, `concluido`): esta é completa e bem feita - função com `SECURITY DEFINER`, matriz de transições, exigência de conteúdo não vazio para revisar, papéis distintos para aprovar, devolver com motivo obrigatório, reabrir só por gestor, versão imutável a cada transição e log de auditoria.
- **`rmas.status`**: sem CHECK, sem enum, sem transição. Default `ativo` e nada mais.
- **Ciclo conceitual em TypeScript**: 11 estágios (`RECEPTION` a `PUBLICATION`), sem enforcement no banco.

Mais um achado: o gate de liberação do relatório para a recuperanda valida o papel de quem libera, **mas não valida que o relatório esteja finalizado**. É possível liberar um rascunho.

Para [[regras-negocio#RN-42]] e `RN-43`, a máquina de seção é o melhor ponto de partida que existe; a de documento não é.

## Tipo monetário

Postgres `numeric(18,2)` para lançamentos e balancete, `numeric(20,2)` para conciliação. Não é inteiro de centavos, não é float. Ressalva: em TypeScript tudo chega como `number`, então a precisão exata só existe no banco.

## Dívida que não vamos repetir

Há **dados de produção de um cliente real embutidos em arquivos de configuração** - receita, resultado, ativo e liquidez da Geratherm por competência, e textos narrativos prontos para tópicos específicos. Pode ter sido calibração deliberada; em qualquer caso, não replicamos.

## Links

- Nossa taxonomia: [[pastas-documentos]]
- Nossas regras: [[regras-negocio]]
- Nosso modelo: [[modelo-dados]]
- O que perguntar ao cliente: [[perguntas-cliente]]
