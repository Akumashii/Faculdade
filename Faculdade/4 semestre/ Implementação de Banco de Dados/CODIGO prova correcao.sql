--	LISTE O NOME DOS ALUNO E SUAS RESPECTIVAS NOTAS NA DISCIPLINA "Banco de Dados"
SELECT A.Nome, HE.Nota
FROM DISCIPLINA AS D
	JOIN TURMA AS T
		ON D.Numero_disciplina = T.Numero_disciplina,
	ALUNO AS A,
	HISTORICO_ESCOLAR AS HE
WHERE D.Nome_disciplina = 'Banco de Dados'
	AND T.Identificacao_turma = HE.Identificacao_turma
	AND A.Numero_aluno = HE.Numero_aluno;

-- HERYSSON
SELECT 
	A.Nome AS 'Nome',
	HE.Nota AS 'Nota',
	D.Nome_disciplina AS 'Disciplina'
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE 
	ON A.Numero_aluno = HE.Numero_aluno
JOIN TURMA AS T 
	ON T.Identificacao_turma = HE.Identificacao_turma
JOIN DISCIPLINA AS D 
	ON T.Numero_disciplina = D.Numero_disciplina
WHERE D.Nome_disciplina = 'Banco de Dados';



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUAIS SÃO AS DICIPLINAS QUE TÊM PRÉ-REQUISITOS E QUAIS SÃO SEUS RESPECTIVOS PRÉ-REQUISITOS?

SELECT D.Nome_disciplina AS 'Disciplina', DPR.Nome_disciplina AS 'Pré-Requisito'
FROM DISCIPLINA AS DPR, DISCIPLINA AS D 
JOIN PRE_REQUISITO AS PR
	ON D.Numero_disciplina = PR.Numero_disciplina
WHERE DPR.Numero_disciplina = PR.Numero_pre_requisito;


-- HERYSSON

SELECT
	D.Numero_disciplina,
	D.Nome_disciplina AS 'Disciplina',
	PR.Numero_pre_requisito,
	DPR.Nome_disciplina AS 'Pre-Requisitos'
FROM DISCIPLINA AS D
JOIN PRE_REQUISITO AS PR
	ON PR.Numero_disciplina = D.Numero_disciplina
JOIN DISCIPLINA AS DPR
	ON PR.Numero_pre_requisito = DPR.Numero_disciplina


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- LISTE TODAS AS DISCIPLINAS CURSADAS PELO ALUNO 'Silva', MOSTRANDO O NOME DA DISCIPLINA, O SEMESTRE, O ANO E A NOTA FINAL

SELECT A.Nome, D.Nome_disciplina, T.Semestre, T.Ano, HE.Nota
FROM TURMA AS T,
	DISCIPLINA AS D,
	ALUNO AS A
	JOIN HISTORICO_ESCOLAR AS HE
		ON A.Numero_aluno = HE.Numero_aluno
WHERE A.Nome = 'Silva' 
	AND T.Numero_disciplina = D.Numero_disciplina
	AND T.Identificacao_turma = HE.Identificacao_turma;


-- HERYSSON

SELECT 
	A.Nome AS 'Nome',
	D.Nome_disciplina AS 'Disciplina',
	T.Semestre, 
	T.Ano, 
	HE.Nota
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE 
	ON A.Numero_aluno = HE.Numero_aluno
JOIN TURMA AS T 
	ON T.Identificacao_turma = HE.Identificacao_turma
JOIN DISCIPLINA AS D 
	ON T.Numero_disciplina = D.Numero_disciplina
WHERE A.Nome LIKE 'Silva';






------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CRIE UMA FUNÇÃO QUE VERIFIQUE SE O ALUNO FOI "APROVADO", "EM RECUPERAÇÃO", OU "REPROVADO" COM BASE NA NOTA FINAL
-- 'A' E 'B' - APROVADO
-- 'C' - RECUPERACAO
-- 'D' - REPROVADO

SELECT A.Nome, dbo.fn_Aprovacao(A.Nome, D.Nome_Disciplina) AS Aprovacao
FROM DISCIPLINA AS D
	JOIN TURMA AS T
		ON D.Numero_disciplina = T.Numero_disciplina,
	ALUNO AS A,
	HISTORICO_ESCOLAR AS HE
WHERE T.Identificacao_turma = HE.Identificacao_turma
	AND A.Numero_aluno = HE.Numero_aluno;

-- funcao
GO
CREATE FUNCTION fn_Aprovacao(@Nome_Aluno VARCHAR(50), @Disciplina VARCHAR(100))
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @Status CHAR(1);

	SELECT @Status = HE.Nota
	FROM DISCIPLINA AS D
		JOIN TURMA AS T
			ON D.Numero_disciplina = T.Numero_disciplina,
		ALUNO AS A,
		HISTORICO_ESCOLAR AS HE
	WHERE T.Identificacao_turma = HE.Identificacao_turma
		AND A.Numero_aluno = HE.Numero_aluno
		AND A.Nome = @Nome_Aluno
		AND D.Nome_disciplina = @Disciplina;
	
	IF @Status = 'A' OR @Status = 'B'
		RETURN 'Aprovado';
	ELSE IF @Status = 'C'
		RETURN 'Recuperação';
	ELSE
		RETURN 'Reprovado';
	
	RETURN ''
END;
GO
-- HERYSSON

GO
CREATE OR ALTER FUNCTION fn_StatusAprovacaoAluno
(
	@NomeAluno VARCHAR(50),
	@NomeDisciplina VARCHAR(100)
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @nota CHAR(1);
	DECLARE @status VARCHAR(20);

	SELECT 
		@nota = HE.Nota
	FROM ALUNO AS A
	JOIN HISTORICO_ESCOLAR AS HE 
		ON A.Numero_aluno = HE.Numero_aluno
	JOIN TURMA AS T 
		ON T.Identificacao_turma = HE.Identificacao_turma
	JOIN DISCIPLINA AS D 
		ON T.Numero_disciplina = D.Numero_disciplina
	WHERE A.Nome LIKE @NomeAluno
		AND D.Nome_disciplina LIKE @NomeDisciplina;


	IF @nota IN ('A', 'B')
		SET @status = 'Aprovado';
	ELSE IF @nota = 'C'
		SET @status = 'Em Recuperação'
	ELSE IF @nota = 'F'
		SET @status = 'Reprovado'
	ELSE
		SET @status = 'Sem Registro'

	RETURN @status;
END;
GO

SELECT dbo.fn_StatusAprovacaoAluno('Silva', 'Introdução à ciência da computação') AS 'Status';







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
CRIE UMA FUNCAO QUE CONVERTA AS NOTAS 'A', 'B', 'C', 'F' PARA VALORES 10, 9, 8 E 0
DEPOIS LISTA O NOME DE TODOS OS ALUNOS, DISCIPLINAS CURSADAS, E SUAS NOTAS NUMERICAS
*/

SELECT A.Nome, D.Nome_disciplina, dbo.fn_Nota_para_INT(A.Nome, D.Nome_Disciplina) AS Nota_Numerica
FROM DISCIPLINA AS D
	JOIN TURMA AS T
		ON D.Numero_disciplina = T.Numero_disciplina,
	ALUNO AS A,
	HISTORICO_ESCOLAR AS HE
WHERE T.Identificacao_turma = HE.Identificacao_turma
	AND A.Numero_aluno = HE.Numero_aluno;


CREATE FUNCTION fn_Nota_para_INT(@Nome_Aluno VARCHAR(50), @Disciplina VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @Status CHAR(1);

	SELECT @Status = HE.Nota
	FROM DISCIPLINA AS D
		JOIN TURMA AS T
			ON D.Numero_disciplina = T.Numero_disciplina,
		ALUNO AS A,
		HISTORICO_ESCOLAR AS HE
	WHERE T.Identificacao_turma = HE.Identificacao_turma
		AND A.Numero_aluno = HE.Numero_aluno
		AND A.Nome = @Nome_Aluno
		AND D.Nome_disciplina = @Disciplina;
	
	IF @Status = 'A' 
		RETURN 10

	ELSE IF @Status = 'B'
		RETURN 9;

	ELSE IF @Status = 'C'
		RETURN 8;

	ELSE
		RETURN 0;

	
	RETURN ''
END;


-- HERYSSON
GO
CREATE FUNCTION fn_NotaParaNumero(@nota CHAR(1))
RETURNS INT
AS
BEGIN
	DECLARE @n INT;
	IF @nota = 'A'
		SET @n = 10;
	IF @nota = 'B'
		SET @n = 9;
	IF @nota = 'C'
		SET @n = 8;
	IF @nota = 'F'
		SET @n = 0;
	RETURN @n;
END;
GO

SELECT 
	A.Nome AS 'Nome',
	D.Nome_disciplina AS 'Disciplina',
	HE.Nota AS 'Conceito',
	dbo.fn_NotaParaNumero(HE.Nota) AS 'Nota'
FROM ALUNO AS A
JOIN HISTORICO_ESCOLAR AS HE 
	ON A.Numero_aluno = HE.Numero_aluno
JOIN TURMA AS T 
	ON T.Identificacao_turma = HE.Identificacao_turma
JOIN DISCIPLINA AS D 
	ON T.Numero_disciplina = D.Numero_disciplina





------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
CRIE UMA FUNCAO PARA VERIFICAR SE UMA TURMA ESTA 'COMPLETAMENTE LOTADA', 'QUASE LOTADA', OU 'COM VAGAS'. 
DEPOIS FACA UMA CONSULTA QUE MOSTRE A IDENTIFICACAO DA TURMA, NOME DA DISCIPLINA, NUMERO DE ALUNOS, E O STATUS DE LOTACO, CONTENDO TODAS AS TURMAS. 
PARA DETERMINACAO DOS STATUS CONSIDERE
- 5 OU MAIS ALUNO - 'COMPLETAMENTE LOTADA'
- 3 A 4 - 'QUASE LOTADA'
- MENOS DE 3 - 'COM VAGAS'
*/


SELECT D.Nome_Disciplina, dbo.fn_VagasTurma(D.Nome_Disciplina) AS 'Status'
FROM DISCIPLINA AS D;

GO
CREATE FUNCTION fn_VagasTurma(@disciplina VARCHAR(50))
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @contadora INT
	SELECT @contadora = COUNT(D.Nome_disciplina)
	FROM DISCIPLINA AS D
		JOIN TURMA AS T
			ON D.Numero_disciplina = T.Numero_disciplina,
		ALUNO AS A,
		HISTORICO_ESCOLAR AS HE
	WHERE  T.Identificacao_turma = HE.Identificacao_turma
		AND A.Numero_aluno = HE.Numero_aluno
		AND D.Nome_disciplina = @disciplina
	GROUP BY D.Nome_disciplina;

	IF @contadora > 5
		RETURN 'COMPLETAMENTE LOTADA'
	ELSE IF @contadora > 3 AND @contadora < 4
		RETURN 'QUASE CHEIA'
	ELSE
		RETURN 'COM VAGAS'

	RETURN ''
END;
GO

-- HERYSSON

GO
CREATE FUNCTION fn_StatusLocacao (@idTurma INT)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @qtd INT, @status VARCHAR(30);

	SELECT @qtd = COUNT(HE.Numero_aluno)
	FROM HISTORICO_ESCOLAR AS HE
	WHERE HE.Identificacao_turma = @idTurma;

	IF @qtd >= 5
		SET @status = 'COMPLETAMENTE LOTADA'
	ELSE IF @qtd BETWEEN 3 AND 4 
		SET @status = 'QUASE CHEIA'
	ELSE
		SET @status = 'COM VAGAS'

	RETURN @status;
END;
GO

SELECT DISTINCT
	HE.Identificacao_turma,
	dbo.fn_StatusLocacao(HE.Identificacao_turma)
FROM HISTORICO_ESCOLAR AS HE;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- CRIE UM PROCEDIMENTO ARMAZENADO CHAMADO usp_CalcularIdadeAluno QUE RECEBA O NUMERO DO ALUNO COMO PARAMETRO E EXIBA A IDADE CORRETA DO ALUNO

EXECUTE usp_CalcularIdadeAluno 3;

-- procedimento
GO
CREATE PROCEDURE usp_CalcularIdadeAluno
	@numero_aluno 
AS
BEGIN
	DECLARE @idade INT;
	DECLARE @data_nasc DATE;

	SELECT @data_nasc = A.Data_Nascimento
	FROM ALUNO AS A
	WHERE @numero_aluno = A.Numero_aluno;

	IF (YEAR(GETDATE()) > YEAR(@data_nasc) 
		AND MONTH(GETDATE()) > MONTH(@data_nasc) 
		AND DAY(GETDATE()) > DAY(@data_nasc))
		SET @idade = YEAR(GETDATE()) - YEAR(@data_nasc);
	ELSE
		SET @idade = YEAR(GETDATE()) - YEAR(@data_nasc) - 1;
	
	PRINT @idade;
END;
GO

-- HERYSSON

GO
CREATE OR ALTER PROCEDURE usp_CalcularIdade
	@NumeroAluno INT
AS 
BEGIN
	DECLARE @nasc DATE;
	DECLARE @idade INT;

	SELECT @nasc = A.Data_Nascimento
	FROM ALUNO AS A
	WHERE A.Numero_aluno = @NumeroAluno

	SET @idade = DATEDIFF(YEAR, @nasc, GETDATE());

	IF(MONTH(@nasc) > MONTH(GETDATE()))
		OR (MONTH(@nasc) = MONTH(GETDATE()) AND DAY(@nasc) > DAY(GETDATE()))
		SET @idade = @idade - 1;
	
	SELECT @idade as 'Idade';
END;
GO

EXEC dbo.usp_CalcularIdade 11;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 
CRIE UMA PROCEDURE usp_AtualizarNota QUE RECEBA O NUMERO DO ALUNO, A IDENTIFICACAO DA TURMA E A NOVA NOTA COMO PARAMETROS 
E ATUALIZE A NOTA DO ALUNO NO HISTORICO ESCOLAR, E EXIBA UMA MENSAGEM DE SUCESSO OU FALHA
*/

EXEC usp_AtualizarNota 17, 112, 'A';

GO
CREATE PROCEDURE usp_AtualizarNota
	@num_aluno INT,
	@id_turma INT,
	@nova_nota CHAR
AS
BEGIN
	UPDATE HISTORICO_ESCOLAR SET Nota = @nova_nota WHERE Numero_aluno = @num_aluno AND Identificacao_turma = @id_turma;
	
	IF @@ROWCOUNT != 0
		PRINT 'Sucesso na mudança de nota!';
	ELSE
		PRINT 'Falha na mudança de nota...';
END;
GO

-- HERYSSON 

GO
CREATE PROCEDURE usp_UpdateNota
	@numeroAluno INT,
	@idTurma INT,
	@novaNota CHAR(1)
AS
BEGIN
	UPDATE HISTORICO_ESCOLAR
	SET Nota = @novaNota
	WHERE
		Numero_aluno = @numeroAluno
		AND Identificacao_turma = @idTurma;

	IF @@ROWCOUNT = 1
		PRINT 'Nota Atualizada'
	ELSE
		PRINT 'Falha: registro não encontrado'
END;
GO

EXEC dbo.usp_UpdateNota 10, 85, 'F';

SELECT * FROM HISTORICO_ESCOLAR;

