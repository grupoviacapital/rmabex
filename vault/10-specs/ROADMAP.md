# Roadmap de Specs - RMABEx

> Decomposição do projeto em specs, por ordem de dependência. Uma spec só entra em `/implement` depois de `requirements -> design -> tasks` aprovados. Atualize o status conforme avança.
>
> Derivado de [[fluxo-processo]], [[pastas-documentos]] e [[anatomia-rma]]. É uma proposta de decomposição: revise a ordem antes de abrir a primeira spec.

| Spec | Escopo | Depende de | Status |
|------|--------|-----------|--------|
| 001 · Scaffold da stack | Next.js + TS estrito + Prisma + SQLite + Zod + Vitest + Playwright, lint, hooks, CI. | - | `A escrever` |
| 002 · Cadastro de processo e recuperandas | Processo (número, vara), recuperandas (nome, CNPJs, segmento), vínculo de grupo econômico. | 001 | `A escrever` |
| 003 · Taxonomia de pastas e classificação | As 61 categorias, correspondência tolerante de nome, caminho para "não classificado". | 002 | `A escrever` |
| 004 · Ingestão de documentos e check list | Varredura do repositório de arquivos, relação de faltantes, reexecução idempotente com histórico. | 003 | `A escrever` |
| 005 · Importação do balancete | Leitura da planilha, plano de contas, saldos por competência, comparação mês a mês. | 002 | `A escrever` |
| 006 · Motor de conciliação | As 20 regras de conciliação documento x conta, produzindo divergências. | 004, 005 | `A escrever` |
| 007 · Alertas de variação | Limiar de 15-20% por conta contra o mês anterior, marcação de relevância pelo técnico. | 005 | `A escrever` |
| 008 · Extração por IA de documentos | Leitura de comprovantes e relatórios, extração de valores para as conciliações. | 004 | `A escrever` |
| 009 · Geração do RMA | Montagem das 18 seções, seções condicionais por segmento, indicadores (liquidez, CMV, EBITDA), gráficos. | 006, 007 | `A escrever` |
| 010 · Fluxo de revisão e protocolo | Máquina de estados (revisar, aprovado, protocolado), notificações por e-mail, diretório de protocolados. | 009 | `A escrever` |
| 011 · Esclarecimentos e pendências | Pedido à recuperanda, ciclo de retorno, pendências que transitam entre RMAs. | 006, 010 | `A escrever` |
| 012 · Shell de UI e tema | Aplica os tokens de [[ui-referencia]]. Rode `/identidade` antes. | 001 | `A escrever` |

## Tarefas de documentação (não viram spec)

- [x] Indexar o material legado de escopo -> [[fontes-escopo]]
- [x] Extrair a taxonomia das 61 pastas e as regras de conciliação -> [[pastas-documentos]]
- [x] Extrair o fluxo do processo -> [[fluxo-processo]]
- [x] Extrair a estrutura do RMA -> [[anatomia-rma]]
- [x] Preencher o glossário -> [[glossario]]
- [x] Extrair os fluxos do `Manual de Operações_Área Técnica_V2.xlsx` -> [[fluxos-area-tecnica]] e `escopo/fluxogramas/`
- [ ] Criar `RN-x` para o calendário mensal do RMA (dia 10, dia 20, D+2, último dia útil), descoberto em [[fluxos-area-tecnica]]
- [ ] Reconciliar o fluxo manual e o fluxo automatizado do RMA, que divergem
- [ ] Converter as regras de conciliação em `RN-x` em [[regras-negocio]]
- [ ] Modelar as entidades em [[modelo-dados]]
- [ ] Documentar as telas do sistema legado (`OLD_RMA/escopo/Telas/`) em [[ui-referencia]]
- [ ] Definir as fórmulas dos indicadores da seção 12 do RMA (liquidez, CMV, EBITDA)

## Notas

- A primeira spec normalmente inclui o **scaffold da stack** + tooling (lint, testes, Husky/commitlint, CI).
- Uma spec de **Shell de UI e Tema** aplica os tokens de [[ui-referencia]] (rode `/identidade` antes).
- Cada regra `RN-x` de [[regras-negocio]] deve estar coberta por ao menos uma spec.
- Decisões abertas viram ADR em [[../20-decisions/adr-000-template|ADR]] conforme surgem. Candidatas já identificadas: substituir ou manter o planilhão técnico; manter ou substituir a convenção de pastas `Entradas IA / Processando IA / Processados IA / Erros IA`.
