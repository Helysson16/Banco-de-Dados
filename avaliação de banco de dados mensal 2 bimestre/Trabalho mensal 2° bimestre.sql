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
primary key(fk_cnpj)
);

 CREATE TABLE usuario (
 cpf VARCHAR(14),
 nome varchar(50),
 telefone VARCHAR(50),
 endereço VARCHAR(50),
 FK_cnpj varchar(18),
 primary key(cpf),
 foreign key (FK_cnpj) references empresa(cnpj)
);
create table teluser(
fk_cpf varchar(14),
telefone varchar(50),
foreign key (fk_cpf) references usuario(cpf),
primary key (fk_cpf)
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


 INSERT INTO usuario (cpf, nome, endereço) VALUES
('111.111.111-11', 'Helysson', 'Rua A, 123'),
('222.222.222-22', 'pedro',  'Rua B, 456'),
('333.333.333-33', 'rilary', 'Rua C, 789');

INSERT INTO administrador (codigo, email) VALUES
(1, 'hdfs1@aluno.ifal.edu.br'),
(2, 'phsc3@aluno.ifal.edu.br'),
(3, 'rrcs3@aluno.ifal.edu.br');

INSERT INTO empresa (cnpj, endereço) VALUES
('00.111.222/0001-11',  'Avenida X, 123'),
('00.222.333/0001-22', 'Avenida Y, 456'),
('00.333.444/0001-33', 'Avenida Z, 789');

INSERT INTO usuarioAdm (FK_cpf, FK_codigo) VALUES
('111.111.111-11', 001);


INSERT INTO Admempresa (FK_empresa_cnpj, FK_codigo) VALUES
('00.111.222/0001-11', 1);

insert into telepresa (fk_cnpj, telefone) values(
'00.111.222/0001-11', '111111111'
);
insert into teluser (fk_cpf, telefone) values(
'111.111.111-11', '12345678'
);