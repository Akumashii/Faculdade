# SQL JOIN

Join é uma cláusula para combinar linhas de deuas ou mais tabelas, com base em uma coluna relacionada entre elas

para melhor compreensão pense na teoria de conjuntos e como os campos se relacionam

## INNER JOIN

eu pego a INTERSEÇÃO de duas tabelas, oque está no MEIO

vou recuperar os dados que de algum modo estão conectados nas duas tabelas, exemplo: tabela funcionário e departamento, o inner join capta todos os funcionarios que tem departamento e todos os departamentos que tem funcionarios

## LEFT JOIN

ele me retorna toda a tabela 1, usando o mesmo exemplo acima, ele retorna: todos os funcionarios, mesmo aqueles que tem ou não tem departamento

## RIGHT JOIN

ele me retorna toda a tabela 2, ele retorna: todos os departamentos, mesmo aqueles que tem ou não tem funcionários

## CROSSJOIN ou FULL JOIN

ele retorna tudo, retorna a tabela 1 e 2, assim: retorna todos os funcionarios relacionados ou não com algum departamento e todos os departamentos relacionados ou não com funcionários

<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/c05e3288-03be-465e-94e7-9eba632073ad" />
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/3348fcbc-1c43-4ff2-b6b5-cb388eaf18be" />

## self JOIN

utilizado quando a tabela tem auto relacionamento, juntar ela com ela mesma

## SQL UNION

operador UNION é usado para combinar o conjunto de resultados de duas ou mais intruções SELECT

junto as duas e tira as duplicatas

- regras
  - cada instrução SELECT dentro de UNION deve ter o mesmo número de colunas, precisam ter AS MESMAS CARACTERISTICAS
  - as colunas também devem ter tipos de dados semelhantes, compatíveis em tipo
  - as colunas em cada instrução SELECT também devem estar na mesma ordem
 
 UNION ALL permite duplicatas

 ## SQL EXCEPT

 mesma estrutura do UNION, todavia diminui dados entre tabelas. "piriri pororo exceto aqueles dados"

## SQL INTERSECT 

denovo, mesma estrutura, agora pego a INTERSEÇÃO DOS DADOS

saída é aqueles dados que estão em comum nas duas tabelas

## GROUP BY

esta intrução agrupa linhas com os mesmos valores em linhas de resumo

frequentemente usada com funções agregadas
(COUNT(), MAX(), MIN(), SUM(), AVG()) para agrupar o conjunto de resultados
por uma ou mais colunas.

## HAVING

A cláusula HAVING foi adicionada ao SQL porque a palavra-chave WHERE não pode ser usada com funções agregadas.

então é a mesma coisa que WHERE pelo visto (obs. é sim)

## EXISTS

alinhado à cláusula WHERE

é usado para testar a existência de qualquer registro em uma subconsulta

a cláusula EXISTS retorna TRUE or FALSE, TRUE se a subconsulta retornar um ou mais registros (no caso retornando se ela existe ou nao)

## ANY

retorna um valor booleano 

retorna TRUE se QUALQUER (ANY) um dos valores da subconsulta atender à condição

ANY vai comparar com todos os valores e significa que a condição será verdadeira se esta operação for verdadeira para qualquer um dos valores no intervalo. 

## ALL

retorna um valor booleano, antagonico do ANY que pega qualquer um, ALL pega TODOS os valores da subconsulta

então, retorna TRUE se TODOS OS VALORES da subconsulta atenderem à condição

é usado com instruções SELECT, WHERE e HAVING, ALL significa que a condição retorna true se for verdadeira para todos os valores no intervalo,
funciona tal qual o operador && (AND) que só vai retornar true se todos cumprem a condição 

