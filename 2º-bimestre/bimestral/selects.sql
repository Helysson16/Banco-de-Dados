-- Qual é o preço médio, máximo e mínimo dos produtos?
SELECT AVG(preco) AS preco_medio, MAX(preco) AS preco_maximo, MIN(preco) AS preco_minimo
FROM produtos;

-- Quantos produtos existem em cada categoria?
SELECT categoria, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria;

-- Quais são as categorias distintas existentes na tabela de produtos?
SELECT DISTINCT categoria
FROM produtos;

-- Quais categorias possuem mais de 2 produtos?
SELECT categoria, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria
HAVING COUNT(*) > 2;

-- Quais são os produtos que possuem a palavra "Livro" em seu nome?
SELECT *
FROM produtos
WHERE nome LIKE '%Livro%';


-- Quais são os 3 produtos mais caros?
SELECT *
FROM produtos
ORDER BY preco DESC
LIMIT 3;

-- Quais produtos têm o preço dentro do intervalo de R$ 50 a R$ 100?
SELECT *
FROM produtos
WHERE preco BETWEEN 50 AND 100;

-- Quais são os produtos com ID 1, 3 e 5?
SELECT *
FROM produtos
WHERE id IN (1, 3, 5);

-- Qual é o valor total gasto em produtos da categoria "Eletrônicos"?
SELECT SUM(preco) AS valor_total_gasto
FROM produtos
WHERE categoria = 'Eletrônicos';

-- Quais são os produtos que pertencem às categorias "Vestuário" ou "Acessórios" e possuem um preço entre R$ 30 e R$ 50?
SELECT *
FROM produtos
WHERE categoria IN ('Vestuário', 'Acessórios') AND preco BETWEEN 30 AND 50;

