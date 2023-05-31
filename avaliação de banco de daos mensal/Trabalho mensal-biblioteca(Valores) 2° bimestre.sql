INSERT INTO Autores (id_autor, nome, data_nascimento, nacionalidade)
VALUES(1, 'Collen Hoover', '1979-11-12', 'Americano'),
    (2, 'Machado de Assis', '1839', 'Brasileiro'),
    (3, 'William Shakespeare', '1564', 'Francês');

INSERT INTO Categorias (id_categoria, nome)
VALUES(1, 'Romance'),
    (2, 'Ficção'),
    (3, 'Drama');

INSERT INTO Livros (id_livro, titulo, id_autor, id_categoria, editora)
VALUES (1, 'É assim que começa', 1, 1, 'Galera Record'),
    (2, 'É assim que termina', 1, 1, 'Galera Record'),
    (3, 'Romeu e Julieta', 3, 3, 'Alguma aí, é mt antigo'),
    (4, 'Hamlet', 3, 3, 'Alguma aí, é mt antigo'),
    (5, 'Memórias Póstumas de Brás Cubas', 2, 2, 'Não consegui Achar'),
    (6, 'Dom Casmurro', 2, 2 , 'Não conseguir achar');