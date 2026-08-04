# Modelo de Dados - RMABEx

> Entidades do domínio. Esta nota é a **base do schema** (Prisma/ORM). O `design.md` de cada spec referencia entidades daqui por `[[modelo-dados#Entidade]]`. Nomes de domínio em PT-BR; nomes de código em inglês.
>
> Derivado de [[pastas-documentos]], [[fluxo-processo]], [[anatomia-rma]] e das regras em [[regras-negocio]]. É um primeiro corte: cada spec refina a sua fatia.

## Visão geral

```
Processo 1-* Recuperanda 1-* Competencia
Competencia 1-* Documento          *-1 CategoriaDocumento 1-* AliasCategoria
Competencia 1-1 Balancete 1-* Saldo *-1 ContaContabil
Competencia 1-* ExecucaoChecklist 1-* ItemFaltante
Competencia 1-* Conciliacao 1-0..1 Divergencia
Competencia 1-* AlertaVariacao
Competencia 1-* Esclarecimento
Competencia 1-1 RMA 1-* SecaoRMA
Pendencia *-1 Competencia (origem), pode reaparecer nas seguintes
Usuario 1-* (autoria de marcações, revisões e protocolos)
```

## Convenções

- **Valores monetários**: nunca `Float`. O tipo exato ainda depende de uma verificação: o suporte de `Decimal` no Prisma sobre SQLite tem ressalva conhecida de precisão. Confirmar antes de fechar o schema; a alternativa segura é inteiro em centavos. Registrado em [[pendencias-externas]].
- **Percentuais** (variação, tolerância): armazenar como decimal fracionário, não como texto formatado.
- **Competência**: par ano/mês, nunca string livre. É a chave de agrupamento de quase tudo.
- **Auditoria**: entidades que registram decisão humana (marcação de relevância, revisão, protocolo) guardam autor e instante.

## Cadastro

### Processo

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| identificador | `id` | string | chave primária |
| número do processo | `caseNumber` | string | formato CNJ, único |
| vara | `court` | string | ex.: "4ª Vara Cível de Cascavel - PR" |
| comarca | `district` | string | |

### Recuperanda

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| identificador | `id` | string | |
| processo | `caseId` | FK | um processo tem várias ([[regras-negocio#RN-1]]) |
| nome | `name` | string | |
| CNPJs | `taxIds` | string[] | uma recuperanda pode ter vários |
| segmento | `sector` | enum | altera a estrutura do RMA ([[regras-negocio#RN-3]]) |
| ativa | `active` | bool | o RMA reporta recuperandas inativas |

### Competencia

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| identificador | `id` | string | |
| recuperanda | `debtorId` | FK | |
| ano | `year` | int | |
| mês | `month` | int | 1 a 12; único com recuperanda e ano |
| situação | `status` | enum | acompanha o avanço do ciclo |

## Documentos

### CategoriaDocumento

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| número canônico | `code` | int | 1 a 61, único ([[regras-negocio#RN-4]]) |
| descrição | `name` | string | |
| tipo de análise | `analysisType` | enum | `RECONCILIATION`, `BASE`, `OPINION`, `OPINION_CONTROL`, `SEPARATE` |
| regra de conciliação | `reconciliationRule` | string? | referência à `RN-x` correspondente |

### AliasCategoria

Existe porque o nome real da pasta varia entre clientes, ao longo do tempo, e traz erros de digitação ([[regras-negocio#RN-5]]).

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| categoria | `categoryId` | FK | |
| nome normalizado | `normalizedName` | string | sem acento, minúsculo, sem separador |
| origem | `source` | enum | canônico ou aprendido de dado real |

### Documento

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| identificador | `id` | string | |
| competência | `periodId` | FK | |
| categoria | `categoryId` | FK? | nulo quando não classificado ([[regras-negocio#RN-6]]) |
| caminho de origem | `sourcePath` | string | caminho no repositório de arquivos |
| nome do arquivo | `fileName` | string | |
| pasta de origem | `sourceFolderName` | string | preserva o nome cru, antes da normalização |
| confiança da classificação | `matchConfidence` | decimal | |
| classificado por | `classifiedBy` | enum | automático ou manual |

### ExecucaoChecklist e ItemFaltante

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência | `periodId` | FK | |
| executado em | `runAt` | datetime | histórico preservado ([[regras-negocio#RN-9]]) |
| executado por | `runBy` | FK Usuario | |
| item faltante -> categoria | `categoryId` | FK | uma linha por categoria exigida e ausente |

## Contabilidade

### ContaContabil

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| código da conta | `code` | string | plano de contas da recuperanda |
| descrição | `name` | string | |
| natureza | `nature` | enum | ativo, passivo, PL, resultado |
| papel canônico | `canonicalRole` | enum? | marca contas usadas por conciliação (Caixa, Estoques, Fornecedores, ...) |

O `canonicalRole` é o que liga a regra de negócio ao plano de contas de cada cliente: `RN-14` fala em "conta Estoques", e o plano de contas real chama de outra coisa.

### Balancete e Saldo

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência | `periodId` | FK | |
| documento de origem | `documentId` | FK | rastreabilidade ([[regras-negocio#RN-39]]) |
| saldo -> conta | `accountId` | FK | |
| saldo anterior | `openingBalance` | monetário | |
| saldo final | `closingBalance` | monetário | |
| movimentação | `movement` | monetário | derivado; usado por `RN-16` e `RN-31` |

### ValorExtraido

Valor lido de um documento pela análise automática, antes de virar conciliação.

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| documento | `documentId` | FK | |
| rótulo | `label` | string | o que o valor representa |
| valor | `amount` | monetário | |
| confiança | `confidence` | decimal | |

## Análise

### Conciliacao

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência | `periodId` | FK | |
| regra | `ruleCode` | string | `RN-13` a `RN-32` |
| valor do documento | `documentAmount` | monetário | |
| valor da conta | `accountAmount` | monetário | |
| diferença | `difference` | monetário | |
| resultado | `outcome` | enum | conciliado, divergente, não apurável |

### Divergencia

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| conciliação | `reconciliationId` | FK | |
| relevante | `relevant` | bool? | nulo até o técnico decidir ([[regras-negocio#RN-35]]) |
| marcado por / em | `markedBy` / `markedAt` | FK / datetime | |
| resolvida | `resolved` | bool | |

### AlertaVariacao

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência / conta | `periodId` / `accountId` | FK | |
| valor anterior / atual | `previousAmount` / `currentAmount` | monetário | |
| variação | `variationRate` | decimal | ([[regras-negocio#RN-34]]) |
| relevante | `relevant` | bool? | |

### Esclarecimento e Pendencia

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência de origem | `periodId` | FK | |
| origem | `sourceType` | enum | divergência ou alerta |
| texto | `body` | text | |
| situação | `status` | enum | aberto, respondido, encerrado |
| resposta / recebida em | `response` / `respondedAt` | text / datetime | |
| pendência: reaparece em | `carriedToPeriodId` | FK? | ([[regras-negocio#RN-37]]) |

## Relatório

### RMA

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| competência | `periodId` | FK | |
| situação | `status` | enum | em elaboração, revisar, aprovado, protocolado ([[regras-negocio#RN-42]]) |
| revisado por / em | `reviewedBy` / `reviewedAt` | FK / datetime | |
| protocolado em | `filedAt` | datetime? | |
| arquivo protocolado | `filedDocumentPath` | string? | |

### SecaoRMA

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| relatório | `reportId` | FK | |
| ordem | `position` | int | ordem de apresentação |
| numeração exibida | `displayNumber` | string | pode ter lacuna ([[regras-negocio#RN-38]]) |
| título | `title` | string | |
| conteúdo | `body` | text | |
| origem | `sourceKind` | enum | automático ou manual ([[regras-negocio#RN-40]]) |

## Acesso

### Usuario

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| nome / e-mail | `name` / `email` | string | e-mail é o canal do fluxo |
| papel | `role` | enum | técnico, revisor, coordenação, administrador judicial |

## Pontos ainda em aberto

- Consolidação de grupo econômico: o RMA é por recuperanda, por processo, ou os dois? A aba `Controle_Docs..` sugere controle por empresa dentro de um processo, mas o critério de consolidação dos números não está documentado.
- Onde os arquivos vivem: OneDrive continua sendo a origem, ou o sistema passa a ser o repositório? Isso muda `Documento.sourcePath` de referência para armazenamento.
- Se o "planilhão técnico" será substituído por este modelo ou continuará existindo como exportação.
