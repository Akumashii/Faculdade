-- IF ELSE
-- verificar tamanho do departamento
-- se tiver 1 pessoa é pequeno; 2 a 3 é médio; mais que 3 é grande

DECLARE @QtdFuncionario INT;

SELECT @QtdFuncionario = COUNT(F.Cpf)
FROM FUNCIONARIO AS F
INNER JOIN DEPARTAMENTO AS D
ON F.Dnr = D.Dnumero
WHERE D.Dnome = 'Pesquisa'
PRINT @QtdFuncionario

IF(@QtdFuncionario <=1)
	PRINT 'Pequeno';
ELSE IF(@QtdFuncionario>=2 AND @QtdFuncionario<=3)
	PRINT 'Medio';
ELSE
	PRINT 'GRANDE';

-- Aumentar o salario da "Joice Leite" em 5% repetidamente até que ele chegue em R$30000

DECLARE @salario DECIMAL(10,2);
DECLARE @contador INT;
SET @contador = 0;

SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Joice' AND F.Unome = 'Leite';

WHILE (@salario<=30000)
	BEGIN
		SET @salario = @salario * 1.05;
		SET @contador = @contador + 1
	END

PRINT 'salario: '+CAST(@salario AS VARCHAR)+' aumentou 5% '+CAST(@contador AS VARCHAR)+ ' vezes';
,
-- FUNCOES
-- funcao que dobra  

SELECT dbo.fn_Dobro(5) AS 'Resultado';

SELECT F.Pnome, F.Unome, F.Salario, dbo.fn_Dobro(F.Salario) AS 'Dobro'
FROM FUNCIONARIO AS F;
/*
		ALTER FUNCTION [dbo].[fn_Dobro](@Numero DECIMAL(10,2))
		RETURNS DECIMAL(10,2)
		AS
		BEGIN
		  RETURN @Numero * 2;
		END;
*/


-- criar funcao que calcula a idade de um funcionário com base na data de nascimento

SELECT F.Pnome, F.Unome, dbo.fn_calculaIdade(F.DataNasc) AS 'Idade', (YEAR(GETDATE()) - YEAR(F.Datanasc)) AS 'Idade não exata'
FROM FUNCIONARIO AS F;
/*
		CREATE FUNCTION fn_calculaIdade(@DataNasc DATE)
		RETURNS INT
		AS
		BEGIN
			DECLARE @Idade INT;
			SET @Idade = DATEDIFF(YEAR, @DataNasc, GETDATE());
			IF(MONTH(@DataNasc) > MONTH(GETDATE())
				OR MONTH(@DataNasc) = MONTH(GETDATE())
				AND DAY(@DataNasc) > DAY(GETDATE()))
				SET @Idade = @Idade - 1;
			RETURN @Idade
		END;
*/

-- Retornar todos os funcionários de um determinado departamento.

/*
		CREATE FUNCTION fn_Nome(@departamento VARCHAR(15))
		RETURNS TABLE
		AS
		RETURN
		(
			SELECT F.Pnome, F.Unome, D.Dnome AS 'Departamento'
			FROM FUNCIONARIO AS F
			INNER JOIN DEPARTAMENTO AS D
				ON F.Dnr = D.Dnumero
			WHERE D.Dnome = @departamento
		);
*/

-- Criar uma função que retorna nome completo dos funcionários e o valor do salário anual, com férias e décimo terceiro;

/*
CREATE FUNCTION fn_SalarioAnual()
RETURNS @Tabela TABLE
(
	NomeCompleto VARCHAR(100),
	SalarioMensal DECIMAL(10,2),
	SalarioAnual DECIMAL (12,2)
)
AS
BEGIN
	INSERT INTO @Tabela
	SELECT
		CONCAT(F.Pnome, ' ', F.Minicial, '. ', F.Unome),
		F.Salario, 
		F.Salario * 12
	FROM FUNCIONARIO AS F

	RETURN;
END;
*/

