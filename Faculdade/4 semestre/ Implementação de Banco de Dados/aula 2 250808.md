## Operadores aritméticos
- +, add
- -, subtract
- *, multiply
- /, divide
- %, modulo

## Operadores Bitwise
- &, bitwise AND
- !, bitwise OR
- ^, bitwise exclusive OR

## comparacao
- =, equal to
- >, greater than
- <, lower than
- <>, not equal to

## compostos
-  +=, add equals
-  -=, subtract equals
-  *=, multiply equals
-  /=, divide equals
-  %=, modulo equals
-  &=, bitwise AND equals
-  ^-=, bitwise exclusive equals
-  |*=, bitwise OR equals

## operadores lógicos
- ALL
- AND
- ANY
- BETWEEN
- EXISTS
- IN
- LIKE
  - usando na cláusula WHERE pra pesquisar um padrão específico em uma coluna
  - (%) representa zero, um ou vários caracteres
  - (_) representa um único caractere
  - ex.
    SELECT *
    FROM FUNCIONARIO AS F
    WHERE F.Endereco LIKE '%São Paulo' -- quando nao tem porcentagem no fim termina em são paulo
    OR F.Endereco LIKE '%Curitiba%' -- quanto tem porcentagem é porque tem mais coisa depois 
- NOT
- OR
- SOME

## outros
- SELECT DISTINCT, é usada para retornar apenas os valores distintos, elimina duplicatas
- WHERE, filtro de registros, extrai apenas os registro que atendem a uma condição especificada
  - funciona também com UPDATE, DELETE, etc... além do SELECT
  - combinado com operadores bitwise (AND, OR, NOT) cria filtros com mais parâmetros
- ORDER BY, usada ordenar de forma ASCENDENTE(ASC) ou DESCENDENTE(DESC)
  - por padrão é ASC se não especificado
- SELECT TOP, especifica o número de registros a serem retornados, exemplo pegar os 5 primeiros TOP 5
  - dependendo esse vária bastante

## NULL
NULL é um campo sem valor, é diferente de zero ou espaço em branco. 
Campo com valor NULL significa que foi deixado em branco durante a criação de registro.

não é possivel testar valores NULL com operadores de comparação como =, <, <>
usa-se:
- IS NULL
- IS NOT NULL

## Funções
-  MIN() e MAX(), retorna o valor da coluna mais baixo e mais alto respectivamente
-  COUNT(), retorna o numero de linhas que correspondem a uma critério especificado
-  AVG(), retorna o valor médio de uma coluna numérica
-  SUM(), retorna a soma total de uma coluna numérica

## operador IN
utilizado na cláusula WHERE, verifica se oque eu quero esta dentro desse conjunto de valores que estou repassando

