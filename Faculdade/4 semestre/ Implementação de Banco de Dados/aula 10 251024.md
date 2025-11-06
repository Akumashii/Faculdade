# Integridade de Dados

manutenção e farantia da consistência e precisão dos dados, sendo um aspecto crítico no design, 
implementação e uso de sistemas de armazenamento de dados. 
A integridade é atingida por meio da aplicação de restrições de integridade

## Restrições de Integridade

As restrições de integridade dos dados podem ser construídas no SGBD de duas formas:
- Declarativa
- Procedural

##### Declarativa

Na forma declarativa, as restrições de integridade são parametrizadas durante a criação das estruturas das tabelas,
utilizando a linguagem SQL, na categoria DDL (Data Definition Language), fazendo uso de chaves primárias, 
impedindo valores não nulos, utilizando tipos e domínios de dados e aplicando regras de integridade referencial.

##### Procedural

Na forma procedural (também chamadas de restrições semânticas), é possível fazer uso de recursos 
como Triggers, Stored Procedures, bem como de Assertion. 
Geralmente a forma procedural é implementada por programadores ou analistas especializados na linguagem e no SGBD, 
com auxílio das regras de negócio passadas pelos clientes

### Tipos de  de Restrições de Integridade

As cinco principais restrições são:
- Integridade de Domínio
- Integridade Referencial
- Integridade de Vazio
- Integridade de Chave
- Integridade Definida pelo Usuário

## Integridade de Domínio

As restrições de domínio especificam que, dentro de cada tupla, o valor 
de cada atributo Y deve ser um valor indivisível do domínio dom(Y), ou seja, 
se um atributo tiver que receber valores dentro de um intervalo 
pré-estabelecido para um domínio, ele só receberá valores dentro deste 
intervalo, caso contrário uma mensagem de erro aparecerá para o usuário 
para que ele possa ajustar os dados antes da entrada no banco de dados

Valores inseridos em uma coluna deem sempre obedecer à definição dos valores que são permitidos para essa coluna,
assim, os valores do domínio.

### Fatores

- Tipo de Dado do campo
- Representação interna do tipo de dado
- Presença ou não do dado
- Intervalos de valores no domínio
- Conjunto de valores discretos

## Integridade Referencial

A restrição de Integridade Referencial assegura que valores de uma 
coluna em um tabela são válidos baseados nos valores em uma outra tabela 
relacionada (referência)

Exemplo: Se um produto de ID 435 foi cadastrado em um tabela de Vendas, 
então um produto com o ID 435 deve existir na tabela de Produtos 
relacionada.

### Atualização e Exclusão

Se um registro for excluído em uma tabela, 
então os registro relacionados em outras tabelas que o referenciam talvez precisem ser excluídos.
Caso contrário ocorrerá erro. O mesmo se dá com atualização de registros

CASCADE: Se um registro for excluído em uma tabela (operações DELETE e TRUNCATE), 
então os registros relacionados em outras tabelas que o referenciam talvez precisem ser excluídos. 
Caso contrário ocorrerá erro. O mesmo se dá com a atualização de registros (operação UPDATE).
- on delete cascade
- on update cascade

## Integridade de Vazio

Valores Nulos (NULL), um valor NULL significa que não existem dados.
É diferente de zero, espaço, string vazia ou tabulação. Os nulos podem ser problemáticos, pois indicam:
- O valor da coluna não é apropriado;
- O valor não foi especificado;
- O valor é desconhecido.

## Integridade de Chave

os valores inseridos na coluna de chave primário devem ser sempre únicos, não admitindo-se repetições nesses valores
Desta forma, as tuplas(registros) serão sempre distintas, os valores de chave primária também não podem ser nulos.

#### Integridade de Entidade

Essa forma de restrição afirma que nenhum valor de chave primária pode ser NULL, pois o ser valor é utilizado para 
identificar tuplas individuais em uma relação(tabela)

## Integridade Definida pelo Usuário

A integridade definida pelo usuário permite definir regras comerciais que não se encaixam em outras categorias de integridade.
Todas as categorias de integridade ogerecem suporte à integridade definida pelo usuário

Esta integridade se refere a regras de negócio específicas que são definidas pelo usuário do banco de dados
Por exemplo, pode-se definir que uma coluna aceitará um conjunto restrito de valores

#### Integridade da Coluna

Determina os valores aceitos para a respectiva coluna

# View

Uma exibição (visão - view) é una tabeka virtual baseada no conjunto de resultado de uma consulta SQL

Uma view contém linha e colunas como uma tabela real, e pode receber comando como declarações JOIN, WHERE 
e funções como uma tabela normal

Mostra sempre resultados dos dados atualizados, 
pois o motor do banco de dados recria os dados toda vez que o usuário consulta a visão

### Reuso: 

as view  são objetos de caráter permanente. Pensando pelo lado produtivo isso é excelente, jpa que elas podem ser lidas por vários usuários simultaneamente

views podem ser reutilizadas em várias consultas, facilitando o gerenciamento de código.

### Segurança: 

as views permitem que ocultemos determinadas colunas de uma tabela. 
Para isso, basta criarmos uma view com as colunas que acharmos necessário que sejam exibidas

pode-se limitar o acesso a determinadas colunas de uma tabela, criando views que mostram apenas os dados necessários para certos usuários.

### Simplificação do código: 

as views nos permitem criar um código de programação muito mais limpo, na medida em que podem conter um SELECT complexo. Assim criar views para programadores a fim de poupá-los do trabalho de criar SELECT's é uma forma de aumentar a produtividade da equipe de desenvolvimento

views ajudam a esconder a complexidade das consultas SQL, tornando o código mais limpo e fácil de entender.

### Vantagens:

- Economizar tempo com retrabalho;
  - voce nao precisa escrever aquela intrução enorme, escreve uma vez e armazena 
- Velocidade de acesso às informações;
  - uma vez compilada, o seu recordset(conjunto de dados) é armazenado em uma tabela temporária(virtual)
  - Uma view pode melhorar a performance em consultas complexas.
- Mascarar complexidade do banco de dados;
  - Views permitem ocultar a complexidade do banco de dados e seus relacionamentos.   
- Simplifica o gerenciamento de permissão de usuários;
- Organizar dados a serem exportados para outros aplicativos;

### Onde usar

- Restrição usuário x dados
  - exemplo: o departamento de vendas não precisa ter acesso a uma coluna que contém dados referentes aos salários dos desenvolvedores
- Restriçaõ usuário x domínio
  - exemplo: pode-se restringir o acesso de um usuário específico a colunas específicas de uma tabela
- Associar vários domínios formando uma única entidade
  - exemplo: pode-se ter várias 'JOIN' encapsulados em uma view, formando somente uma tabela atbitrariamente
- Agregar informações, em vez de fornecer detalhes
  - exemplo: pode-se apresentar um somatório de despesas em ligações de um determinado usuário, restringindo acesso aos detalhes da conta



### Criação

```sql
CREATE or ALTER VIEW [nome_exibição] AS
SELECT coluna
FROM tabela
WHERE condição

-- para excluir
DROP VIEW [nome_exibicao]
```

# SUBCONSULTA

- é uma declaração SQL embutida em uma consulta externa
- fornece uma resposta à consulta externa na forma de um valor escalar, listar de valores, ou conjunto de dados, equivalentes a uma expressão, lista ou tabelas para a consulta externa
  
## ➤ COMMON TABLE EXPRESSION - CTE

- expressão de tabela comum é uma variação de uma subconsulta, similiar a uma exibição (view)
- pode ser acessada múltiplas vezes dentro da consulta principal, como se fosse uma exibição ou tabela

```SQL
WITH CTENomeTabela(campo1, campo2)
AS (SELECT valor1, valor2 FROM tabela2 INNER JOIN tabela3)

SELECT campo1, campo2
FROM CTENomeTabela
GROUP BY campo1
```
