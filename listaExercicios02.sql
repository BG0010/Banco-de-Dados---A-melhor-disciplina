--exercício 1
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END;

--exercício 2
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
    WHERE Categoria.Nome = categoria_nome;
END;

--exercício 3
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoria_nome VARCHAR(100), OUT total_livros INT)
BEGIN
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
END;

--exercício 4
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoria_nome VARCHAR(100), OUT categoria_tem_livros BOOLEAN)
BEGIN
    DECLARE total_livros INT;
    
    -- Conta o número de livros na categoria especificada
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;

    -- Define a variável categoria_tem_livros com base no resultado
    IF total_livros > 0 THEN
        SET categoria_tem_livros = TRUE;
    ELSE
        SET categoria_tem_livros = FALSE;
    END IF;
END;
