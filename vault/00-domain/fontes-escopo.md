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

## Documentos de apoio (exemplo, não regra)

| Documento | O que é |
|-----------|---------|
| `XPT S.A - RMA- BEx 08.2024 teste.docx` | RMA de teste com empresa fictícia; útil como gabarito anonimizado. |
| `XPT S.A_Balancete_xi testete.xlsx` | Balancete de teste que casa com o RMA acima. |
| `01.BASE RELATÓRIO_xi teste.XLSM` | Planilha base do relatório ("planilhão técnico" citado no fluxo). |
| `01 - Controle de entrega de documentos 2025.xlsx` | Modelo do controle que a recuperanda preenche e salva na pasta. |
| `Parecer Técnico - Raizen 2023-2025.docx` | Exemplo de parecer técnico avulso. |
| `RMA_RMA-DIP-01-2026_jan_de_2026 indicação de pastas.docx` | RMA anotado indicando de qual pasta sai cada informação. |
| `Telas/1.png` a `20.png` | Capturas das telas do sistema legado (falta a `4`). Referência de UI. |
| `OneDrive/*.pdf` | Relatórios de transparência de auditoria (Grant Thornton, IPPF). Contexto de mercado, não regra. |

## Dados reais de cliente (sensíveis)

`OneDrive/DIPLOMATA/` e `OneDrive/GERATHERM/` (extraídos dos `.zip` homônimos) somam ~9 GB e ~20 mil arquivos: balancetes, extratos bancários, folhas de pagamento, comprovantes com nome e CNPJ de terceiros.

- Servem para conferir **estrutura real de pastas e nomenclatura de arquivos**, não para virar fixture.
- Nunca entram no repositório, nem em teste, nem em prompt de IA sem anonimização. Ver [[seguranca]].
- Os `.zip` originais foram mantidos ao lado dos diretórios extraídos.

## Derivados gerados por nós

Pastas criadas a partir do material original, que continua intacto no lugar.

| Pasta | Conteúdo |
|-------|----------|
| `escopo/fluxogramas/` | Os 6 fluxogramas renderizados em PNG: `rma-ia.png` (fluxo automatizado proposto) e `manual-fluxo-*.png` (os 5 produtos da área técnica). Ver [[fluxos-area-tecnica]]. |
| `escopo/graficos-rma/` | Os 40 gráficos e imagens embutidos no RMA de março de 2026. Mostram quais gráficos o sistema precisa gerar. |
| `escopo/OneDrive/DIPLOMATA/`, `escopo/OneDrive/GERATHERM/` | Conteúdo extraído dos `.zip` homônimos. |

## Lacunas conhecidas

- `Telas/4.png` não existe.
- A aba `Controle_Docs..` cita um grupo com 7 empresas (TTT, RMJ, TEC, TEF, TCA, NASSON, TH): confirma que **um processo pode ter várias recuperandas**, mas o critério de consolidação ainda não está documentado.
