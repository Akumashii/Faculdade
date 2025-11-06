
-- INNER JOIN Selecionar o primeiro nome, último nome, endereço dos funcionários que trabalham no departamento de “Pesquisa”.

SELECT F.Pnome, F.Unome, F.Endereco, D.Dnome
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa';

-- INNER JOIN Liste o nome dos funcionários que estão desenvolvendo o “ProdutoX”.

SELECT F.Pnome, F.Unome, P.Projnome
FROM FUNCIONARIO AS F
INNER JOIN TRABALHA_EM AS TE
	ON TE.Fcpf = F.Cpf
INNER JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
WHERE P.Projnome = 'ProdutoX';

-- INNER JOIN Para cada projeto localizado em “Mauá”, liste o número do projeto, o número do departamento que o
-- controla e o sobrenome, endereço e data de nascimento do gerente do departamento.

SELECT * 
FROM PROJETO AS P
INNER JOIN DEPARTAMENTO AS D
	ON P.Dnum = D.Dnumero
INNER JOIN FUNCIONARIO AS F
	ON D.Cpf_gerente = F.Cpf
WHERE P.Projlocal LIKE '%Mauá%';

-- LEFT JOIN Liste o último nome de TODOS os funcionários e o último nome dos respectivos gerentes, caso possuam

SELECT 
	F.Pnome AS 'F_Nome',
	F.Unome AS 'F_Sobrenome',
	S.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F
LEFT JOIN FUNCIONARIO AS S
	ON S.Cpf = F.Cpf_supervisor;

-- LEFT JOIN *Encontre os funcionários que não possuem um departamento a eles vinculado

SELECT 
	F.Pnome, 
	F.Unome, 
	D.Dnome AS 'Departamento'
FROM FUNCIONARIO AS F
LEFT JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE D.Dnome IS NULL;

-- LEFT JOIN *Encontre os DEPARTAMENTOS que não possuem um funcionários a eles vinculado

SELECT 
	F.Pnome, 
	F.Unome, 
	D.Dnome AS 'Departamento'
FROM DEPARTAMENTO AS D
LEFT JOIN FUNCIONARIO AS F
	ON F.Dnr = D.Dnumero
WHERE F.Dnr IS NULL;

-- RIGHT JOIN 
-- Encontre os departamentos que ~não possuem nenhum funcionário

SELECT *
FROM FUNCIONARIO AS F
RIGHT JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
WHERE F.Cpf IS NULL;

-- Teste entre as relações Funcionários e Departamento

SELECT *
FROM FUNCIONARIO AS F
FULL JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero;

-- self JOIN
-- Crie uma consulta que mostra apenas os funcionários que têm um supervisor.

SELECT F.Pnome, F.Unome, S.Pnome AS 'Supervisor'
FROM FUNCIONARIO AS F
JOIN FUNCIONARIO AS S
	ON F.Cpf_supervisor = S.Cpf
WHERE F.Cpf_supervisor IS NOT NULL;

-- SQL UNION 
-- Listar todos os nomes, sexo e data de nascimento de todas as pessoas do banco.

SELECT 
	F.Pnome, 
	F.Sexo,
	F.Datanasc
FROM FUNCIONARIO AS F
UNION
SELECT 
	D.Nome_dependente,
	D.Sexo,
	D.Datanasc
FROM DEPENDENTE AS D;

-- UNION
-- Imagine que a diretoria da empresa quer uma lista de todas as cidades onde a empresa possui
-- alguma atividade, seja a localização de um departamento ou a localização de um projeto.

SELECT 
	P.Projlocal
FROM PROJETO AS P 
UNION
SELECT 
	L.Dlocal
FROM LOCALIZACAO_DEP AS L;

-- SQL EXCEPT
-- Listar os CPFs dos funcionários que não são gerentes de nenhum departamento.

SELECT 
	F.Cpf
FROM FUNCIONARIO AS F
EXCEPT
SELECT 
	D.Cpf_gerente
FROM DEPARTAMENTO AS D;

-- EXCEPT
-- Encontre os Funcionários que NÃO são Supervisores

SELECT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE F.Cpf IN (
				SELECT 
					F.Cpf
				FROM FUNCIONARIO AS F
				EXCEPT
				SELECT 
					F.Cpf_supervisor
				FROM FUNCIONARIO AS F);

-- INTERSECT
-- Encontre os Funcionários que são Supervisores

-- GROUP BY
-- Contar o número de funcionários por departamento

SELECT COUNT(F.Cpf) AS 'Qtd_Funcionarios', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F 
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

-- GROUP BY
-- Somar os salários por departamento

SELECT SUM(F.Salario) AS 'Sálario Total', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

-- GROUP BY
-- Média de horas trabalhadas por projeto

SELECT AVG(TE.Horas) AS 'Média Horas', P.Projnome AS 'Projeto'
FROM TRABALHA_EM AS TE
JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
GROUP BY P.Projnome

-- GROUP BY
-- Quantidade de funcionários por sexo

SELECT COUNT(F.Sexo) AS 'SEXO', F.Sexo as 'sexo'
FROM FUNCIONARIO AS F
GROUP BY F.Sexo

-- GROUP BY
-- Maior salário em cada departamento

SELECT MAX(F.Salario) AS 'Sálario Total', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome

-- GROUP BY
-- Número de projetos em cada local



-- HAVING 
-- Encontrar departamentos com mais de 3 funcionários

SELECT COUNT(F.Cpf) AS 'Nr_Funcionário', D.Dnome AS 'Dpt'
FROM FUNCIONARIO AS F 
JOIN DEPARTAMENTO AS D
	ON F.Dnr = D.Dnumero
GROUP BY D.Dnome
HAVING COUNT(F.Cpf) > 3

-- HAVING 
-- Listar projetos que exigem no minimo 50 horas de trabalho no total

SELECT SUM(TE.Horas) AS 'Min_horas', P.Projnome AS 'Projeto'
FROM TRABALHA_EM AS TE
JOIN PROJETO AS P
	ON TE.Pnr = P.Projnumero
GROUP BY P.Projnome
HAVING SUM(TE.Horas) >= 50;

-- EXISTS
-- Listar funcionários que são gerentes de algum departamento

SELECT F.Pnome AS 'é gerente', F.Unome, F.Cpf
FROM FUNCIONARIO AS F 
WHERE EXISTS(
			SELECT 51151551155115515115
			FROM DEPARTAMENTO AS D
			WHERE D.Cpf_gerente = '33344555587');

-- LISTAR FUNCIONARIOS QUE SAO GERENTES DE ALGUM DEPARTAMENTO


-- ALL 
-- Encontrar funcionários que ganham mais do que qualquer funcionário do departamento de 'Administração


SELECT F.Salario, F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE F.Salario > ALL(
					SELECT F.Salario
					FROM FUNCIONARIO AS F
					INNER JOIN DEPARTAMENTO AS D
					ON F.Dnr = D.Dnumero
					WHERE D.Dnome = 'Administração');

-- ALL
-- Encontrar projetos que exigem mais horas do que todos os projetos no local 'Itu'

SELECT P.Projnome, SUM(TE.Horas)
FROM PROJETO AS P
INNER JOIN TRABALHA_EM AS TE
ON TE.Pnr = P.Projnumero
GROUP BY P.Projnome
HAVING SUM(TE.Horas) > ALL( -- TO VENDO A SOMA DAS QUANTIDADE DE HORAS DE TODOS OS PROJETOS POR REGIAO
						SELECT SUM(TE.Horas)
						FROM PROJETO AS P
						INNER JOIN TRABALHA_EM AS TE
						ON TE.Pnr = P.Projnumero
						WHERE P.Projlocal = 'Itu' OR P.Projlocal = 'Santo André'
						GROUP BY P.Projlocal);
