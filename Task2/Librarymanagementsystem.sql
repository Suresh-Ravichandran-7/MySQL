
-- 1. Create `books` table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    available_copies INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create `members` table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create `borrow_records` table
CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL DEFAULT CURDATE(),
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- --------------------------------
-- INSERT (CREATE)
-- --------------------------------

-- Add books
INSERT INTO books (title, author, isbn, available_copies) VALUES
('1984', 'George Orwell', '1234567890', 5),
('To Kill a Mockingbird', 'Harper Lee', '2345678901', 3);

-- Add members
INSERT INTO members (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com');

-- Record a borrow
INSERT INTO borrow_records (book_id, member_id) VALUES
(1, 1);  -- Alice borrows book ID 1

-- --------------------------------
-- SELECT (READ)
-- --------------------------------

-- Get all books
SELECT * FROM books;

-- Get all members
SELECT * FROM members;

-- Get all borrow records with member and book details
SELECT br.record_id, m.name AS member, b.title AS book, br.borrow_date, br.return_date
FROM borrow_records br
JOIN members m ON br.member_id = m.member_id
JOIN books b ON br.book_id = b.book_id;

-- Get borrowed books not yet returned
SELECT * FROM borrow_records WHERE return_date IS NULL;

-- --------------------------------
-- UPDATE
-- --------------------------------

-- Return a book (set return date)
UPDATE borrow_records
SET return_date = CURDATE()
WHERE record_id = 1;

-- Update available copies when a book is returned
UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 1;

-- Change member email
UPDATE members
SET email = 'alice.new@example.com'
WHERE member_id = 1;

-- --------------------------------
-- DELETE
-- --------------------------------

-- Delete a member (only if no active borrowings)
DELETE FROM members
WHERE member_id = 2 AND NOT EXISTS (
    SELECT 1 FROM borrow_records
    WHERE member_id = 2 AND return_date IS NULL
);

-- Delete a book
DELETE FROM books
WHERE book_id = 2;
