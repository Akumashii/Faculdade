-- CONSULTAS REALIZADAS EM AULA

-- DISTINCT : Liste as diferentes faixas salariais dos funcionários. 

SELECT DISTINCT F.Salario 
FROM FUNCIONARIO as F;

SELECT * 
FROM FUNCIONARIO;

-- WHERE : Recupere todas as informações do(s) funcionais com primeiro nome “João”. 

SELECT * 
FROM FUNCIONARIO as F
WHERE f.Pnome = 'João';

-- WHERE : Recupere todas as informações do(s) funcionais que tem salario menor ou igual a 30000

SELECT * 
FROM FUNCIONARIO as F 
WHERE f.Salario <= 30000;

-- Liste os funcionários do sexo masculino com salário maior ou igual a 30.000,00R$

SELECT *
FROM FUNCIONARIO as F
WHERE F.Salario >=30000 
AND F.Sexo = 'M';

-- Liste os funcionários que moram em São Paulo ou em Curitiba.

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Endereco LIKE '%São Paulo%' 
OR F.Endereco LIKE '%Curitiba%';

-- Liste os funcionários que não moram em São Paulo.

SELECT *
FROM FUNCIONARIO AS F
WHERE NOT F.Endereco LIKE '%São Paulo%';

-- Preciso cortar orçamento, liste os funcionários em ordem decrescente de salário.

SELECT *
FROM FUNCIONARIO AS F
ORDER BY F.Salario DESC;

-- Encontre os Funcionário que não possuem supervisor (Cpf_supervisor)

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor IS NULL;

-- Recupere o(s) nome(s) do(s) funcionário(s) que possuem supervisor

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Cpf_supervisor IS NOT NULL;
-- ORDER BY F.Cpf_supervisor;

-- Recupere o registro dos 3 funcionários que têm o maior salário.

SELECT TOP 3 *
FROM FUNCIONARIO AS F
ORDER BY F.Salario DESC;

-- MIN() Recupere as informações do funcionário com o menor salário.

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario = (SELECT MIN(F.Salario)
					FROM FUNCIONARIO AS F);

-- MAX() Recupere as informações do funcionário com o maior salário.

SELECT *
FROM FUNCIONARIO AS F
WHERE F.Salario = (SELECT MAX(F.Salario)
					FROM FUNCIONARIO AS F);

-- declarando váriavel e atribuindo valor

DECLARE @salario_min DECIMAL(10,2);

/*
SELECT @salario_min = (SELECT MIN(F.Salario)
					FROM FUNCIONARIO AS F
*/ -- da no mesmo do que o SET, é mais claro que esta trabalhando com variavel

SET @salario_min = (SELECT MIN(F.Salario)
					FROM FUNCIONARIO AS F);

PRINT @salario_min;

SELECT * 
FROM FUNCIONARIO AS F
WHERE F.Salario = @salario_min;

-- COUNT() Quantos funcionários possuímos cadastrados no banco?

SELECT COUNT(F.Pnome) AS 'Quantidade Funcionario'
FROM FUNCIONARIO AS F;

-- quantas pessoas estão cadastradas no meu banco

SELECT -- 
	(SELECT COUNT(*) FROM FUNCIONARIO) AS 'quant_funcionarios', -- printa quantidade funcionario
	(SELECT COUNT(*) FROM DEPENDENTE) AS 'quant_dependentes', -- printa quantidade dependentes
	(SELECT COUNT(*) FROM FUNCIONARIO) + (SELECT COUNT(*) FROM DEPENDENTE) AS total; -- soma as duas e printa

SELECT --soma
	(SELECT COUNT(*) FROM FUNCIONARIO) +
	(SELECT COUNT(*) FROM DEPENDENTE) AS Total;

	-- faz a mesma coisa que o de cima, mas menos caotico pra entender
DECLARE @quant_funcionarios INT;
DECLARE @quant_dependentes INT;

SET @quant_funcionarios = (SELECT COUNT(*) FROM FUNCIONARIO);
SET @quant_dependentes = (SELECT COUNT(*) FROM DEPENDENTE);

SELECT @quant_dependentes + @quant_funcionarios AS Total;

-- AVG() Qual é a média salarial dos meus funcionários?

SELECT AVG(F.Salario) as 'media salarial'
FROM FUNCIONARIO AS F;

-- SUM() Qual é o meu custo mensal com folha de pagamento dos funcionários?

SELECT SUM(F.Salario) as 'soma dos salarios'
FROM FUNCIONARIO AS F;
	-- quanto o funcionario que menos recebe recebe a menos do que a media
	DECLARE @menor_salario DECIMAL(10,2);
	DECLARE @media_salario DECIMAL(10,2);

	SET @menor_salario = (SELECT MIN(F.Salario) FROM FUNCIONARIO AS F);
	SET @media_salario = (SELECT AVG(F.Salario) FROM FUNCIONARIO AS F);

	SELECT @media_salario - @menor_salario AS pobre;

-- LIKE Recupere o(s) funcionário(s) nascido(s) no ano de 72.

SELECT *
FROM FUNCIONARIO AS F 
WHERE F.Datanasc LIKE '__72%';
-- WHERE YEAR(F.datanasc) LIKE '__72%'; -- é funcao pra data

-- IN Recupere as informações dos funcionários que recebem 25000 e 30000 R$

SELECT *
FROM FUNCIONARIO AS F 
WHERE F.Salario IN (25000,30000);

-- IN Recupere os registros dos funcionários que trabalham (TRABALHA_EM) no mesmo
-- projeto e na mesma quantidade de horas do “Fernando” (Fcpf = “33344555587” )

SELECT F.Pnome, TE.*
FROM FUNCIONARIO AS F 
JOIN TRABALHA_EM AS TE on F.Cpf = TE.Fcpf;

SELECT F.Pnome, TE.* -- faz a mesma coisa que o de cima
FROM FUNCIONARIO AS F, TRABALHA_EM AS TE
WHERE F.Cpf = TE.Fcpf;

-- resposta 

DECLARE @cpf_fernando CHAR(11);

SET @cpf_fernando = (SELECT F.Cpf FROM FUNCIONARIO AS F
						WHERE F.Pnome = 'Fernando');
--SELECT Pnr FROM TRABALHA_EM WHERE Fcpf = @cpf_fernando;

SELECT F.Pnome, TE.*
FROM FUNCIONARIO AS F 
JOIN TRABALHA_EM AS TE ON F.Cpf = TE.Fcpf
WHERE TE.Pnr IN (SELECT Pnr FROM TRABALHA_EM 
				WHERE Fcpf = @cpf_fernando)
AND TE.Horas IN (SELECT Horas FROM TRABALHA_EM 
				WHERE Fcpf = @cpf_fernando)
AND NOT F.Pnome = 'Fernando';
