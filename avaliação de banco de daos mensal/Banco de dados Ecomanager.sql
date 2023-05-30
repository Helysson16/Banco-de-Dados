create database ecoManager;
USE ecoManager;

 CREATE TABLE usuario (
 cpf VARCHAR(14),
 telefone VARCHAR(50),
 endereço VARCHAR(50),
 primary key(cpf)
);


CREATE TABLE administrador (  
 codigo int,
 email VARCHAR(50),
 primary key(codigo)
 );
 
 
 CREATE TABLE empresa (
 cnpj VARCHAR(18),
 telefone VARCHAR(50),
 endereço VARCHAR(50),
 primary key(cnpj)
 );
