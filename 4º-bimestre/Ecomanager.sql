create database Ecomanager;
USE ecoManager;

CREATE TABLE empresa(
 cnpj VARCHAR(18),
 endereço VARCHAR(50),
 cep varchar(8),
 telefone varchar(50),
 senha varchar(15),
 email varchar(50),
 primary key(cnpj)
 );

 CREATE TABLE administrador (  
 codigo int auto_increment,
 email VARCHAR(50),
 nome varchar(50),
 foto varchar(15),
 primary key(codigo)
 );

 CREATE TABLE usuario (
 cpf VARCHAR(14),
 nome varchar(50),
 cep varchar(10),
 complemento VARCHAR(50),
 FK_cnpj varchar(18),
 foto varchar(50),
 verificacaoMensal varchar(30),
verificacaoSemanal varchar(30),
verificacaoDiaria varchar(30),
senha varchar(8),
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


create table conta(
id int auto_increment,
fk_id_usuario varchar(14),
fk_verificacaomensal varchar(30),
fk_cep varchar(10),
fk_complemento VARCHAR(50),


foreign key(fk_id_usuario) references usuario(cpf),
foreign key(fk_verificacaomensal) references usuario(verificacaomensal),
foreign key(fk_cep) references usuario(cep),
foreign key(fk_complemento) references usuario(complemento),
primary key(fk_id_usuario, id)

);

create table historico (
 fk_verificacaomensal varchar(30),
fk_verificacaosemanal varchar(30),
fk_verificacaodiaria varchar(30),
fk_id_usuario varchar(14),
foreign key(fk_id_usuario) references usuario(cpf),
foreign key(fk_verificacaosemanal) references usuario(verificacaosemanal),
foreign key(fk_verificacaodiaria) references usuario(verificacaodiaria),
foreign key(fk_verificacaomensal) references usuario(verificacaomensal),
primary key(fk_id_usuario)
);