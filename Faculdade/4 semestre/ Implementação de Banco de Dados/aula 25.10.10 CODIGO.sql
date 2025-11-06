/* CASE
classificar funcionarios por faixa salarial usando CASE
até 20k - baixo
entre 20k-40k - médio
acima de 40k - alto
*/

SELECT 
	Pnome AS 'Nome',
	Unome AS 'Sobrenome',
	Salario,
	CASE
		WHEN Salario <= 20000 THEN 'Baixo'
		WHEN Salario BETWEEN 20000 AND 40000 THEN 'Médio'
		WHEN Salario > 40000 THEN 'Alto'
		ELSE 'Sem Registro'
	END AS 'Categoria'
FROM FUNCIONARIO;

/* CASE
verificar se o funcionario foi contratado recentemente, nos ultimos 2 anos
*/

SELECT 
	F.Pnome AS 'Nome',
	F.Unome AS 'Sobrenome',
	F.Data_Admissao,
	CAST(GETDATE() AS DATE) AS 'Hoje',
	CASE
		WHEN DATEDIFF(MONTH, F.Data_Admissao, GETDATE()) <=24 THEN 'Recém Admitido'
		ELSE 'Admitido há mais de 2 ano'
	END AS 'Admissao'
FROM FUNCIONARIO AS F;

/* TRANSAÇÃO
Promoção para Carlos, passará a ganhar 30k
*/
GO
BEGIN TRAN;

DECLARE @registroAfetado INT=0;

UPDATE FUNCIONARIO
SET Salario = 30000
WHERE Pnome = 'Carlos' 
	AND Unome = 'Silva'

SET @registroAfetado = @@ROWCOUNT + @registroAfetado;
IF @registroAfetado <> 1
	BEGIN
		ROLLBACK TRAN;
		PRINT 'ALTERACAO NAO REALIZADA'
	END;
ELSE
	BEGIN 
		COMMIT TRANSACTION;
		PRINT 'ALTERACAO REALIZADA COM SUCESSO';
	END;
GO

/*
sei la
*/

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- transação 1
BEGIN TRAN;
SELECT * FROM FUNCIONARIO;
PRINT 'SELECT concluído em: '+CONVERT(VARCHAR(30), SYSDATETIME(),121);
-- Pausa de 20 segundos
WAITFOR DELAY '00:00:20'
COMMIT TRAN;
PRINT 'COMMIT em: ' + CONVERT(VARCHAR(30), SYSDATETIME(),121);
-- transação 2
BEGIN TRAN;
INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf)
VALUES('eu', 'F', 'Rolim', '12345678910')
PRINT 'INSERT concluído em: ' +CONVERT (VARCHAR(30), SYSDATETIME(),121);
COMMIT TRAN;
PRINT 'COMMIT em: ' + CONVERT(VARCHAR(30), SYSDATETIME(),121);

/*
dar bonificacao para TODOS os funcionarios SOMENTE SE forem do departamento de 'Pesquisa'
*/

--GO
--BEGIN TRAN;

--DECLARE @registroAfetado INT=0;

--UPDATE FUNCIONARIO
--SET Salario = 30000
--WHERE Pnome = 'Carlos' 
--	AND Unome = 'Silva'

--SET @registroAfetado = @@ROWCOUNT + @registroAfetado;
--IF @registroAfetado <> 1
--	BEGIN
--		ROLLBACK TRAN;
--		PRINT 'ALTERACAO NAO REALIZADA'
--	END;
--ELSE
--	BEGIN 
--		COMMIT TRANSACTION;
--		PRINT 'ALTERACAO REALIZADA COM SUCESSO';
--	END;
--GO

/* TRANSACAO
fazer duas inserções intercaladas por um savepoint, assim que a segunda falhar deve voltar ao save 'ROLLBACK TRAN nome_save;' e dar COMMIT
*/

BEGIN TRAN;

INSERT INTO DEPARTAMENTO(Dnome, Dnumero)
VALUES('Marketing', 88)

SAVE TRAN dptOK;

INSERT INTO DEPARTAMENTO(Dnome, Dnumero)
VALUES('Marketing', 1)

ROLLBACK TRAN dptOK;

COMMIT TRANSACTION;

/* TRY CATH SQL
*/ 

BEGIN TRY
	SELECT 1/0; --ERRO
	PRINT 'Não cheguei aqui'
END TRY
BEGIN CATCH
	PRINT 'DEU ERRO@!!';
	PRINT 'Número: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
END CATCH

/* TRANSACTION TRY CATH
*/

SELECT * FROM funcionario;

BEGIN TRY
	BEGIN TRAN;
	
	UPDATE FUNCIONARIO
	SET Salario = 6666666 
	WHERE cpf = '98765432168'
	
	UPDATE FUNCIONARIO
	SET Dnr = 9999 -- erro de violação de chave estrangeira
	WHERE Cpf = '98765432168'

	COMMIT TRAN
	PRINT 'Pacto Demoniaco Realizado!!'
END TRY
BEGIN CATCH
	-- XACT_STATE(); -- retorna o status da ação anterior
	-- 1 transação em aberto 
	-- 0 não existe transação 
	IF XACT_STATE() <> 0 -- se for diferente de zero há uma transação em aberto, feche-a
		ROLLBACK TRAN;
	PRINT 'Número: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
	PRINT 'Mensagem: ' + ERROR_MESSAGE();
END CATCH

/* TRIGGERS

*/
