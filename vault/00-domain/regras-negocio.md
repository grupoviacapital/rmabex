# Regras de Negócio - RMABEx

> Fonte de verdade das regras. Toda spec que toca uma regra referencia esta nota por `[[regras-negocio#RN-x]]`. Termos em [[glossario]], entidades em [[modelo-dados]].

## Formato

Cada regra é numerada `RN-x` e escrita em **EARS** (testável, sem ambiguidade):

- Ubíquo: "O SISTEMA DEVE ..."
- Evento: "QUANDO <gatilho>, O SISTEMA DEVE ..."
- Estado: "ENQUANTO <estado>, O SISTEMA DEVE ..."
- Condicional: "SE <condição>, ENTÃO O SISTEMA DEVE ..."

## Regras

### RN-1 · <título>

QUANDO <gatilho>, O SISTEMA DEVE <comportamento>.

*(Substitua pelos requisitos reais do domínio. Cada RN-x tocada por uma spec deve ter ao menos um teste que a nomeia.)*
