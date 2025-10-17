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

/*
	Crie um trigger que não deixe inserir um funcionário
	que tenha o nome completo que um já existente
*/
