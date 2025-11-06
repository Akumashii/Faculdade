no github do herysson tem disponível já os conteúdos da aula
github.com/Herysson

# Revisao
## modelo conceitual
a ideia principal do banco de dados relacional é eliminar redundancia, ou pelo menos assumir uma redundancia controlada

possui um nivel de abstração maior pois não representa a quantidade de entidades 

Diagrama Entidade Relacionamento Conceitual 
representação geralmente por retângulos

a RELAÇÃO em banco de dados são as TABELAS. 
Relação = Tabela, pelo menos na bibliografia

Uma vez que eu conecto duas entidades preciso pensar sobre a CARDINALIDADE
Cardinalidade nos diz o número de instâncias de uma entidade que podem se relacionar com instâncias de outra entidade dentro de um banco de dados relacional
- Tipos
  - 1 .. 1
  - 1 .. N
  - N .. N

 - Atributos
   - identificador ou chave primária
     - único e não nulo (UNIQUE NOT NULL)
   - simples (atômico)
     - não pode ser divido em partes menores. ex. cor dos olhos, idade.  
   - composto
     - formado por vários atributos. ex. endereço (pode ser dividido em rua, número, bairro, cidade, etc.)
   - multivalorado
     - atributo que pode assumir vários valores, todos associados a esta entidade. ex. telefone (uma pessoa pode ter vários números)

