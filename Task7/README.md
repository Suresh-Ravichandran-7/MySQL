# Task 7 - SQL Views

## 🎯 Objective
Learn to create, use, and manage SQL views for data abstraction, security, and simplified queries.

## 🗂 Views Created
1. **CustomerOrders**
   - Joins `Customers` and `Orders` tables to display order details with customer names.
2. **HighValueOrders**
   - Displays orders with a total amount greater than 200.
3. **NY_Customers**
   - Shows only customers from New York and uses `WITH CHECK OPTION` to prevent inserting other cities.

## 🚀 How to Run
1. Open MySQL Workbench or SQLite DB Browser.
2. Execute the SQL script to create tables, insert sample data, and define views.
3. Run queries to test the views.

## 💡 Example Queries
```sql
SELECT * FROM CustomerOrders;
SELECT * FROM HighValueOrders;

-- Allowed: Insert a New York customer
INSERT INTO NY_Customers (customer_id, name, email, city)
VALUES (4, 'David Lee', 'david@example.com', 'New York');

-- Not Allowed: Insert a customer from another city
INSERT INTO NY_Customers (customer_id, name, email, city)
VALUES (5, 'Emma Davis', 'emma@example.com', 'Chicago');
