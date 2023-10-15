DELIMITER //
CREATE FUNCTION total_livros_por_genero(genero_nome VARCHAR(200))
RETURNS INT
BEGIN
    DECLARE total_livros INT;
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    WHERE id_genero = (SELECT id FROM Genero WHERE nome_genero = genero_nome);
    RETURN total_livros;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION listar_livros_por_autor(primeiro_nome_autor VARCHAR(255), ultimo_nome_autor VARCHAR(255))
RETURNS TEXT
BEGIN
    DECLARE livro_list TEXT;
    SET livro_list = '';
    
    DECLARE livro_id INT;
    
    DECLARE cur CURSOR FOR
    SELECT LA.id_livro
    FROM Livro_Autor AS LA
    INNER JOIN Autor AS A ON LA.id_autor = A.id
    WHERE A.primeiro_nome = primeiro_nome_autor AND A.ultimo_nome = ultimo_nome_autor;

    OPEN cur;
    
    FETCH cur INTO livro_id;
    
    WHILE NOT cur NOT FOUND DO
        SELECT titulo INTO livro_list
        FROM Livro
        WHERE id = livro_id;
        
        SET livro_list = CONCAT(livro_list, titulo, ', ');
        
        FETCH cur INTO livro_id;
    END WHILE;

    CLOSE cur;
    
    RETURN livro_list;
END;
//
DELIMITER ;
