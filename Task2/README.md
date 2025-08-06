# Library Management System (MySQL)

A simple Library Management System using **MySQL** with two tables: `books` and `members`. It covers basic **CRUD** (Create, Read, Update, Delete) operations.

---

## Features

- Manage books with title, author, ISBN, and available copies
- Manage members with name, email, and phone number
- Simple SQL scripts for creating tables and performing CRUD operations

---

## Database Tables

### Books

| Field           | Type          | Description                |
|-----------------|---------------|----------------------------|
| book_id         | INT (PK)      | Auto-increment book ID     |
| title           | VARCHAR(255)  | Book title                 |
| author          | VARCHAR(100)  | Author name                |
| isbn            | VARCHAR(20)   | Unique ISBN                |
| available_copies| INT           | Number of copies available |

### Members

| Field         | Type          | Description                 |
|---------------|---------------|-----------------------------|
| member_id     | INT (PK)      | Auto-increment member ID    |
| name          | VARCHAR(100)  | Member’s full name          |
| email         | VARCHAR(100)  | Unique email address        |
| phone_number  | VARCHAR(15)   | Contact phone number        |

---

## Sample CRUD Queries

### Books

- **Create**

  ```sql
  INSERT INTO books (title, author, isbn, available_copies)
  VALUES ('The Alchemist', 'Paulo Coelho', '1111111111', 4);
