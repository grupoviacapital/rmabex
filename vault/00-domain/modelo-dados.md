# Modelo de Dados - RMABEx

> Entidades do domínio. Esta nota é a **base do schema** (Prisma/ORM). O `design.md` de cada spec referencia entidades daqui por `[[modelo-dados#Entidade]]`. Nomes de domínio em PT-BR; nomes de código em inglês.

## Visão geral

```
(diagrama simples das entidades e relações, ex.: A 1-* B)
```

## Entidade (exemplo)

| Domínio | Código | Tipo | Notas |
|---------|--------|------|-------|
| identificador | `id` | string/int | chave primária |
| ... | ... | ... | ... |

*(Substitua pelas entidades reais. Valores monetários, se houver, em tipo decimal, nunca float.)*
