# 📊 Task 4 – Aggregate Functions & Grouping 

## 📝 Objective
To summarize and analyze tabular data using SQL aggregate functions such as SUM, AVG, COUNT, and by grouping results with GROUP BY and HAVING.

---

## ⚙️ Tools Used
- MySQL Workbench / DB Browser for SQLite

---

## 🗃️ Table Schema – `sales`
```sql
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);
