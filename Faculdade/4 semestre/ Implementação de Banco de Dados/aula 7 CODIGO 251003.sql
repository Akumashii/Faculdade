/*
Crie uma transação para realizar duas inserções dentro de uma transação: uma na tabela
FUNCIONARIO e outra na tabela DEPARTAMENTO. Se a segunda inserção falhar, a primeira será
revertida.
*/

GO
BEGIN TRANSACTION;

DECLARE @E INT = 0;


INSERT INTO FUNCIONARIO(Pnome, Unome, Cpf) 
VALUES ('Vanessa', 'Nascimento', 222213);
SET @E = @@ERROR + @E;

SELECT * FROM FUNCIONARIO;



INSERT INTO DEPARTAMENTO(Dnome, Dnumero)
VALUES('Matriz', 1);
SET @E = @@ERROR + @E;

SELECT * FROM DEPARTAMENTO;



IF @E <> 0
	BEGIN
		ROLLBACK TRANSACTION;
		PRINT 'Erro detectado, Transação revertida';
	END
ELSE 
	BEGIN
		COMMIT TRANSACTION;
		PRINT 'Transação concluída com sucesso';
	END
GO


/*
inserir 3 funcionario João e dar update no salário deles
*/
