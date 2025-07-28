# Prefácio (introdução)
objetivo do livro é apresentar **SGBD relacional**, além de um conjunto de conhecimento sobre BD. 
o projeto de BD ocorre em três etapas: modelagem conceitual, projeto lógico e projeto físico. O livro cobre a duas primeiras etapas, a da **modelagem conceitual e projeto lógico.**
Na modelagem a abordagem utilizada é **entidade-relacionamento (ER)** de peter chen, além de regras e heurísticas para construção de modelos.
No projeto lógico o livro cobre a **transformação de modelos ER em modelos relacionais** quanto a **engenheria reversa de BD** (tirar o modelo conceitual do projeto lógico)

# Capítulo 1
São apresentados conceitos como banco de dados, sistema de gerência de banco de dados e modelo de dados.

Há duas formas de redundância de dados, a controlada e a não controlada:
- Controlada:
	o software sabe da presença de múltiplas representações da informação e garente a sincronia entre as diversas representações. Do ponto de visto externo é como se houvesse uma única representação da informação.
	utilizada para melhorar a performace global do sistema, como por exemplo uma mesma informação estar armazenada em diversos computadores para o rápido acesso a ela. 
- Não Controlada:
	ocorre quando o usuário manualmente deve sincronizar as representações. 
	NADA ACONSELHAVEL de se usar pois além de desnecessária o trabalho manual é mais sucetível a erros de transcrição de dados. Erros de sincronização ou transcrição gera inconsistência dos dados.

para evitar redundância de informações é idela que haja **compartilhamento de dados**. A informação é armazenada uma ÚNICA vez e COMPARTILHADA para os vários sistemas. 
![[Pasted image 20250310002620.png]]

o compartilhamento de dados é mais complexo do que cada sistema ter seus armazenamento isolado, refletindo assim na estrutura do software, agora ele terá que atender a necessidade dos diferentes sistemas. Assim surge o Sistema de Gerenciamento de Banco de Dados (SGBD)

SGBD (Sistema de Gerenciamento de Banco de Dados):
- software que tem como função DEFINIR, RECUPERAR e ALTERAR dados em um banco de dados.

Modelo de Banco de Dados:
descrição da estrutura de um banco de dados, usa-se uma linguagem de modelagem de dados, é classificado conforme a forma de apresentar os modelos, em linguagens textuais ou gráficas. A descrição possui vários níveis de abstração quanto a descrição, por exemplo, a linguagem não é a mesma para um técnico e para um usuário. Normalmente é considerado dois tipos de descrições: **modelo conceitual** e **modelo lógico**.

pag16.