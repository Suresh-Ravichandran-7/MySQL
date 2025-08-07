CREATE SCHEMA employeemanagementsystem;

use employeemanagementsystem;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, age, department, salary) VALUES
('Alice Johnson', 30, 'HR', 45000.00),
('Bob Smith', 42, 'Finance', 60000.00),
('Charlie Brown', 28, 'IT', 52000.00),
('David Miller', 35, 'HR', 48000.00),
('Ella Davis', 31, 'IT', 58000.00),
('Frank Moore', 50, 'Finance', 75000.00);

SELECT * FROM employees;

SELECT name, department FROM employees;

SELECT * FROM employees
WHERE age > 30;

SELECT * FROM employees
WHERE department = 'HR' AND salary > 46000;

SELECT * FROM employees
WHERE name LIKE '%Smith%';

SELECT * FROM employees
WHERE salary BETWEEN 45000 AND 60000;

SELECT * FROM employees
ORDER BY name;

SELECT * FROM employees
ORDER BY salary DESC;

SELECT * FROM employees
LIMIT 3;

SELECT name AS employee_name, salary AS employee_salary
FROM employees;

SELECT DISTINCT department FROM employees;

SELECT * FROM employees
WHERE department = 'Finance';

SELECT * FROM employees
WHERE department IN ('Finance', 'IT');
