# Camada 1 - Cadastro do processo

> Etapa E1 do [[fluxo-v8]] mais a aba "Cadastros" da planilha. Apresentada em 2026-10-07, **ainda não discutida**. Voltar ao [[index]].

## O que o desenho diz

1. Técnico cadastra a recuperanda, depois o contador com CRC, depois o nº do processo.
2. A IA consulta o nº nos TJs: se acha, cadastra a(s) recuperanda(s); se não, cadastro manual.
3. Técnico confere, marca **produtor rural** (S/N) e edita se algo estiver errado.
4. Comunica a recuperanda (segue para a camada 2).

Aba "Cadastros" (Cadastro Recuperanda): nome da recuperanda, nº do processo, CNPJs, "Seguimento" (segmento).

## Pontos a discutir

- **Ordem estranha**: a recuperanda é cadastrada antes do nº e de novo depois da consulta ao TJ. Proposta: o **processo** é a entidade principal (1 processo, N recuperandas, cada uma com N CNPJs). Liga com D-13.
- **Campos faltando** que as camadas seguintes exigem: **data do ajuizamento** (E8 "endividamento após o ajuizamento"), vara e comarca, mês de referência ou periodicidade do RMA (D-12).
- **Lista do Técnico** (checklist que a E2 usa): a raia chama "Cadastro e Check list", então nasce aqui. Lista padrão por tipo (normal ou produtor rural) ajustável por processo?
- **Consulta aos TJs (D-16)**: maior risco de custo. Até onde sabemos, a API pública do CNJ (DataJud) não traz as partes; achar as recuperandas pelo nº pede serviço pago ou integração por tribunal (confirmar). Proposta: valor fechado com cadastro manual e validação do número CNJ (o dígito verificador identifica o tribunal); busca automática como opcional.
- **Contador**: um por recuperanda ou por processo? Login? (ver P5 em [[0-plataforma]])
- **Produtor rural**: marcação do processo ou de cada recuperanda? Pode misturar?
- **"Comunica a recuperanda"**: e-mail com convite e criação de login? Acesso por recuperanda ou por processo? (ver 0.4)
