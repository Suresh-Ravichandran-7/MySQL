CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'New York');

INSERT INTO Products VALUES
(1, 'Laptop', 1200),
(2, 'Phone', 800),
(3, 'Tablet', 500),
(4, 'Monitor', 300);

INSERT INTO Orders VALUES
(101, 1, '2024-01-15', 1500),
(102, 1, '2024-02-10', 700),
(103, 2, '2024-03-05', 400),
(104, 3, '2024-04-12', 900),
(105, 4, '2024-05-20', 1300);

INSERT INTO OrderDetails VALUES
(101, 1, 1),
(102, 2, 1),
(103, 3, 1),
(104, 2, 1),
(105, 1, 1);

SELECT 
    c.customer_id,
    c.name,
    (SELECT AVG(total_amount) FROM Orders) AS avg_order_value,
    (SELECT SUM(o.total_amount) 
     FROM Orders o 
     WHERE o.customer_id = c.customer_id) AS total_spent
FROM Customers c;

SELECT customer_id, name
FROM Customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE total_amount > 500
);

SELECT c.customer_id, c.name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    JOIN OrderDetails od ON o.order_id = od.order_id
    JOIN Products p ON p.product_id = od.product_id
    WHERE o.customer_id = c.customer_id
      AND p.product_name = 'Laptop'
);

SELECT o.order_id, o.customer_id, o.total_amount
FROM Orders o
WHERE o.total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
    WHERE customer_id = o.customer_id
);

SELECT dt.customer_id, dt.total_spent
FROM (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM Orders
    GROUP BY customer_id
) AS dt
ORDER BY dt.total_spent DESC;

SELECT * FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
    WHERE product_id IN (
        SELECT DISTINCT od.product_id
        FROM OrderDetails od
        JOIN Orders o ON od.order_id = o.order_id
        JOIN Customers c ON o.customer_id = c.customer_id
        WHERE c.city = 'New York'
    )
);
