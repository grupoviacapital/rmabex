# Rascunho do escopo - do zero

> Documento de trabalho. Aqui a gente rabisca, pergunta e vai fechando o entendimento.
> Nada aqui é definitivo, e **nada aqui vem do escopo antigo**.
>
> Ordem do trabalho: **este rascunho -> fluxograma e análise de requisitos -> specs -> código.**

## Regras desta rodada

- Partimos do zero. O material anterior foi movido para `vault/99-descartado/` e **não serve nem de consulta**.
- Uma afirmação só entra aqui depois que você confirmar. Se eu deduzi alguma coisa, marco com `(suposição)`.
- Toda dúvida vira um item `D-x`. Quando você responder, a resposta sobe para a seção certa e a dúvida sai da lista.
- Domínio em PT-BR, sem travessão.

## Status

**Vazio.** Nada confirmado ainda.

---

## 1. O produto em uma frase

_(a preencher)_

## 2. Quem usa

| Papel | O que faz no sistema |
|---|---|
|  |  |

## 3. O ciclo, do começo ao fim

_(a preencher: os passos em ordem, com quem executa cada um)_

1.
2.
3.

## 4. Entradas

O que entra no sistema, de onde vem, em que formato.

| Entrada | Origem | Formato | Quem envia |
|---|---|---|---|
|  |  |  |  |

## 5. Saídas

O que o sistema produz.

| Saída | Para quem | Formato |
|---|---|---|
|  |  |  |

## 6. Regras

Numeradas conforme aparecerem. Viram `RN-x` no vault só quando estiverem fechadas.

-

## 7. Fora de escopo

O que decidimos explicitamente **não** fazer.

-

---

## Dúvidas abertas

Começo pelas estruturais. Sem elas, qualquer requisito que eu escrever é chute.

### Sobre o produto

- **D-1** - Que problema o sistema resolve, na sua frase, sem jargão? Se ele funcionar perfeitamente, o que deixa de ser feito à mão?
- **D-2** - Quem são os usuários, e quantos são?
- **D-3** - Hoje existe um processo manual (ou um sistema) fazendo esse trabalho? Ele continua existindo depois que o nosso entrar?

### Sobre o ciclo

- **D-4** - Qual é o gatilho que inicia o ciclo, e qual é o evento que o encerra?
- **D-5** - O ciclo é recorrente (mensal, por demanda) e tem prazo?
- **D-6** - Em que pontos uma pessoa precisa decidir algo? São exatamente os pontos onde o sistema não pode ser automático.

### Sobre os dados

- **D-7** - Quais documentos ou arquivos o sistema recebe, e quem os produz?
- **D-8** - Que dado precisa ser tirado de cada um deles?
- **D-9** - Onde esses arquivos ficam hoje? O sistema passa a guardá-los ou só lê de onde já estão?

### Sobre a saída

- **D-10** - Qual é o entregável final, e em que formato ele precisa sair?
- **D-11** - Alguém aprova antes de o entregável sair? Quem, e em quantas etapas?
- **D-12** - Existe um exemplo real de entregável pronto e correto, que a gente possa usar como alvo?

### Sobre o reinício

- **D-13** - O que exatamente estava errado no escopo anterior: o **conteúdo** (a informação era falsa) ou a **forma** (estava mal escrito e mal organizado)? Isso muda muito o que pode ser reaproveitado depois.
- **D-14** - As telas e os fluxogramas que existiam também estão descartados, ou algum ainda representa a intenção?
- **D-15** - De onde vem a informação correta desta vez: de você, de material novo do cliente, ou dos dois?

---

## Log

| Data | O que mudou |
|---|---|
| 05/08/2026 | Reinício do zero. Escopo anterior descartado, `OLD_RMA/` apagado. |
