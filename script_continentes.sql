CREATE schema if not exists mapa_mundi;

use mapa_mundi;

create table if not exists continente(
	num_continente int primary key,
	nom_continente varchar(20)
);

create table if not exists pais(
	num_pais int,
	num_continente int,
	nom_pais varchar(20),
	primary key (num_pais, num_continente),
	foreign key (num_continente) references continente(num_continente)
	on delete cascade
);

create table if not exists estado(
	num_pais int,
	num_continente int,
	nom_uf char(2),
	nom_estado varchar(20),
	primary key(num_continente, num_pais),
	foreign key (num_continente) references continente(num_continente)
	on delete cascade,
	foreign key (num_pais) references pais(num_pais)
	on delete cascade
);

create table if not exists cidade(
	num_pais int,
	num_continente int,
	num_municipio int,
	nom_municipio varchar(20),
	primary key(num_continente, num_pais, num_municipio),
	foreign key (num_continente) references continente(num_continente)
	on delete cascade,
	foreign key (num_pais) references pais(num_pais)
	on delete cascade
);

create table if not exists bairro(
	num_pais int,
	num_continente int,
	num_municipio int,
	nom_bairro varchar(20),
	primary key(num_continente, num_pais,num_municipio)
);

create table if not exists cep(
	num_pais int,
	num_continente int,
	num_municipio int,
	num_cep int,
	nom_logradouro varchar(60),
	primary key(num_continente, num_pais,num_municipio, num_cep)
);




	
	
	
alter table bairro add constraint fk_continente foreign key (num_continente) references continente(num_continente)
	on delete cascade;


alter table bairro add constraint fk_pais foreign key (num_pais) references pais(num_pais)
	on delete cascade;

alter table bairro add constraint fk_cidade foreign key (num_municipio) references cidade(num_municipio)
	on delete cascade;


alter table cep add foreign key (num_continente) references continente(num_continente)
	on delete cascade;

alter table cep add foreign key (num_pais) references pais(num_pais)
	on delete cascade;

alter table cep add foreign key (num_municipio) references cidade(num_municipio)
	on delete cascade;

