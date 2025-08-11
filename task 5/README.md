# SQL Joins - Books & Authors Example

## Objective
Showcase the use of **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, **FULL OUTER JOIN**, **CROSS JOIN**, and **SELF JOIN** using a library database.

## Tables Used
### 1. Authors
| Column       | Type         | Description             |
|--------------|-------------|-------------------------|
| author_id    | INT (PK)    | Unique ID for authors   |
| author_name  | VARCHAR(100)| Name of the author      |
| country      | VARCHAR(50) | Country of origin       |

### 2. Books
| Column         | Type         | Description               |
|----------------|-------------|---------------------------|
| book_id        | INT (PK)    | Unique book ID            |
| title          | VARCHAR(100)| Title of the book         |
| author_id      | INT (FK)    | References Authors table  |
| published_year | INT         | Year of publication       |

## Joins Demonstrated
1. **INNER JOIN** – Shows books that have an existing author in the Authors table.
2. **LEFT JOIN** – Shows all authors, including those without any books.
3. **RIGHT JOIN** – Shows all books, even if they don’t have a listed author.
4. **FULL OUTER JOIN** – Combines both LEFT and RIGHT joins (MySQL workaround using UNION).
5. **CROSS JOIN** – Produces every combination of author and book.
6. **SELF JOIN** – Finds authors from the same country.

## How to Run
1. Open MySQL Workbench or DB Browser for SQLite.
2. Run the script `joins_task_books.sql`.
3. Execute each query separately to view results.

## Output Example
- **INNER JOIN** → J.K. Rowling → Harry Potter
- **LEFT JOIN** → Paulo Coelho shows even if no books linked
- **RIGHT JOIN** → Orphan Book appears even with no matching author
- **FULL OUTER JOIN** → Shows all records from both tables
- **CROSS JOIN** → Every possible author-book pair
- **SELF JOIN** → Authors from the same country listed together

---

