-- Procedure
-- Crie um procedimento que exiba seu nome.
ALTER PROCEDURE usp_exibeNome 
	@nome varchar(50) 
AS
BEGIN
	PRINT 'Seu nome é: ' + @nome;
END;


EXEC usp_exibeNome 'Frazzon';

-- Procedure
-- Crie um procedure que liste o nome completo dos funcionários e o nome dos seus respectivos departamentos.
ALTER PROCEDURE usp_listaDadosFunc 
AS
BEGIN
	SELECT F.Pnome+' '+F.Minicial+'. '+F.Unome AS Nome, D.Dnome AS Departamento
	FROM FUNCIONARIO AS F
	FULL JOIN DEPARTAMENTO AS D
		ON F.Dnr = D.Dnumero
END

EXEC usp_listaDadosFunc;

-- Criptografia

CREATE PROCEDURE usp_Funcionario
WITH ENCRYPTION
AS
SELECT *
FROM FUNCIONARIO

EXEC sp_helptext usp_Funcionario; -- nao da pra ver 

-- Procedure UPDATE
/* 
Crie uma procedure que atualiza o salário de um funcionário baseado no CPF
se não encontrar nenhum funcionário com o CPF passado exiba uma mensagem.
*/

ALTER PROCEDURE usp_atualizaSalario 
	@CPF VARCHAR(11),
	@NovoSalario DECIMAL(10,2)
AS
BEGIN
	--Atualiza
	UPDATE FUNCIONARIO
	SET Salario = @NovoSalario
	WHERE Cpf = @CPF

	IF @@ROWCOUNT = 0 
		PRINT 'CPF NÃO ENCONTRADO'
END

DECLARE @CPF VARCHAR(11);
SET @CPF = '88866555576'

EXEC usp_atualizaSalario @CPF, 55000


-- Procedure
/*
Crie um procedure que insira um novo funcionário mas antes verifique se já
não existe um funcionário com o mesmo nome (nome completo)
*/

CREATE PROCEDURE usp_InserirFuncionario
	@Pnome VARCHAR(15),
	@Minicial CHAR(1),
	@Unome VARCHAR(15),
	@Cpf CHAR(11)
AS
BEGIN
	IF EXISTS(	
		SELECT *
		FROM FUNCIONARIO AS F
		WHERE F.Pnome = @Pnome
			AND F.Minicial = @Minicial
			AND F.Unome = @Unome
		)
	BEGIN 
		PRINT 'JÁ EXISTE UM FUNCIONARIO COM ESTE NOME.'
		RETURN;
	END
	INSERT INTO FUNCIONARIO(Pnome, Minicial, Unome, Cpf)
	VALUES(@Pnome, @Minicial, @Unome, @Cpf);
END

EXEC usp_InserirFuncionario 'Guilherme', 'F', 'Rolim', '05805805805';
EXEC usp_InserirFuncionario 'Vanessa', 'C', 'Nascimento', '10710710719';
EXEC usp_InserirFuncionario 'Luiza', 'L', 'Karlec', '76076076076018';


-- REFAZER REFAZER 
-- Procedure
-- Crie um procedure que insira um novo departamento com sua respectiva localidade
CREATE PROCEDURE usp_InserirDepartamento
	@NomeDepartamento VARCHAR(50),
	@LocalDepartamento VARCHAR(50)
AS
BEGIN
	IF EXISTS(	
		SELECT *
		FROM DEPARTAMENTO AS D
		FULL JOIN LOCALIZACAO_DEP AS L
			ON L.Dnumero = D.Dnumero
		WHERE D.Dnome = @NomeDepartamento
			AND L.Dlocal = @LocalDepartamento
		)
	BEGIN 
		PRINT 'JÁ EXISTE UM DEPARTAMENTO NESTE LOCAL.'
		RETURN;
	END
	INSERT INTO DEPARTAMENTO(Dnome, )
	VALUES();
END


-- Procedure
/*
Crie um procedure que faz uma listagem dos funcionários por departamento, mas
se o departamento não for especificado, o procedimento lista todos os funcionarios
*/

ALTER PROCEDURE usp_ListaFuncDep 
	@NomeDepartamento VARCHAR(50)
	= NULL
AS
BEGIN
	
	IF @NomeDepartamento IS NOT NULL
		BEGIN
			SELECT *
			FROM FUNCIONARIO AS F
			FULL JOIN DEPARTAMENTO AS D
				ON F.Dnr = D.Dnumero
			WHERE @NomeDepartamento = D.Dnome;
		END
	ELSE
		BEGIN 
			SELECT *
			FROM FUNCIONARIO;
		END
END

EXEC usp_ListaFuncDep 'Pesquisa'


-- Procedure Parametro de Saída
CREATE PROCEDURE usp_dobro (@valor as INT OUTPUT)
AS
SELECT @valor*2
RETURN

DECLARE @custo AS INT = 15;
EXEC usp_dobro @custo OUTPUT;
SELECT @custo
