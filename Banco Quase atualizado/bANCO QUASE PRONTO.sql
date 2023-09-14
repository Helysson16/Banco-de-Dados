create database ecoManager;
USE ecoManager;

CREATE TABLE empresa(
 cnpj VARCHAR(18),
 endereço VARCHAR(50),
 primary key(cnpj)
 );

CREATE TABLE telepresa(
fk_cnpj VARCHAR(18),
telefone VARCHAR(50),
foreign key (fk_cnpj) references empresa(cnpj),
primary key(fk_cnpj, telefone)
);

 CREATE TABLE usuario (
 cpf VARCHAR(14),
 nome varchar(50),
 endereço VARCHAR(50),
 FK_cnpj varchar(18),
 primary key(cpf),
 foreign key (FK_cnpj) references empresa(cnpj)
);
create table teluser(
fk_cpf varchar(14),
telefone varchar(50),
foreign key (fk_cpf) references usuario(cpf),
primary key (fk_cpf, telefone)
);


CREATE TABLE administrador (  
 codigo int auto_increment,
 email VARCHAR(50),
 primary key(codigo)
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

create table login_g(
fk_id_usuario varchar(14),
gmail varchar(50),
foto varchar(10),
id_login_g int auto_increment,
foreign key(fk_id_usuario) references usuario(cpf),
primary key(id_login_g)
);

create table login_f(
fk_id_usuario varchar(14),
usuário varchar(50),
foto varchar(10),
id_login_f int auto_increment,
foreign key(fk_id_usuario) references usuario(cpf),
primary key(id_login_f)
);

create table login_a(
fk_id_usuario varchar(14),
appleUser varchar(50),
foto varchar(10),
id_login_a int auto_increment,
foreign key(fk_id_usuario) references usuario(cpf),
primary key(id_login_a)
);

create table meta(
fk_id_usuario varchar(14),
meta varchar (10),
id_meta int auto_increment,
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