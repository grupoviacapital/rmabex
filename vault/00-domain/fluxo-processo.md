# Fluxo do Processo RMA

> Fonte: `OLD_RMA/escopo/Fluxo Processo RMA IA_v3.xlsx`, aba `Fluxo RMA` (o fluxograma vive em shapes, não em células) e `retorno_da_plataforma.txt`. Ver [[fontes-escopo]].

O fluxo tem quatro raias: **Técnico (cadastro e check list)**, **IA (recebe, confere e trata)**, **IA (validando)** e **Técnico (validando)**, terminando em revisão, aprovação e protocolo.

## Passo 1 - Técnico: cadastro e check list

1. Técnico efetua o check list no OneDrive e cadastra a recuperanda no Portal RMA.
   Cadastro mínimo (aba `Cadastros`): nome da recuperanda, número do processo, CNPJs, segmento.
2. Clica em **Efetuar Check List Documentação**.
3. O sistema compara o que existe nas pastas contra a planilha de controle e **gera a relação dos documentos faltantes**.
4. Se falta documento: envia e-mail à recuperanda solicitando a documentação e e-mail ao técnico responsável com a relação. Ao receber o retorno de que a documentação está disponível, o técnico repete o check list.

## Passo 2 - IA: recebe, confere e trata

1. Insere a planilha de **Balancete**.
2. Executa a **Análise Técnica do Balancete** e apresenta as divergências encontradas.
3. Efetua a **leitura dos comprovantes** e compara comprovantes contra as principais contas (as conciliações de [[pastas-documentos]]).
4. Gera a relação dos comprovantes e envia e-mail ao técnico responsável.
5. Insere as informações na planilha base das principais contas.
6. Insere o balancete no **planilhão técnico**, atualiza o mês atual, gera os gráficos e insere os gráficos no RMA.
7. Seleciona o segmento do relatório e gera o relatório.

### Regra de alerta de variação

Sempre que a análise identificar variação relevante numa conta do balancete em relação ao mês anterior - **referência de 15% a 20%** - o sistema deve gerar **alerta de atenção** para o analista. O alerta direciona a conferência e, se necessário, subsidia a inclusão de pedido de esclarecimento à recuperanda.

O percentual exato e se ele é configurável por conta ou por cliente ainda **não está definido**: ver [[pendencias-externas]].

## Passo 3 - Validação

**IA validando:** recebe o relatório, gera a relação das divergências, e o técnico seleciona quais divergências são relevantes.

**Técnico validando:** confirma se a visualização dos documentos está OK; se existem divergências relevantes, envia e-mail à recuperanda pedindo documentação e reinicia o check list. Sem divergências, o processo segue. Informações que a IA não conseguiu preencher são inseridas manualmente.

## Passo 4 - Revisão, aprovação e protocolo

1. Gera o RMA; status na plataforma vai para **Revisar** e o revisor recebe e-mail.
2. Revisor revisa. Se precisa de modificação, efetua as alterações e salva; senão, confirma OK.
3. Status vai para **Aprovado**; envia e-mail para coordenação e técnico responsável.
4. Clica em **Protocolar**: protocola, insere no diretório "Documento Protocolado" e envia e-mail comunicando o protocolo.

## Estados observáveis

O fluxo cita explicitamente os status **Revisar** e **Aprovado**, e ações de botão: `Efetuar Check List Documentação`, `Atualizar Informações`, `Salvar`, `Protocolar`. A máquina de estados completa do RMA ainda precisa ser fechada numa spec.

## Observações de projeto

- O processo é fortemente orientado a e-mail (recuperanda, técnico, coordenação). Notificação não é acessório, é parte do fluxo.
- O check list é reexecutável em ciclo até a documentação ficar completa: precisa ser idempotente e manter histórico das rodadas.
- "Planilhão técnico" e "planilha base das principais contas" são artefatos legados de Excel. Decidir por ADR se o novo sistema os substitui por modelo de dados ou os mantém como formato de exportação.

## Links

- Pastas e regras de conciliação: [[pastas-documentos]]
- Estrutura do relatório gerado: [[anatomia-rma]]
