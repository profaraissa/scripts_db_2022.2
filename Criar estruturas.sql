-- cria base de dados
CREATE SCHEMA bancos_db;

use bancos_db;

create table banco(
	num_banco int(3) primary key, -- esse campo é identificador, portanto é unico e não pode ser nulo
	nom_banco varchar(30) unique
);


create table agencia (
	num_banco int(3) not null,
	num_agencia int(7) not null,
	primary key (num_banco, num_agencia),
	foreign key (num_banco) references banco(num_banco)
);

