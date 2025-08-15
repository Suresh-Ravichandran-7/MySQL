
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 150.00),
(1, '2025-08-05', 600.00),
(2, '2025-08-02', 250.00),
(3, '2025-08-03', 1000.00);


DELIMITER $$

CREATE PROCEDURE GetCustomerOrders (
    IN p_customer_id INT,
    IN p_min_amount DECIMAL(10,2)
)
BEGIN
    SELECT order_id, order_date, total_amount
    FROM orders
    WHERE customer_id = p_customer_id
      AND total_amount >= p_min_amount
    ORDER BY order_date DESC;
END $$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION CalculateDiscount (
    p_total_amount DECIMAL(10,2)
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);
    IF p_total_amount >= 500 THEN
        SET discount = p_total_amount * 0.10;
    ELSEIF p_total_amount >= 200 THEN
        SET discount = p_total_amount * 0.05;
    ELSE
        SET discount = 0.00;
    END IF;
    RETURN discount;
END $$

DELIMITER ;


