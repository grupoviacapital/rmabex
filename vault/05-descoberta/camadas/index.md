# Camadas do escopo

> O fluxo v8 separado em camadas, tratadas em sequência com o Saulo. Cada camada fecha **telas, dados, o que decidimos nós e o que vai para a reunião**. A proposta comercial sai da soma das camadas. Divisão aprovada em 2026-10-07.

| # | Camada | Etapas ([[../etapas-rma\|etapas do RMA]], que substitui o v8 de E2 em diante) | Orçamento | Status |
| --- | --- | --- | --- | --- |
| 0 | [[0-plataforma\|Plataforma e acesso]] (login, perfis, quem vê o quê) | fora do desenho | fechado | **Fechada** em 2026-10-08; pendente do cliente: D-37 (prazos) |
| 1 | [[1-cadastro\|Cadastro do processo]] | E1 do v8 + aba "Cadastros" | fechado | **Em andamento**: falta só o checklist (Apenso I) |
| 2 | Envio e conferência de documentos (Apenso I) | 1 a 3 | fechado | A tratar |
| 3 | Motor de verificação (operacional, trabalhista, contábil, conciliações, passivo, caixa, DRE) e pendências (Apenso II) | 4 a 18, 25 a 27 | faixa | A tratar |
| 4 | Indicadores e rural (safra, colheita, comercialização, garantias) | 19 a 23 | faixa | A tratar |
| 5 | Geração do RMA e do Parecer (minuta, conclusão, gráficos, layout) | 28, 29 e o Parecer do v8 | faixa | A tratar |
| 6 | Revisão, aprovação e registro do protocolo (o protocolo em si é externo) | 30 a 32 + revisão do Parecer | fechado | A tratar |
| opc. | Diligência: **camada própria de perguntas**, por ser muito flexível e dinâmica | 24 | à parte | A tratar |
| extra | Consulta ao processo no cadastro (scraper TJ + DJEN + DataJud, autocompleta o cadastro) | cadastro | **fora da proposta**: orçado quando chegarmos lá | Medir antes |
| extra | Protocolo automático no TJ | 32 | **fora da proposta**: orçado quando chegarmos lá | Medir antes |

"Fechado" e "faixa" seguem a decisão 1 do [[briefing]].

## Onde paramos (2026-10-07)

Na camada 0, item **0.1 Perfis**: a proposta está em [[0-plataforma]] e as perguntas P1 a P6 viraram D-21 a D-26 em [[duvidas]]. O Saulo vai levar essas perguntas ao cliente. Próximo passo: registrar as respostas e seguir para o **0.2 Quem vê o quê**.

## Atualização (2026-10-08)

O cliente mandou a lista fechada de perfis: Administrador, Coordenação, Técnico, Administrador Judicial, Recuperanda e Magistrado (o cliente escreveu "Colaborador"; é o Técnico, e o nome usado é sempre Técnico). Fecha D-25, D-26 e D-27 e abre D-28 a D-30 (papel do AJ, do Magistrado e se é multiempresa). Próximo passo: **0.2 Quem vê o quê**, já com os 6 perfis.

Ainda em 2026-10-08: o Saulo descreveu o papel de cada perfil (fecha D-22, D-23, D-28). Montamos a matriz do **0.2** e abrimos dois itens novos: **0.12 Esteira do processo** e **0.13 Painéis**. Treinar a IA fica em **standby para o final**. Próximo passo: validar a matriz e seguir para os itens 0.3 a 0.11.

Fechando 2026-10-08: itens **0.3 a 0.13 decididos** (2FA por e-mail para todos, cadastro em cascata, Brevo do sgcbex com desvio para o Saulo, AWS em VM da BEx, homologação local, identidade do sgcbex). **Camada 0 fechada.** Próximo passo: **camada 1, Cadastro do processo** (já apresentada, ver [[1-cadastro]]).

Ainda em 2026-10-08: chegou a planilha [[../etapas-rma|etapas do RMA]] (32 etapas). Vários CNPJs e consolidação respondidos (D-13); TJ só no cadastro (D-16 parcial). A planilha diverge em 3 pontos do que decidimos (E-1 a E-5 em [[../duvidas|dúvidas]]).

Respostas E-1 a E-5 (2026-10-08): a planilha **substitui** o v8 de E2 em diante (a tabela acima já usa as etapas dela); a etapa 32 vira um **botão "registrar protocolo"**; a diligência ganha **camada própria**; o **protocolo automático** vira **extra da v1**, fora da proposta, orçado quando chegarmos lá (o técnico provavelmente precisa estar logado no portal do TJ, então tem de ser medido antes).

Revisão do RMA (2026-10-08): **técnico → coordenação → AJ**; ajuste pedido pelo AJ volta ao técnico e **passa de novo pela coordenação**; histórico das conversas e versão do documento a cada rodada. **Camada 0 fechada; próximo passo: camada 1.**

## Onde paramos (2026-10-08)

Camada 0 fechada (falta do cliente só a D-37, prazos). Na **camada 1**, tudo decidido menos o **checklist (Apenso I)**. Proposta: dois modelos padrão (normal e rural, aplicados conforme a marcação de cada recuperanda), ajustáveis pela coordenação em cada processo. **O cliente vai mandar os tipos de documentos e um exemplo de cada um.** Próximo passo: registrar a lista recebida (fonte em `scripts/`, leitura no vault), fechar o checklist e a camada 1, e seguir para a camada 2.
