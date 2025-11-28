GO
CREATE DATABASE AULA

GO
USE AULA

GO

CREATE TABLE Pessoa(
	id INT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(150),
	Cidade VARCHAR(150),
	Estado CHAR(2),
	CPF CHAR(14)
)
GO


-- fazer o banco de dados ler o arquivo JSON

DECLARE @json NVARCHAR(MAX);

SELECT @json = BulkColumn
FROM OPENROWSET(
	BULK 'C:\Users\laboratorio\Downloads\data.json', -- local do arquivo
	--BULK 'C:\Users\laboratorio\Downloads\muitagente2.json', -- local do arquivo
	SINGLE_NCLOB
) AS J;


SELECT @json AS JsonCOMPLETO; -- as informações estão todas no @json

INSERT INTO Pessoa (Nome, Cidade, Estado, CPF) 
SELECT 
	nome,
	cidade,
	estado,
	cpf
FROM OPENJSON(@json)
WITH(
	Nome VARCHAR(150)	'$.nome',
	Cidade VARCHAR(150)	'$.cidade',
	Estado CHAR(2)		'$.estado',
	CPF VARCHAR(14)		'$.cpf'
);

-- selecionar
SELECT *
FROM Pessoa
ORDER BY Pessoa.Nome, Pessoa.Estado;

-- resetar a tabela
TRUNCATE TABLE Pessoa;


-- fazendo INDICE nas tabelas

CREATE INDEX IX_Pessoa_Nome_Estado
ON Pessoa(Nome, Estado)
