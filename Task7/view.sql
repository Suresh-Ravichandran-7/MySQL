CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Alice Johnson', 'alice@example.com', 'New York'),
(2, 'Bob Smith', 'bob@example.com', 'Chicago'),
(3, 'Charlie Brown', 'charlie@example.com', 'Los Angeles');

INSERT INTO Orders VALUES
(101, 1, '2025-08-01', 250.50),
(102, 2, '2025-08-05', 150.75),
(103, 1, '2025-08-10', 300.00),
(104, 3, '2025-08-12', 450.20);

CREATE VIEW CustomerOrders AS
SELECT o.order_id, c.name AS customer_name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

CREATE VIEW HighValueOrders AS
SELECT * FROM Orders
WHERE total_amount > 200;

CREATE VIEW NY_Customers AS
SELECT * FROM Customers
WHERE city = 'New York'
WITH CHECK OPTION;

SELECT * FROM CustomerOrders;

SELECT * FROM HighValueOrders;

INSERT INTO NY_Customers (customer_id, name, email, city)
VALUES (4, 'David Lee', 'david@example.com', 'New York');

INSERT INTO NY_Customers (customer_id, name, email, city)
VALUES (5, 'Emma Davis', 'emma@example.com', 'Chicago');

DROP VIEW HighValueOrders;
