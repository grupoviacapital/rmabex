# RMABEx - Vault (MOC)

> **Map of Content**: a "home" do conhecimento do projeto. Este vault é a **fonte de verdade** de domínio, specs e decisões. Todo código nasce de uma spec daqui.

Projeto RMA BEx

---

## Como navegar

| Pasta | O que vive aqui |
|-------|-----------------|
| `00-domain/` | Domínio: glossário, regras de negócio, modelo de dados, UI |
| `10-specs/` | Uma pasta por feature: `requirements -> design -> tasks` |
| `20-decisions/` | ADRs: decisões de arquitetura registradas |
| `90-meta/` | Como trabalhamos + convenções + qualidade + segurança |

## Domínio

- [[glossario]] - termos do domínio
- [[regras-negocio]] - as regras-chave (RN-x)
- [[modelo-dados]] - entidades e campos
- [[ui-referencia]] - design tokens e layout (preenchido por `/identidade`)

## Specs

- [[ROADMAP]] - decomposição em specs, por ordem de dependência

## Decisões

- [[adr-001-stack]] - stack escolhida
- [[adr-002-spec-driven-obsidian]] - Spec-Driven Development com Obsidian

## Meta

- [[como-trabalhamos]] - o loop e os papéis dos agentes
- [[convencoes-codigo]] - padrões de código
- [[qualidade-e-ci]] - testes, commits e CI
- [[seguranca]] - baseline de segurança
- [[pendencias-externas]] - o que fica fora do código

---

## O loop (resumo)

```
/spec <ideia>   -> requirements.md
/plan <spec>    -> design.md
/tasks <spec>   -> tasks.md
/implement      -> código + testes (commit por task)
/verify         -> checagem vs spec + segurança
```

Detalhes em [[como-trabalhamos]].
