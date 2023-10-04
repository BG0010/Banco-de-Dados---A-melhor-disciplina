create table  nomes (
	nome varchar(50)
);

insert into nomes (nome) 
values ('Roberta'), ('Roberto'), ('Maria Clara'), ('João')

select UPPER(nome) as nome_maiusculo from nomes;
