/*
	Criar um TRIGGER AFTER - exemplo
*/
GO
CREATE OR ALTER TRIGGER trg_teste_trigger_after
ON FUNCIONARIO
AFTER INSERT
AS
PRINT 'olá mundo';
GO

/*
	Criar um TRIGGER AFTER - exemplo
*/

GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
AFTEr INSERT
AS
PRINT 'Funcionário inserido com sucesso!'
GO

INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
VALUES ('Aurora', 'F', 'Rolim', '13242353419', '2006-01-20', 'R. Duque de Caxias, 1900, Santa Maria, RS', 'F', 67000, NULL, NULL)

/*
	INSTEAD OF INSERT
*/

GO
CREATE OR ALTER TRIGGER trg_InserirFuncionario
ON FUNCIONARIO
INSTEAD OF INSERT -- ao invés de fazer o INSERT faça isso (ativa o trigger)
AS
PRINT 'Funcionário NAO inserido!'
GO

/*
	ENABLE|DISABLE TRIGGER, para habilitar ou desabilitar um trigger usa-se
*/

ALTER TABLE FUNCIONARIO
DISABLE TRIGGER trg_InserirFuncionario

/*
	Determinando as colunas atualizadas
*/

GO
CREATE OR ALTER TRIGGER trg_after_autores
ON FUNCIONARIO
AFTER INSERT,UPDATE
AS
IF UPDATE(Pnome)
	BEGIN 
		PRINT 'O nome foi alterado'
	END
ELSE
	BEGIN
		PRINT 'Nome não foi modificado'
	END
GO

/*
	AFTER UPDATE
	FROM INSERTED|DELETED
*/

GO
CREATE OR ALTER TRIGGER trg_AfterUpdatePnome
ON FUNCIONARIO
AFTER UPDATE
AS
IF UPDATE(Pnome)
	BEGIN
		DECLARE @nomeAntigo VARCHAR(100); -- removido da tabela
		DECLARE @nomeNovo VARCHAR(100); -- inserido na tabela

		SELECT @nomeNovo = Pnome FROM inserted; -- pegou oq foi inserido
		SELECT @nomeAntigo = Pnome FROM deleted; -- pegou oq foi deletado
		
		PRINT 'Era: ' + @nomeAntigo;
		PRINT 'Alterado para: ' +@nomeNovo;
	END
ELSE
	BEGIN
		PRINT 'O primeiro nome não foi alterado'
	END
GO

SELECT * FROM FUNCIONARIO ORDER BY Pnome;
UPDATE FUNCIONARIO
SET Pnome = 'Aura'
WHERE Cpf = '13242353419';

/* ROLLBACK TRIGGER
	Trigger para evitar inserção de nomes duplicados
*/
GO
CREATE OR ALTER TRIGGER trg_AfterNomesDuplicados
ON FUNCIONARIO
AFTER INSERT
AS
BEGIN
	DECLARE @Duplicados INT;
	-- antes de dar COMMIT (acao irreversivel) eu vejo se ta tudo certo com o banco
	-- se estiver conforme COMMIT, se não ROLLBACK

	SELECT @Duplicados = COUNT(*)
	FROM(
			SELECT Pnome, Unome, Minicial
			FROM FUNCIONARIO 
			GROUP BY Pnome, Unome, Minicial
			HAVING COUNT(*) > 1
		) AS Duplicados;

	IF @Duplicados > 0
	BEGIN
		PRINT 'Há duplicata no banco';
		ROLLBACK TRANSACTION;
	END 
	ELSE
	BEGIN
		PRINT 'Sem duplicatas no banco';
		COMMIT TRANSACTION;
	END;
END;
GO

SELECT Cpf, Pnome, Unome, Minicial
FROM FUNCIONARIO;

INSERT INTO FUNCIONARIO(Cpf, Pnome, Unome, Minicial) 
VALUES ('112363411',	'Carlos',	'Ferreira',	'M');

/* Segundo jeito de fazer o de cima

*/

GO
CREATE OR ALTER TRIGGER trg_AfterNomesDuplicados
ON FUNCIONARIO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @Pnome VARCHAR(50),
			@Minicial CHAR(1),
			@Unome VARCHAR(50),
			@Duplicados INT;
	SELECT @Pnome = Pnome, @Unome = Unome, @Minicial = Minicial
	FROM INSERTED;

	-- Verifica se existe algum com o mesmo nome
	IF EXISTS( 
			SELECT 1 
			FROM FUNCIONARIO
			WHERE(
				@Pnome = Pnome
				AND @Unome = Unome
				AND @Minicial = Minicial				
				)
			)
	BEGIN
		PRINT 'Já existe alguém com este nome...'
		-- RAISERROR( 'Mensagem de ERRO', Severidade do ERRO, Estado)  
		 /* Nível de Severidade: 

			0 a 10: Informativo ou advertências que não causam interrupção na execução. 
			Geralmente usados para mensagens de log ou alertas leves.

			11 a 16: Erros que indicam um problema com a consulta, como violação de regras de negócios ou erros de sintaxe. 
			Esses erros podem interromper a execução da consulta atual, mas não comprometem o SQL Server em si.
		
			17 a 25: Erros graves ou críticos que indicam falhas no servidor, recursos ou corrupção de dados. 
			Esses erros podem interromper transações ou até mesmo causar falhas no servidor.
		 
		 */
		RAISERROR('Está com NOMES duplicados', 16, 0);
	END
	ELSE
	BEGIN
		INSERT INTO FUNCIONARIO(Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Bonus, Data_Admissao)
		SELECT Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr, Bonus, Data_Admissao
		FROM INSERTED;
	END
END;
GO

SELECT * FROM FUNCIONARIO ORDER BY Pnome;

INSERT INTO FUNCIONARIO(Cpf, Pnome, Unome, Minicial)
VALUES ('99999999', 'Frazzon', 'Frazzon', 'F');

/*
	CREATE TABLE Log_Funcionario (
		LogID INT IDENTITY(1,1) PRIMARY KEY,
		Cpf CHAR(11),
		Operacao VARCHAR(10),
		Data_Hora DATETIME DEFAULT GETDATE()
	);

Crie um trigger que seja disparado depois que uma
operação de inserção ocorra na tabela
FUNCIONARIO. Esse trigger deve registrar o CPF do
novo funcionário inserido e a operação realizada
(neste caso, "INSERT") em uma tabela de log
(Log_Funcionario), juntamente com a data e hora da
inserção. Esse trigger ajudará a manter um histórico
das inserções realizadas na tabela de funcionários.
*/

CREATE TABLE Log_Funcionario (
		LogID INT IDENTITY(1,1) PRIMARY KEY,
		Cpf CHAR(11),
		Operacao VARCHAR(10),
		Data_Hora DATETIME DEFAULT GETDATE()
);

GO
CREATE OR ALTER TRIGGER trg_InserçãoFuncionario
ON FUNCIONARIO
AFTER INSERT
AS 
BEGIN
	INSERT INTO Log_Funcionario(Cpf, Operacao)
	SELECT Cpf, 'INSERT'
	FROM INSERTED;
END
GO

-- TRIGGER UPDATE

GO
CREATE OR ALTER TRIGGER trg_UpdateFuncionario
ON FUNCIONARIO
AFTER UPDATE
AS 
BEGIN
	
	INSERT INTO Log_Funcionario(Cpf, Operacao)
	SELECT Cpf, 'UPDATE'
	FROM inserted;
	
END
GO

-- TRIGGER DELETE

GO
CREATE OR ALTER TRIGGER trg_DeleteFuncionario
ON FUNCIONARIO
AFTER DELETE
AS 
BEGIN
	
	INSERT INTO Log_Funcionario(Cpf, Operacao)
	SELECT Cpf, 'DELETE'
	FROM deleted;
	
END
GO

-- TRIGGER INSERT UPDATE DELETE

GO
CREATE OR ALTER TRIGGER trg_UpdateFuncionario
ON FUNCIONARIO
AFTER UPDATE, DELETE, INSERT
AS 
BEGIN
	
	INSERT INTO Log_Funcionario(Cpf, Operacao)
	SELECT Cpf, 'UPDATE'
	FROM INSERTED;
	
END
GO
