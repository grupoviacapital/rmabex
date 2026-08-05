# Pendências Externas

> Coisas que ficam **fora** do que fazemos aqui no código, mas que o projeto vai precisar antes de produção. Lista simples e direta. Aprofundamos cada item depois.

## Domínio (dependem da área técnica, travam specs)

> Os itens abaixo estão consolidados como perguntas ao cliente em [[perguntas-cliente]], rodada 1.

- [x] **Fórmulas dos indicadores** da seção 12 do RMA: RESPONDIDO em 04/08/2026. Registrado em [[regras-negocio#RN-41]] e [[formulas-sistema-anterior]].
- [ ] **Limiar do alerta de variação**: o escopo diz "geralmente 15% ou 20%". Definir o valor, e se é global, por conta ou por cliente. Trava [[regras-negocio#RN-34]].
- [ ] **Tolerância de conciliação**: nenhum documento define. Sem ela, diferença de centavos vira divergência falsa. Trava [[regras-negocio#RN-33]].
- [ ] **Consolidação de grupo econômico**: o RMA é por recuperanda, por processo, ou consolidado? Ver [[modelo-dados]].
- [ ] **Origem dos arquivos**: o OneDrive continua sendo a fonte ou o sistema passa a ser o repositório?
- [ ] **Planilhão técnico**: substituir pelo modelo de dados ou manter como formato de exportação? Candidato a ADR.
- [ ] **Convenção de pastas de IA** (`Entradas IA`, `Processando IA`, `Processados IA`, `Erros IA`): manter o contrato existente no OneDrive ou substituir? Candidato a ADR.

## Técnicas a verificar

- [ ] **Tipo monetário no Prisma sobre SQLite**: confirmar o comportamento de `Decimal` antes de fechar o schema; alternativa segura é inteiro em centavos. Ver [[modelo-dados]].

## Segurança e infra

- [ ] Pentest profissional (antes de produção, por lidar com dinheiro).
- [ ] Segurança de infra: HTTPS/TLS, WAF, headers de segurança no deploy.
- [ ] Backups do banco + criptografia em repouso.
- [ ] Hardening do servidor/hosting.
- [ ] Rotação e cofre de segredos (ex.: gestor de secrets no ambiente de deploy).

## Compliance

- [ ] LGPD: análise formal se houver dado de terceiros (base legal, retenção, direitos do titular).

## Design / Marca

- [ ] Arte final de logo (vetor refinado) por designer em Figma/Illustrator.
- [ ] Manual de marca completo, se necessário.

## Operação

- [ ] Monitoramento/observabilidade (logs, alertas, uptime) em produção.
- [ ] Estratégia de deploy e ambiente (staging vs produção).
