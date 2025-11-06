-- DECLARAÇÃO

DECLARE @idade INT,
		@nome VARCHAR(40),
		@data DATE,
		@grana MONEY;

-- ATRIBUIÇÃO por SET
SET	@nome = 'Frazzon';
SET @data = '2006-01-20';
SET @grana = 7;
SET @idade = YEAR(GETDATE()) - YEAR(@data);

-- printando por SELECT
SELECT @nome as 'nome', 
		@idade as 'Idade',
		@data as 'Data_Nasc',
		@grana as 'Poder_Aquisitivo';

-- ATRIBUIÇÃO por SELECT
DECLARE @dpt_nome VARCHAR(100);

SELECT @dpt_nome = D.Dnome
FROM DEPARTAMENTO AS D
WHERE D.Dnumero = 4;

PRINT 'Departamento: '+@dpt_nome

-- AGORA CALCULANDO
-- Calculando o novo salário com um aumento de 10%, para a Jennifer

DECLARE @salario DECIMAL(10,2);
DECLARE @funcionaria VARCHAR(40);

SET @funcionaria = 'Jennifer';

SELECT @salario = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @funcionaria;

PRINT @funcionaria + ' antes do aumento de salario tinha: '+CAST(@salario AS VARCHAR);

DECLARE @aumento FLOAT;
SET @aumento = 10;

SET @salario = @salario * (1+(@aumento/100));

PRINT @funcionaria + ' depois do aumento de salario ficou com: '+CAST(@salario AS VARCHAR);


-- Calculando a idade da Jennifer.

DECLARE @funcionario VARCHAR(40);
DECLARE @data_nasc DATE;
DECLARE @idadee INT;

SET @funcionario = 'Jennifer';

SELECT @idadee = YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
WHERE F.Pnome = @funcionario;

PRINT @funcionario + ' tem ' + CAST(@idadee AS VARCHAR) + ' anos'

-- CONVERT
-- Converta a data de nascimento da Jennifer para o padrão brasileiro: dd/mm/aaaa

DECLARE @data_nasc_br VARCHAR(10);

SELECT @data_nasc_br = CONVERT(VARCHAR(10), F.Datanasc, 103)
FROM FUNCIONARIO AS F
WHERE F.Pnome = 'Jennifer'

SELECT @data_nasc_br AS 'data';

-- IF ELSE
-- Verificar se um Funcionário Recebe Abaixo da Média Salarial


DECLARE @salario_medio DECIMAL(10,2);
DECLARE @salario_func DECIMAL(10,2);
DECLARE @nome_func VARCHAR(100);

SET @nome_func = 'JORGE';

SELECT @salario_medio = AVG(F.Salario)
FROM FUNCIONARIO AS F;

/*
SELECT F.Pnome, F.Salario, @salario_medio
FROM FUNCIONARIO AS F;
*/

SELECT @salario_func = F.Salario
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_func;

IF @salario_func > @salario_medio
	PRINT 'Ganha acima da média';
ELSE
	PRINT 'Mizeravel... ganha abaixo da média';

-- IF ELSE
-- Verificar se um Funcionário Está Próximo da Aposentadoria, considerar a idade para aposentadoria de 60 anos.
-- e se estiver acima de 80 anos deve obrigatóriamente se aposentar

DECLARE @idade_func_aposentadoria INT;
DECLARE @nome_func_aposentadoria VARCHAR(100);

SET @nome_func_aposentadoria = 'Jennifer';

SELECT @idade_func_aposentadoria = YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_func_aposentadoria;

IF @idade_func_aposentadoria > 55 AND @idade_func_aposentadoria < 80 
	PRINT 'é pra aposenta já'
ELSE IF @idade_func_aposentadoria >= 80
	PRINT 'aposenta agora!! ta velho demais'
ELSE
	PRINT 'nah dá pra trabalhar mais um pouco'

-- IF ELSE
-- Verificar se um Funcionário Já Recebeu Bônus Este Ano
DECLARE @bonus_func DECIMAL(10,2)
DECLARE @nome_func_bonus VARCHAR(100)

SET @nome_func_bonus = 'Maria';

SELECT @bonus_func = F.Bonus
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_func_bonus;

IF @bonus_func IS NOT NULL AND @bonus_func > 0
	PRINT 'tem bonus';
ELSE
	PRINT 'nao tem bonus';

-- verificar a data de nascimento EXATA 

DECLARE @idade_func_exata int;
DECLARE @nome_func_idade_exata VARCHAR(100);


SET @nome_func_idade_exata = 'Jennifer';

SELECT @idade_func_exata = YEAR(GETDATE()) - YEAR(F.Datanasc)
FROM FUNCIONARIO AS F
WHERE F.Pnome = @nome_func_idade_exata;

PRINT @nome_func_idade_exata + ' tem ' + CAST(@idade_func_exata AS VARCHAR) + ' anos'
