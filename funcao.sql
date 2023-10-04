create table  nomes (
	nome varchar(50)
);

insert into nomes (nome) 
values ('Roberta'), ('Roberto'), ('Maria Clara'), ('João')

select UPPER(nome) as nome_maiusculo from nomes;

select nome, LENGHT(nome) as tamanho from nomes;

elect case when nome like "João%" then "Sr. " nome end as nome-com-tratamento from nomes;
