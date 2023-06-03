CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Autores (
    id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento varchar(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT,
    id_categoria INT,
    ano_publicacao INT,
    editora VARCHAR(100),
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);





