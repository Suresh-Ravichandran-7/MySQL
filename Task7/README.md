# Task 7 - Creating and Using SQL Views

## 📌 Objective
This task demonstrates how to create, use, and manage SQL views for data abstraction and security.

## 📂 Files
- **create_views.sql** → Creates tables, inserts sample data, and defines views.
- **usage_examples.sql** → Shows how to query and use the created views.

## 🛠 Views Created
1. **CustomerOrders** → Joins Customers and Orders tables to display orders with customer names.
2. **HighValueOrders** → Shows orders with total amount greater than 200.
3. **NY_Customers** → Displays only customers from New York and restricts insertion of other cities using `WITH CHECK OPTION`.

## 🚀 Example Queries
```sql
SELECT * FROM CustomerOrders;
SELECT * FROM HighValueOrders;
INSERT INTO NY_Customers (customer_id, name, email, city) VALUES (4, 'David Lee', 'david@example.com', 'New York');
