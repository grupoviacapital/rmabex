# Conceitos (explicado simples)

Guia rápido dos termos deste projeto, com analogias. Leitura leve. Detalhes técnicos ficam no `vault/`.

---

## Harness

**O que é:** o "ambiente de trabalho" do Claude Code: as regras, ferramentas e configs que guiam como a IA age no projeto.

**Analogia:** a bancada organizada de um marceneiro. O profissional é o mesmo; a bancada boa faz ele render mais.

**Aqui:** a pasta `.claude/` + o `CLAUDE.md`. Eles já dizem à IA onde vive a verdade do projeto (o `vault/`).

---

## Agent (agente / subagente)

**O que é:** um assistente especialista que faz uma tarefa focada, com contexto separado, e devolve só o resultado.

**Analogia:** numa cozinha, o chef manda o confeiteiro cuidar da sobremesa. Cada um pensa só na sua parte.

**Por que importa:** cada agente carrega só o necessário. Menos tokens, mais precisão.

**Aqui:** `spec-writer` (requisitos), `spec-designer` (design), `task-planner` (tarefas), `implementer` (código), `spec-reviewer` (auditoria), `security-reviewer` (segurança), `brand-designer` (identidade).

---

## Skill

**O que é:** um procedimento pronto que a IA carrega só quando precisa.

**Analogia:** uma receita na gaveta. Você pega a certa na hora de cozinhar aquele prato.

**Aqui:** `create-spec`, `implement-spec`, `verify-spec`, `generate-identity`.

---

## Loop

**O que é:** repetir um ciclo curto até chegar no resultado, em vez de uma tacada só.

**Analogia:** lixar madeira: passa, checa, passa de novo.

**Aqui:** o `implementer` faz TDD em cada tarefa: teste que falha (Red) -> código que passa (Green) -> limpeza (Refactor) -> próxima.

---

## Spec-Driven Development

**O que é:** desenvolvimento guiado por especificação. Ninguém codifica sem uma spec aprovada.

**Analogia:** construir uma casa: ninguém assenta tijolo sem a planta aprovada.

**Os 3 documentos de cada feature (em `vault/10-specs/`):**
- `requirements.md` - o quê e por quê (as regras, claras).
- `design.md` - como (dados, contratos, componentes).
- `tasks.md` - a lista de tarefas pequenas.

**O ciclo:**
```
/spec <ideia>   ->  requirements.md
/plan <spec>    ->  design.md
/tasks <spec>   ->  tasks.md
/implement      ->  código + testes (commit por task)
/verify         ->  conferência vs spec + segurança
```
Entre cada etapa, **você aprova**.

---

## Juntando tudo

```
Ideia
  -> /spec       (spec-writer escreve requisitos)      [aprovar]
  -> /plan       (spec-designer desenha)               [aprovar]
  -> /tasks      (task-planner lista tarefas)          [aprovar]
  -> /implement  (implementer coda, TDD, commit)
  -> /verify     (spec-reviewer + segurança)
  -> push / merge (você revisa)
```

- **Harness** = o cenário (.claude/ + CLAUDE.md).
- **Agents** = especialistas com contexto isolado (economia de token).
- **Skills** = as receitas que os comandos usam.
- **Loop** = o vai e volta do TDD.

Processo: `vault/90-meta/como-trabalhamos.md`. Regras de código: `vault/90-meta/convencoes-codigo.md`.
