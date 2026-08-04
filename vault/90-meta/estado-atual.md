# Estado Atual - ponto de retomada

> **Leia esta nota primeiro ao abrir uma sessão nova.** Ela resume onde o projeto está, o que já foi decidido, o que está travado e em quem. Atualize-a ao fim de cada bloco de trabalho.
>
> Última atualização: 04/08/2026.

## Onde estamos

**Nenhuma linha de código foi escrita. Nenhuma spec foi aberta.** Por determinação do usuário, nada de spec até as perguntas ao cliente serem respondidas.

O que foi feito até aqui:

1. O material legado foi indexado, e o escopo foi **lido integralmente**, arquivo por arquivo, incluindo shapes de Excel, comentários de Word, macros VBA e as capturas de tela em resolução nativa.
2. Os três repositórios do sistema anterior foram minerados.
3. O domínio foi documentado em 11 notas.
4. As perguntas ao cliente foram consolidadas, filtradas e a primeira rodada começou a ser enviada.

## Decisões do cliente, com data

| Data | Decisão | Quem | Onde está registrada |
|---|---|---|---|
| 04/08/2026 | As fórmulas de EBITDA, liquidez, CMV e resultado são as da planilha padrão | Gisele, coordenadora técnica | [[regras-negocio#RN-41]] |
| 04/08/2026 | **Kanitz sai de escopo.** O código do repositório KANTIZ veio de outro projeto e deve ser desconsiderado | Luiz | [[sistema-legado]] |
| 04/08/2026 | A planilha que temos é de teste; existe uma mais atual, **ainda não enviada** | Luiz | [[formatos-balancete]] |
| 04/08/2026 | O insumo é o **balancete**, e ele chega em PDF, Excel e outros formatos | Luiz | [[formatos-balancete]] |
| 04/08/2026 | O balancete é o **eixo da referência cruzada** dos demais documentos da pasta | Luiz | [[regras-negocio#RN-12]] |
| 04/08/2026 | **Começar pela GERATHERM** | Luiz | [[formatos-balancete]] |
| 04/08/2026 | A estrutura de pastas **será criada na plataforma**; o OneDrive é temporário | Luiz | [[formatos-balancete]] |
| 04/08/2026 | **Não há requisito de migração**: a base do sistema anterior pode ser descartada | Luiz | [[formatos-balancete]] |

## Pendente com o cliente

**Enviado, aguardando resposta:** pergunta sobre a versão da planilha (`01.BASE RELATÓRIO_xi teste.XLSM` é a mais atual, já que a documentação do KANTIZ cita uma `2-2`). O Luiz respondeu que usaremos uma mais atual, mas **não enviou o arquivo**.

**A enviar:** os três blocos de [[perguntas-cliente]]. O bloco 1 está **em espera** até chegar a planilha nova, porque os defeitos podem já estar corrigidos nela.

**Consequência prática:** a análise do motor de cálculo em [[motor-calculo]] foi feita sobre uma cópia de teste. Quando a versão nova chegar, **refazer a análise antes de usar aquela nota como base de spec**.

## O que está travado, e em quem

| Spec | Situação |
|---|---|
| 001 Scaffold, 002 Cadastro, 003 Taxonomia, 005 Balancete | Sem bloqueio técnico. **Travadas por decisão do usuário**, não por falta de informação. |
| 004 Check list | Depende de "quais pastas são obrigatórias" |
| 006 Conciliação | Depende da tolerância de conferência |
| 007 Alertas | Depende do limiar de variação |

## Mapa das notas

| Preciso saber sobre | Leia |
|---|---|
| Que arquivo do escopo contém o quê | [[fontes-escopo]] |
| As 61 categorias de documento e a regra de cada uma | [[pastas-documentos]] |
| De qual pasta sai cada seção do relatório | [[mapa-secao-pasta]] |
| Como o relatório é calculado, e a coluna "Ref 1" | [[motor-calculo]] |
| Os quatro layouts de balancete | [[formatos-balancete]] |
| A estrutura das 18 seções do RMA | [[anatomia-rma]] |
| O processo, manual e automatizado | [[fluxo-processo]] e [[fluxos-area-tecnica]] |
| O que o sistema anterior fez, e onde falhou | [[sistema-legado]] |
| O que as telas revelam | [[telas-legado]] |
| As regras numeradas | [[regras-negocio]] |
| As entidades | [[modelo-dados]] |
| O que falta perguntar | [[perguntas-cliente]] |

Material de referência não versionado fica em `OLD_RMA/`. Os fluxogramas renderizados estão em `OLD_RMA/escopo/fluxogramas/`, e os gráficos do RMA em `OLD_RMA/escopo/graficos-rma/`.

Página HTML com as fórmulas, compartilhável com o cliente: `vault/90-meta/formulas-sistema-anterior.html`, publicada em https://claude.ai/code/artifact/d5a7e9d3-210d-4d0e-87cc-9b1ee1e3e658

## Erros já cometidos, para não repetir

Registrados porque uma sessão nova pode refazer o mesmo caminho.

1. **Classifiquei arquivos pelo nome sem abrir.** O `01.BASE RELATÓRIO` foi marcado como "apoio" quando é o motor de cálculo. As fórmulas que eu ia perguntar ao cliente estavam dentro dele.
2. **Li o rótulo em vez da fórmula.** A linha "Ativo Não Circulante" da aba `INDICE` na verdade desconta investimentos, imobilizado e intangível: é o realizável a longo prazo.
3. **Resumi material em vez de ler.** Montei as telas em grade reduzida e perdi texto; a leitura em resolução nativa achou 24 inconsistências.
4. **Generalizei de uma amostra.** Registrei a estrutura do balancete da XPT como se fosse regra de domínio. Existem quatro layouts diferentes.
5. **Tratei documentação do KANTIZ como autoridade.** O cliente depois informou que aquele repositório é de outro produto.

O padrão é o mesmo nos cinco: **trocar o material real por um resumo dele**. Em escopo, ler o conteúdo antes de decidir o que ele é.

## Próximo passo

Aguardar a análise do [[perguntas-cliente]] pelo usuário e o envio dos blocos. Nada de spec até lá.
