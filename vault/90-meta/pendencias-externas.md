# Pendências Externas

> Coisas que ficam **fora** do que fazemos aqui no código, mas que o projeto vai precisar antes de produção. Lista simples e direta. Aprofundamos cada item depois.

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
