CREATE DATABASE restricoes
GO

USE restricoes
GO

-- RESTRICOES criação tabela petShop

CREATE TABLE petShop
(
	id INT PRIMARY KEY IDENTITY,
	nomeDono VARCHAR(50) UNIQUE,
	nomePet VARCHAR(50) NOT NULL,
	idadePet INT CHECK(idadePet>0),
	sexoPet CHAR CHECK(sexoPet IN ('M', 'F', 'N'))
);

-- testando restrições
INSERT INTO petShop VALUES('Frazzon', 'Zoe', 4, 'F');

SELECT * FROM petShop;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RESTRICOES criação tabela Produto

CREATE TABLE Produto
(
	cod INT PRIMARY KEY,
	nome VARCHAR(50),
	categoria VARCHAR(50)
);

CREATE TABLE Inventario
(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT, 
	quantidade INT,
	minLevel INT,
	maxLevel INT,
	CONSTRAINT fk_inv_produto
		FOREIGN KEY(codProduto)
		REFERENCES Produto (cod)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- outra forma de criar restrições
ALTER TABLE Inventario
ADD CONSTRAINT fk_inv_produto
	FOREIGN KEY(codProduto)
	REFERENCES Produto (cod)
	ON DELETE CASCADE
	ON UPDATE CASCADE

-- Cadastrando produtos

INSERT INTO Produto 
VALUES 
	(1, 'Sabão', 'Higiene'),
	(2, 'Coca', 'Bebidas'),
	(3, 'Brahma Litro', 'Bebidas'),
	(4, 'Belinha', 'Bebidas'),
	(5, 'Catuaba', 'Bebidas'),
	(6, 'Energético', 'Bebidas');

INSERT INTO Inventario (codProduto, quantidade, minLevel, maxLevel)
VALUES
	(1, 8, 2, 20),
	(2, 100, 80, 200),
	(3, 1000, 800, 5000),
	(4, 5, 1, 10),
	(5, 15, 10, 100),
	(6, 200, 100, 500);

SELECT * 
FROM Produto AS P
INNER JOIN Inventario AS I 
	ON I.codProduto = P.cod

-- deletar Sabao
-- já que utilizamos CASCADE conseguimos deletar sem problemas
DELETE FROM Produto 
WHERE cod = 4;

-- update 
-- também foi utilizado CASCADE então conseguimos dar update sem problemas
UPDATE Produto
SET cod = 2
WHERE cod = 87655;

CREATE TABLE Venda
(
	id INT PRIMARY KEY IDENTITY,
	codProduto INT,
	quantidade INT
);

ALTER TABLE Venda
ADD CONSTRAINT fk_Venda_produto
FOREIGN KEY(codProduto)
	REFERENCES Produto(cod)
	ON DELETE SET NULL
	ON UPDATE CASCADE;

-- SIMULANDO algumas vendas

INSERT INTO Venda
VALUES 
	(87655, 5),
	(3, 10),
	(3, 20),
	(3, 5),
	(5, 1),
	(4, 2),
	(6, 4);

SELECT * 
FROM Produto AS P
RIGHT JOIN Venda AS V
	ON V.codProduto = P.cod

ALTER TABLE Venda DROP CONSTRAINT fk_Venda_produto;



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------









-- utilizando o banco BIBLIOTECA, crie uam view para retornar todas as informações conforme tabela abaixo:
-- ISBN, Titulo, Ano, Editora, Autor/Nacionalidade, Categoria
GO
CREATE OR ALTER VIEW livros AS
SELECT 
	L.isbn AS 'ISBN', 
	L.titulo AS 'Título', 
	L.ano AS 'Ano', 
	E.nome AS 'Editora', 
	A.nome + ' (' + A.nacionalidade + ')'  AS 'Autor/Nacionalidade', 
	-- CONCAT( A.nome, ' (', A.nacionalidade,') ')
	C.tipo_categoria AS 'Categoria' 
FROM 
	Livro AS L 
	JOIN Editora AS E ON L.fk_editora = E.id
	JOIN Categoria AS C ON L.fk_categoria = C.id
	JOIN LivroAutor AS LA ON L.ISBN = LA.fk_livro
	JOIN Autor AS A ON LA.fk_autor = A.id
GO

SELECT * FROM livros ORDER BY Título;

-- 
