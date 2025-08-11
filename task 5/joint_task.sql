
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);


CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


INSERT INTO Authors (author_id, author_name, country) VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George R.R. Martin', 'USA'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Paulo Coelho', 'Brazil');

INSERT INTO Books (book_id, title, author_id, published_year) VALUES
(101, 'Harry Potter', 1, 1997),
(102, 'A Game of Thrones', 2, 1996),
(103, 'Norwegian Wood', 3, 1987),
(104, 'The Alchemist', 4, 1988),
(105, 'Orphan Book', NULL, 2000); -- Book with no known author

SELECT Authors.author_name, Books.title, Books.published_year
FROM Authors
INNER JOIN Books ON Authors.author_id = Books.author_id;

SELECT Authors.author_name, Books.title, Books.published_year
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id;

SELECT Authors.author_name, Books.title, Books.published_year
FROM Authors
RIGHT JOIN Books ON Authors.author_id = Books.author_id;

SELECT Authors.author_name, Books.title, Books.published_year
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id
UNION
SELECT Authors.author_name, Books.title, Books.published_year
FROM
Authors
RIGHT JOIN Books ON Authors.author_id = Books.author_id;

SELECT Authors.author_name, Books.title
FROM Authors
CROSS JOIN Books;

SELECT A.author_name AS Author1, B.author_name AS Author2, A.country
FROM Authors A
JOIN Authors B ON A.country = B.country AND A.author_id <> B.author_id;
