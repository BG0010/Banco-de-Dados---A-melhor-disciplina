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
