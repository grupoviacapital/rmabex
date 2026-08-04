# Segurança (baseline)

> Segurança é **transversal** ao loop spec-driven, não uma etapa no fim. Esta nota é a linha de base do que fazemos **dentro** do projeto. O que fica fora (pentest, infra) vive em [[pendencias-externas]].

## Princípio

Cada spec considera segurança em `requirements` (requisitos), `design` (threat model + ADR quando relevante) e `verify` (auditoria). Dado financeiro exige cuidado extra: é sensível e, ao lidar com terceiros, cai sob LGPD.

## Baseline por camada

### Segredos
- Nunca no código. Vivem em `.env` (já no `.gitignore`); `.env.example` versionado sem valores.
- `settings.json` já nega leitura de `.env*` e `*.pem`.
- CI roda **gitleaks** (secret scanning) para barrar segredo commitado por engano.

### Validação e entrada
- **Zod valida toda fronteira externa** (form, params de rota, resposta de API). Ver [[convencoes-codigo]].
- Nunca confiar em input do cliente para valores monetários ou IDs; revalidar no servidor (Server Action).

### Banco e dados
- Prisma (queries parametrizadas) evita SQL injection por padrão; não montar SQL cru com string.
- Dinheiro em `Decimal` (também uma questão de integridade, não só de segurança).
- Backups e criptografia em repouso: responsabilidade de infra (ver [[pendencias-externas]]).

### Autenticação e autorização
- Hoje o painel é single-user (herdado do protótipo). **Quando** entrar multiusuário, vira uma spec própria: auth (sessão/JWT), autorização por recurso, rate limiting. Registrar via ADR.

### Dependências
- `npm audit` no CI; **Dependabot** (ou Renovate) para updates de segurança.
- Evitar dependências desnecessárias; preferir libs mantidas.

### Cabeçalhos e transporte
- Em produção: HTTPS obrigatório, headers de segurança (CSP, HSTS, X-Content-Type-Options). Config de deploy, complementada por infra.

## Gates de verificação (dentro do fluxo)

- **`/security-review`** (comando nativo do Claude Code): audita as mudanças pendentes por vulnerabilidades. Roda como parte do `/verify` e antes de abrir PR.
- **Agente `security-reviewer`**: lente adversarial só de segurança sobre a spec (complementa o `spec-reviewer`).
- **CI**: `npm audit` + `gitleaks` como jobs bloqueantes.

## Fora do escopo desta camada

Pentest profissional, segurança de infra (WAF/TLS/backups/hardening) e compliance formal de LGPD: ver [[pendencias-externas]]. Aprofundamos depois.
