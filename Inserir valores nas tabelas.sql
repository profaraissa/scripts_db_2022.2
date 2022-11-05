-- insere valores na tabela banco
insert into banco values (2,'Caixa Economica Federal')

-- insere valores na tabela agencia
insert into agencia values  (2, 4)

-- seleciona todas as colunas e todas as linhas da tabela agencia
select * from agencia 

-- seleciona todas as colunas e apenas as linhas cujo p banco é banco do brasil 
select * from agencia where num_banco =1

-- seleciona apenas a coluna nome de todos os bancos 
select nom_banco from banco

-- seleciona agencia de determinado banco através do nome do banco

-- sub query
select * from agencia a where num_banco = (select num_banco from banco b where nom_banco = 'Caixa Economica Federal')

-- join (junção natural)
select 
	b.nom_banco Banco, 
	a.num_agencia Agencia
from 
	agencia a 
join 
	banco b on a.num_banco =b.num_banco 
where
	nom_banco = 'Caixa Economica Federal'