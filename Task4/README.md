# Task 4 – Aggregate Functions & Grouping

## Objective
Practice summarizing and analyzing data using SQL aggregate functions (`SUM`, `AVG`, `COUNT`) along with `GROUP BY` and `HAVING`.

## Tools Used
- MySQL Workbench 

## Table Used
**sales**
- sale_id (INT, Primary Key)
- product_name (VARCHAR)
- category (VARCHAR)
- quantity (INT)
- price (DECIMAL)

## Concepts Practiced
- `SUM()` – Total of numeric column
- `AVG()` – Average value
- `COUNT()` and `COUNT(DISTINCT)`
- `GROUP BY` – Categorizing data
- `HAVING` – Filtering aggregated results
- `ROUND()` – Formatting numeric values
- `MAX()` – Finding maximum value

## Sample Queries
```sql
-- Total quantity per category
SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;

-- Average price per category
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM sales
GROUP BY category;

-- Categories with quantity > 10
SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category
HAVING total_quantity > 10;
