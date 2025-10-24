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
