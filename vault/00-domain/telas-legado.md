# Telas de Referência

> Fonte: `OLD_RMA/escopo/Telas/` - 19 capturas, numeradas de 1 a 20 (falta a 4). São telas de **proposta de interface**, com dados fictícios (Alpha Comércio, Beta Indústria, Débora Raposo). Marca **Brasil Expert** aplicada.
>
> Não confundir com [[ui-referencia]], que é preenchida pelo `/identidade` e trata de tokens visuais. Aqui está o inventário funcional: o que cada tela faz e que regras ela revela.

## O achado principal: modelo de consolidação

A tela de Cadastro de Recuperanda (`19.png`) responde a pergunta de grupo econômico com uma escolha explícita no cadastro:

- **Consolidação Processual (vários CNPJ)** - "cadastro de múltiplas recuperandas (filiais ou empresas do grupo). Cada empresa possui seu próprio CNPJ e será gerenciada individualmente."
- **Consolidação Substancial (um único CNPJ)** - "agrupa todas as recuperandas em um único CNPJ. Todas as empresas serão tratadas como uma única entidade para fins de relatórios e acompanhamento."

São os dois institutos da recuperação judicial, e determinam se o RMA é um por empresa ou um pelo grupo. Isso muda [[modelo-dados]] na raiz e precisa virar `RN`.

A mesma tela traz hierarquia **matriz e filial**: a lista mostra "Alpha Comércio Ltda. [Matriz]", "Filial RJ", "Filial SP", "Filial MG", com campo `Tipo de empresa`.

## Inventário

| Tela | O que é | O que revela |
|---|---|---|
| 1 | Login | Marca Brasil Expert. Cita Lei 11.101/05 e LGPD. |
| 2 | Home | Menu: Home, Dashboard, RMAs, Auditoria, Comunicação, Relatórios, Clientes, Avisos, Cadastros, Configurações. Resumo: RMAs em andamento, pendências, RMAs finalizados, documentos recebidos, clientes ativos, avisos não lidos. |
| 3 | Cadastro de Administrador Judicial | **Upload de logotipo** (PNG, JPG ou SVG, até 2 MB) que "será exibido nos relatórios e comunicações". Site, razão social, CNPJ, responsável, contato. Indica multi-tenant por AJ. |
| 5, 19 | Cadastro de Recuperanda | Modelo de consolidação, matriz/filial, razão social, CNPJ, nome fantasia, endereço completo, número do processo, responsável, contato. |
| 6 | Cadastro de Usuário | **Seis perfis**: Administrador, Coordenador, Colaborador, Administrador Judicial, Recuperanda, Magistrado. |
| 7 | Lista de Recuperandas | Colunas: recuperanda, processo, AJ, período de referência, status do RMA, **% de andamento**. Ações: Elaborar, Continuar, Visualizar. |
| 8 | Recuperanda - visão geral | Prazo de entrega com contagem regressiva. **Progresso por seção**, em 6 blocos. Tarefas pendentes com atraso. |
| 9, 11 | RMA - Documentos | Painel de leitura por IA: lidos, não lidos, recebidos, pendentes, em atraso. Tabela por tipo com **data limite** por tipo. |
| 10 | Informações do RMA | Dados do processo (número, **vara**, **comarca**, AJ e contato). **Responsáveis**: colaborador responsável e revisor. Data limite, progresso, observações do período. |
| 12 | Tarefas | Categoria (análise documental, relatórios, análise financeira, comunicação, processual), prioridade alta/média/baixa, responsável, prazo, status. |
| 13 | Resumo | Gráficos de status por IA, pendências, evolução mensal de documentos. |
| 14, 15 | Comunicação | Solicitações com **origem AJ -> RJ ou RJ -> AJ**, tipo arquivo ou mensagem, prazo de resposta. Linha do tempo com **lembrete enviado automaticamente**. Lista de arquivos solicitados e anexos. |
| 16 | Notas | Tipo interna ou compartilhada, visibilidade, fixadas, lixeira. |
| 17 | Históricos | Trilha de auditoria por evento: status alterado, documento enviado, responsável atribuído, mensagem enviada. |
| 18 | Dashboard da equipe | Desempenho por colaborador, taxa de conclusão, tarefas por tipo, **tarefas sem responsável**. |
| 20 | RMAs | Ações **Protocolar** e **Retornar para colaborador editar e protocolar**. Numeração `RMA-2024-000587`. |

## Divergências que viram pergunta

1. **Taxonomia de documentos reduzida.** As telas usam **7 tipos** - demonstrações contábeis, extratos bancários, relatório de atividades, folha de pagamento, comprovantes de recolhimentos, contratos, outros - e não as 61 pastas de [[pastas-documentos]]. É agrupamento de visualização ou substituição da taxonomia?

2. **Duas listas de status do RMA nas próprias telas.** A lista de recuperandas mostra `Em elaboração`, `Em andamento`, `Aguardando dados`, `Concluído`. A tela de RMAs mostra `Protocolado`, `Em análise`, `Aguardando peças`, `Finalizado`, `Aguardando retorno`, `Cancelado`. Nenhuma das duas bate com o fluxo de [[fluxo-processo]], que fala em `Revisar` e `Aprovado`.

3. **Seis seções, não dezoito.** A visão geral mostra o progresso em 6 blocos - informações gerais, resumo das atividades, informações financeiras, créditos, informações complementares, conclusão - enquanto o RMA real tem 18 seções ([[anatomia-rma]]). É agrupamento de progresso ou outra estrutura?

4. **Seis perfis de acesso**, contra os quatro papéis modelados hoje. Falta `Administrador` e `Magistrado` em [[modelo-dados]].

## Funcionalidades que nenhuma nota cobria

- **Tarefas** com categoria, prioridade, responsável e prazo, e painel de equipe.
- **Notas** internas e compartilhadas por RMA.
- **Comunicação** formal bidirecional com prazo de resposta e lembrete automático.
- **Trilha de auditoria** por evento, visível ao usuário.
- **Multi-tenant por administrador judicial**, com logo aplicado nos relatórios.
- **Perfil Magistrado**, de consulta e acompanhamento processual.

## Links

- Tokens visuais: [[ui-referencia]]
- Fluxo do processo: [[fluxo-processo]]
- Perguntas: [[perguntas-cliente]]
