# Task 3 - employeemanagementsystem

## Overview
This task focuses on practicing SQL SELECT statements to extract and filter data from a table using various clauses.

## Technologies Used
- MySQL Workbench
 
## Table Structure
**Table:** employees
- id (INT, Primary Key)
- name (VARCHAR)
- age (INT)
- department (VARCHAR)
- salary (DECIMAL)

## SQL Concepts Practiced
- SELECT all and specific columns
- Filtering with WHERE, AND, OR
- Pattern matching with LIKE
- Range filtering using BETWEEN
- Sorting using ORDER BY (ASC/DESC)
- Limiting rows with LIMIT
- Using aliases with AS
- Removing duplicates with DISTINCT
- Comparison using = and IN

## Sample Query
```sql
SELECT name AS employee_name, salary
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 3;
