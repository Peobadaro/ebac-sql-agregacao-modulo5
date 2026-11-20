-- =====================================================================
-- EBAC - Exercício Módulo 5 (SQL / Agregação)
-- Agregações sobre as tabelas product e stock (relacionamento 1:N).
-- Pré-requisito: create_tables.sql, insert_data.sql e
-- alter_relationship.sql (Módulos 2, 3 e 4).
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1) Quantidade de itens em estoque de cada produto
--    Todas as colunas do SELECT que não são agregadas entram no GROUP BY.
-- ---------------------------------------------------------------------
SELECT p.sku,
       p.name,
       SUM(s.quantity) AS total_quantity
FROM product p
JOIN stock s ON s.product_id = p.id
GROUP BY p.sku, p.name
ORDER BY total_quantity DESC;

-- ---------------------------------------------------------------------
-- 2) Soma total de itens em estoque (todos os produtos e depósitos)
-- ---------------------------------------------------------------------
SELECT SUM(quantity) AS total_items_in_stock
FROM stock;

-- ---------------------------------------------------------------------
-- Extras com o restante do conteúdo do módulo
-- ---------------------------------------------------------------------

-- 3) Resumo por depósito: quantos produtos diferentes, total de itens
--    e média de itens por produto
SELECT warehouse,
       COUNT(DISTINCT product_id) AS products,
       SUM(quantity)              AS total_quantity,
       ROUND(AVG(quantity), 2)    AS avg_quantity
FROM stock
GROUP BY warehouse
ORDER BY total_quantity DESC;

-- 4) Valor do estoque (custo) por categoria, só categorias acima de R$ 10.000
SELECT p.category,
       SUM(s.quantity * p.cost_price) AS stock_value
FROM product p
JOIN stock s ON s.product_id = p.id
GROUP BY p.category
HAVING SUM(s.quantity * p.cost_price) > 10000
ORDER BY stock_value DESC;

-- 5) Categorias distintas de produtos (sem repetição)
SELECT DISTINCT category
FROM product
ORDER BY category;

-- 6) Top 3 produtos com mais itens, pulando o primeiro (LIMIT + OFFSET)
SELECT p.name,
       SUM(s.quantity) AS total_quantity
FROM product p
JOIN stock s ON s.product_id = p.id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 3 OFFSET 1;
