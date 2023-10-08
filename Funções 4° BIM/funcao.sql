create table  nomes (
	nome varchar(50)
);

insert into nomes (nome) 
values ('Roberta'), ('Roberto'), ('Maria Clara'), ('João')

select UPPER(nome) as nome_maiusculo from nomes;

select nome, LENGHT(nome) as tamanho from nomes;

SELECT
    CASE
        WHEN nome LIKE 'João%' THEN 'Sr. '  nome
        ELSE 'Sra. '  nome
    END AS nome_com_tratamento
FROM nomes;

CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade) VALUES
    ('Produto A', 10.99, 5),
    ('Produto B', 5.49, 0),
    ('Produto C', 15.99, -2);

SELECT produto, ROUND(preco, 2) AS preco_arredondado FROM produtos;

SELECT produto, ABS(quantidade) AS quantidade_absoluta FROM produtos;

SELECT AVG(preco) AS media_precos FROM produtos;


-- Função de Data
CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2023-10-01'),
    ('2023-10-05'),
    ('2023-10-10');

INSERT INTO eventos (data_evento) VALUES (NOW());

SELECT
    data_evento,
    DATEDIFF(data_evento, '2023-10-01') AS dias_entre_datas
FROM eventos;

SELECT
    data_evento,
    DAYNAME(data_evento) AS nome_dia_semana
FROM eventos;

--Controle de Fluxo
SELECT
    produto,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

SELECT
    produto,
    CASE
        WHEN preco < 10.0 THEN 'Barato'
        WHEN preco >= 10.0 AND preco < 20.0 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;

--Função Personalizada
DELIMITER //
CREATE PROCEDURE calcular_fatorial(IN numero INT, OUT resultado INT)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE fatorial INT DEFAULT 1;
  
  WHILE i <= numero DO
    SET fatorial = fatorial * i;
    SET i = i + 1;
  END WHILE;
  
  SET resultado = fatorial;
END;
//
DELIMITER ;

CREATE OR REPLACE FUNCTION f_exponencial(base NUMERIC, expoente NUMERIC)
RETURNS NUMERIC AS
BEGIN
  RETURN POWER(base, expoente);
END;
