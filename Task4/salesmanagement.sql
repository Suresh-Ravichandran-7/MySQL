
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales (product_name, category, quantity, price) VALUES
('Laptop', 'Electronics', 3, 75000.00),
('Smartphone', 'Electronics', 5, 25000.00),
('Desk Chair', 'Furniture', 7, 4000.00),
('Dining Table', 'Furniture', 2, 12000.00),
('Pen Drive', 'Accessories', 10, 600.00),
('Notebook', 'Stationery', 50, 40.00),
('Monitor', 'Electronics', 4, 15000.00),
('Bookshelf', 'Furniture', 3, 7000.00),
('Pen', 'Stationery', 100, 10.00),
('Headphones', 'Electronics', 6, 2000.00);

SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM sales
GROUP BY category;

SELECT category, COUNT(*) AS total_sales
FROM sales
GROUP BY category;

SELECT category, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category;

SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
HAVING total_quantity > 10;

SELECT category, product_name, MAX(quantity * price) AS max_revenue
FROM sales
GROUP BY category, product_name;

SELECT category, COUNT(DISTINCT product_name) AS unique_products
FROM sales
GROUP BY category;
