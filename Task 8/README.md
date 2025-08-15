# Task 8 - Stored Procedures and Functions 

## 📌 Objective
The goal of this task is to create **reusable SQL blocks** in the form of:
- One **Stored Procedure**
- One **Function**

Using **MySQL Workbench** (or DB Browser for SQLite with syntax adjustments), we modularize SQL logic to improve reusability, maintainability, and performance.

---

## 🛠 Tools Used
- MySQL Workbench
- MySQL Database (v8.0+)
- Sample table `orders`

---

## 📂 Files
- `task8.sql` → Contains both the stored procedure and function.
- `README.md` → Documentation explaining the task and examples.

---

## 📄 Code Overview

### 1️⃣ Stored Procedure: `GetCustomerOrders`
**Purpose:** Retrieve all orders for a given customer above a specified minimum amount.  
**Parameters:**
- `p_customer_id` (IN): ID of the customer.
- `p_min_amount` (IN): Minimum order amount filter.

**Example Call:**
```sql
CALL GetCustomerOrders(1, 200.00);
