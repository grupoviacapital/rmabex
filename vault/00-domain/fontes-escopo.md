# Fontes de Escopo - Índice do material legado

> Mapa do que existe em `OLD_RMA/escopo/` (fora do git), o que cada documento define e para que ele é autoridade. Use este índice antes de abrir qualquer arquivo: ele evita reler 9 GB de material para achar uma regra.
>
> Regra de precedência: **`escopo/` é a verdade do domínio**. Os repositórios legados (`OLD_RMA/RMA-VS-1-FINAL-main/` etc.) servem só para conferir fórmula de cálculo ou detalhe de tela.

## Documentos normativos (definem regra)

| Documento | Define | Nota derivada |
|-----------|--------|---------------|
| `Acessos da Plataforma RMA - Retorno da Plataforma/Código de Pastas Onedrive_Documentos (2) - identificação.xlsx` | As 61 pastas de documentos **e a regra de análise de cada uma** (conciliação vs parecer). Fonte mais importante do domínio. | [[pastas-documentos]] |
| `Lista das Pastas Onedrive_Documentos.xlsx` | Mesma taxonomia, sem a coluna de análise. Aba `Controle_Docs..` traz o controle de entrega por empresa do grupo. | [[pastas-documentos]] |
| `Fluxo Processo RMA IA_v3.xlsx` | Fluxo ponta a ponta do processo automatizado (técnico, IA, validação, protocolo). O fluxo está em **shapes** na aba `Fluxo RMA`, não em células. | [[fluxo-processo]] |
| `Acessos da Plataforma RMA - Retorno da Plataforma/retorno_da_plataforma.txt` | Alerta de variação de contas (15-20%) e a seção extra obrigatória para Agronegócio (Provimento 216). | [[fluxo-processo]], [[anatomia-rma]] |
| `DIP - RMA - Março.2026 final.docx` | RMA real e completo (18 seções). Referência de estrutura, tom e profundidade do relatório final. | [[anatomia-rma]] |
| `Manual de Operações_Área Técnica_V2.xlsx` | Organograma da área técnica e fluxos por produto (RMA, DAL, Constatação Prévia, Prospecção, Prestação de Contas), com os prazos de cada um. Estava em shapes. | [[fluxos-area-tecnica]] |
| `01.BASE RELATÓRIO_xi teste.XLSM` | **O motor de cálculo do RMA.** 14 abas. `P&L + EBITDA` define o EBITDA; `INDICE` define liquidez e endividamento; `BS` monta o balanço a partir do balancete por `SUMIF` de referência de capital; `Folha` define o quadro de funcionários; `Dados para Graficos` alimenta os gráficos. É a fonte mais autoritativa de fórmula que existe no projeto. | [[formulas-sistema-anterior]] |
| `RMA_RMA-DIP-01-2026_jan_de_2026 indicação de pastas.docx` | RMA anotado. **A informação está nos 45 comentários de margem**, não no corpo: para cada seção, a pasta de origem, se há conciliação, e exemplos de documento. | [[mapa-secao-pasta]] |
| `01 - Controle de entrega de documentos 2025.xlsx` | O controle que a recuperanda preenche. 42 itens na mesma numeração canônica, com subitens por conta bancária. Colunas de status e de dúvidas/esclarecimentos. | [[pastas-documentos]] |

## Documentos de apoio (exemplo, não regra)

| Documento | O que é |
|-----------|---------|
| `XPT S.A - RMA- BEx 08.2024 teste.docx` | RMA de teste com empresa fictícia; gabarito anonimizado. |
| `XPT S.A_Balancete_xi testete.xlsx` | Balancete de teste, 972 linhas. **Formato de entrada**: `Conta`, `Descrição` e uma coluna por mês. Código de conta hierárquico (`1`, `11`, `111`, `111010`, `1110100001`), sintético ou analítico pelo comprimento. |
| `Parecer Técnico - Raizen 2023-2025.docx` | Parecer avulso sobre empresa de capital aberto. Registra a decisão de **não usar o Termômetro de Kanitz** porque o modelo indicaria solvência num grupo em deterioração, e usar o **Índice de Solvência Geral (ISG)** no lugar. |
| `Telas/1.png` a `20.png` | 19 capturas de proposta de interface (falta a `4`). | 
| `OneDrive/*.pdf` | Relatórios de transparência de auditoria (Grant Thornton, IPPF). Contexto de mercado, não regra. |

Detalhamento das telas em [[telas-legado]].

## Dados reais de cliente (sensíveis)

`OneDrive/DIPLOMATA/` e `OneDrive/GERATHERM/` (extraídos dos `.zip` homônimos) somam ~9 GB e ~20 mil arquivos: balancetes, extratos bancários, folhas de pagamento, comprovantes com nome e CNPJ de terceiros.

- Servem para conferir **estrutura real de pastas e nomenclatura de arquivos**, não para virar fixture.
- Nunca entram no repositório, nem em teste, nem em prompt de IA sem anonimização. Ver [[seguranca]].
- Os `.zip` originais foram mantidos ao lado dos diretórios extraídos.

## Rodada adicional de material (04/08/2026)

Pasta `escopo/mais_documentacoes/`, com três arquivos:

| Arquivo | Situação |
|---|---|
| `Código de Pastas Onedrive_Documentos (2) - identificação.xlsx` | Duplicata byte a byte. **Removida** em 04/08/2026; o original segue em `Acessos da Plataforma RMA - Retorno da Plataforma/`. |
| `RMA_RMA-DIP-01-2026_jan_de_2026 indicação de pastas.docx` | Duplicata byte a byte. **Removida**; original no mesmo lugar. |
| `01.BASE RELATÓRIO - GIANNINI 08.2024 teste (1).XLSM` | **Novo e mantido.** Outra instância do mesmo template, para a Giannini, competência 08.2024. Mesmas 14 abas. |

**Giannini não é um cliente qualquer.** O nome aparece três vezes no sistema legado, sempre como referência de calibração: no comentário `// Modelo Kanitz - Planilha Giannini` do cálculo de insolvência; na regra datada "Referencial Giannini 2026.05.28" que define o tratamento dos grupos 12 e 13 do ativo; e como origem da tabela dinâmica de fluxo de caixa (`Giannini - Fluxo de Caixa Projetado 6 meses`). É a instância contra a qual a equipe anterior aferia o sistema, o que torna este arquivo o **melhor candidato a fixture** que temos - e significa que os três defeitos estavam na própria linha de base de calibração.

**O arquivo da Giannini reproduz os três defeitos** encontrados em [[motor-calculo]], idênticos:

- Linha 45 da aba `P&L + EBITDA` rotulada "Depreciações e Amortizações" com referência `40.G` (Compromissos RJ), enquanto a linha 29 usa corretamente `30.E`. O bloco de EBITDA estorna as duas.
- `FOLHA DE ROSTO!N3` busca "Agosto 2024" numa faixa que termina na coluna M (junho).
- `Dados para Graficos` linhas 36 e 38 dividindo pelo lucro líquido.

Consequência: **não são defeitos da cópia de teste, são defeitos do template**, presentes numa planilha de cliente real. Nenhum dos três arquivos é a versão `2-2` citada na documentação do sistema antigo, que continua faltando.

## Derivados gerados por nós

Pastas criadas a partir do material original, que continua intacto no lugar.

| Pasta | Conteúdo |
|-------|----------|
| `escopo/fluxogramas/` | Os 6 fluxogramas renderizados em PNG: `rma-ia.png` (fluxo automatizado proposto) e `manual-fluxo-*.png` (os 5 produtos da área técnica). Ver [[fluxos-area-tecnica]]. |
| `escopo/graficos-rma/` | Os 40 gráficos e imagens embutidos no RMA de março de 2026. Mostram quais gráficos o sistema precisa gerar. |
| `escopo/OneDrive/DIPLOMATA/`, `escopo/OneDrive/GERATHERM/` | Conteúdo extraído dos `.zip` homônimos. |

## Cobertura da leitura

Em 04/08/2026 todo o material de `escopo/` foi aberto e lido, arquivo por arquivo, incluindo shapes de Excel, comentários de Word e as capturas de tela. A classificação anterior deste índice foi feita por nome de arquivo e estava errada em pontos importantes: o `01.BASE RELATÓRIO` estava marcado como "apoio" quando é o motor de cálculo, e o RMA anotado estava marcado como apoio quando carrega o mapa de seção para pasta.

Único material não lido integralmente: os 5 PDFs de relatório de transparência em `OneDrive/`, que são publicações de firmas de auditoria e não descrevem o processo, e os ~20 mil arquivos de dados de cliente extraídos dos zips, dos quais foi analisada a estrutura de pastas e não o conteúdo.

## Lacunas conhecidas

- `Telas/4.png` não existe.
- A aba `Controle_Docs..` cita um grupo com 7 empresas (TTT, RMJ, TEC, TEF, TCA, NASSON, TH): confirma que **um processo pode ter várias recuperandas**, mas o critério de consolidação ainda não está documentado.
