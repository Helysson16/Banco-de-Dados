create database ecoManager;
USE ecoManager;

CREATE TABLE empresa(
 cnpj VARCHAR(18),
 endereço VARCHAR(50),
 cep varchar(8),
 telefone varchar(50),
 senha varchar(15),
 telefone varchar(30),
 email varchar(50),
 primary key(cnpj)
 );

 CREATE TABLE administrador (  
 codigo int auto_increment,
 email VARCHAR(50),
 nome varchar(50),
 primary key(codigo)
 );

 CREATE TABLE usuario (
 cpf VARCHAR(14),
 nome varchar(50),
 endereço VARCHAR(50),
 FK_cnpj varchar(18),
 foto varchar(50),
 verificacaomensal varchar(30),
verificacaosemanal varchar(30),
verificacaodiaria varchar(30),
 primary key(cpf),
 foreign key (FK_cnpj) references empresa(cnpj)
);

CREATE TABLE notificacao(
nome varchar(50),
fk_cpf varchar(14),
fk_cod_adm int,
data varchar(8),
foreign key (fk_cpf) references usuario(cpf),
foreign key (fk_cod_adm) references administrador(codigo)
);

create table teluser(
fk_cpf varchar(14),
telefone varchar(50),
foreign key (fk_cpf) references usuario(cpf),
primary key (fk_cpf, telefone)
);


 CREATE TABLE usuarioAdm (
  FK_cpf VARCHAR(14),
  FK_codigo int,
  foreign key (FK_cpf) references usuario(cpf),
  foreign key (FK_codigo) references administrador(codigo),
  primary key(FK_cpf, FK_codigo)
);

create table Admempresa (
  FK_empresa_cnpj varchar(18),
  FK_codigo int,
  foreign key (FK_empresa_cnpj) references empresa(cnpj),
  foreign key (FK_codigo) references administrador(codigo),
  primary key(FK_empresa_cnpj, FK_codigo)
);

create table meta(
fk_id_usuario varchar(14),
meta varchar (10),
id_meta int auto_increment,
mes_meta varchar(50),
foreign key(fk_id_usuario) references usuario(cpf),
primary key (id_meta)

);

create table relatorio (
fk_id_usuario varchar(14),
data_rel date,
id_rela int auto_increment,
foreign key(fk_id_usuario) references usuario(cpf),
primary key(id_rela)
);