create database ecoManager;
USE ecoManager;

CREATE TABLE empresa(
 cnpj VARCHAR(18),
 telefone VARCHAR(50),
 endereço VARCHAR(50),
 primary key(cnpj)
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


CREATE TABLE administrador (  
 codigo int,
 email VARCHAR(50),
 primary key(codigo)
 );
 
 create table usuarioAdm (
 FK_cpf varchar(14),
 FK_cnpj varchar(18),
 
 foreign key (FK_cpf) references usuario(cpf),
 foreign key (FK_cnpj) references empresa(cnpj),
 primary key(FK_cpf, FK_cnpj)
);
 create table Admempresa(
 FK_empresa_cnpj varchar(18),
 FK_cpf_usuario varchar(14),
 foreign key (FK_empresa_cnpj) references empresa(cnpj),
 foreign key (FK_cpf_usuario) references usuario(cpf),
 primary key(FK_empresa_cnpj,FK_cpf_usuario)
 );

 INSERT INTO usuario (cpf, nome, telefone, endereço) VALUES
('111.111.111-11', 'Helysson', '1234567890', 'Rua A, 123'),
('222.222.222-22', 'pedro', '9876543210', 'Rua B, 456'),
('333.333.333-33', 'rilary', '5555555555', 'Rua C, 789');

INSERT INTO administrador (codigo, email) VALUES
(1, 'hdfs1@aluno.ifal.edu.br'),
(2, 'phsc3@aluno.ifal.edu.br'),
(3, 'rrcs3@aluno.ifal.edu.br');

INSERT INTO empresa (cnpj, telefone, endereço) VALUES
('00.111.222/0001-11', '1111111111', 'Avenida X, 123'),
('00.222.333/0001-22', '2222222222', 'Avenida Y, 456'),
('00.333.444/0001-33', '3333333333', 'Avenida Z, 789');

INSERT INTO usuarioAdm (FK_cpf, FK_cnpj) VALUES
('111.111.111-11', '00.111.222/0001-11');

INSERT INTO Admempresa (FK_empresa_cnpj, FK_cpf_usuario) VALUES
('00.111.222/0001-11', '111.111.111-11');