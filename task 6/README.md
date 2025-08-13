# Task 6 

## 📌 Objective
Practice using **subqueries** in SQL inside `SELECT`, `WHERE`, and `FROM` clauses, including:
- Scalar subqueries
- Correlated subqueries
- `IN` and `EXISTS` operators
- Derived tables
- Nested subqueries

## 🛠 Tools
- MySQL Workbench / DB Browser for SQLite
- Sample database: **Customers**, **Orders**, **Products**, **OrderDetails**

---

## 📚 Key Concepts

| Type of Subquery     | Description |
|----------------------|-------------|
| Scalar Subquery      | Returns a single value. Can be used in `SELECT` or `WHERE`. |
| Correlated Subquery  | Refers to columns from the outer query. Runs once for each row. |
| IN Subquery          | Checks if a value exists in the result set of the subquery. |
| EXISTS Subquery      | Returns `TRUE` if the subquery returns at least one row. |
| Derived Table        | A subquery in the `FROM` clause, treated as a temporary table. |

---

## 📄 SQL Queries

### 1️⃣ Scalar Subquery in SELECT
```sql
SELECT 
    c.customer_id,
    c.name,
    (SELECT AVG(total_amount) FROM Orders) AS avg_order_value,
    (SELECT SUM(o.total_amount) 
     FROM Orders o 
     WHERE o.customer_id = c.customer_id) AS total_spent
FROM Customers c;
