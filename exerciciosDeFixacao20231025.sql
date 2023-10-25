--Crie um trigger que, após inserir um novo cliente na tabela Clientes, insira uma mensagem na tabela Auditoria informando a data e hora da inserção. exercício 1

create trigger adicionar after insert on Clientes
for each row  
insert into Auditoria (mensagem)
values(CONCAT('Um novo usuário foi adicionado', new.nome));
--para ver se deu certo, adicione um nome na tabela Clientes.

-- Antes de excluir um cliente da tabela Clientes, crie um trigger que insira uma mensagem na tabela Auditoria informando sobre a tentativa de exclusão

create trigger excluir before delete on Clientes
for each row
insert into Auditoria (mensagem)
values (CONCAT('O usuário deletou seu nome ', old.nome));