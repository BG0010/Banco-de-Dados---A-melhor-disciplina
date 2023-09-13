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
    
   
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;

  
    IF total_livros > 0 THEN
        SET categoria_tem_livros = TRUE;
    ELSE
        SET categoria_tem_livros = FALSE;
    END IF;
END;

--exercício 5 
CREATE PROCEDURE sp_LivrosAteAno(IN ano_fornecido INT)
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome, Livro.Ano_Publicacao
    FROM Livro
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
    WHERE Livro.Ano_Publicacao <= ano_fornecido
    ORDER BY Livro.Ano_Publicacao;
END;

exercício 6
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE livro_titulo VARCHAR(255);
    DECLARE cur CURSOR FOR
        SELECT Livro.Titulo
        FROM Livro
        INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
        WHERE Categoria.Nome = categoria_nome;
    
    -- Ignorar se a categoria não existe
    IF NOT EXISTS (SELECT 1 FROM Categoria WHERE Nome = categoria_nome) THEN
        SELECT 'Categoria não encontrada.';
    ELSE
        -- Inicializar o cursor
        OPEN cur;
    
        -- Loop para recuperar os títulos
        read_loop: LOOP
            FETCH cur INTO livro_titulo;
            IF done THEN
                LEAVE read_loop;
            END IF;
            
            -- Exibir o título do livro
            SELECT livro_titulo AS 'Título';
        END LOOP;
    
        -- Fechar o cursor
        CLOSE cur;
    END IF;
END;
