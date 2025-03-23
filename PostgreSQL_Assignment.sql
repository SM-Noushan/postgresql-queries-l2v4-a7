-- Active: 1742147596531@@127.0.0.1@5432@bookstore_db
-- Database Setup
-- CREATE DATABASE bookstore_db;

-- Table Creation
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock SMALLINT NOT NULL CHECK (stock >= 0),
    published_year INT NOT NULL CHECK (published_year > 999 AND published_year <= 9999)
);

INSERT INTO books (title, author, price, stock, published_year) VALUES
    ('The White Tiger', 'Aravind Adiga', 500.00, 100, 2008),
    ('The Hungry Tide', 'Amitav Ghosh', 450.00, 150, 2004),
    ('Nobel Prize', 'Rabindranath Tagore', 350.00, 200, 1913),
    ('The Shadow of the Wind', 'Carlos Ruiz Zafón', 550.00, 90, 2001),
    ('Chandranath', 'Dinesh Chandra Sen', 350.00, 0, 1955),
    ('The Glass Palace', 'Amitav Ghosh', 600.00, 120, 2000),
    ('In Search of Lost Time', 'Marcel Proust', 750.00, 80, 1913),
    ('The Alchemist', 'Paulo Coelho', 400.00, 180, 1988),
    ('Lajja', 'Taslima Nasreen', 350.00, 220, 1993),
    ('Khilafat Movement', 'Maulana Azad', 600.00, 0, 1941),
    ('Jahangirnagar: A Glimpse of the Past', 'Shamsul Alam', 250.00, 50, 1980),
    ('Bangladesh: A Legacy of Blood', 'Anthony Mascarenhas', 450.00, 40, 1986),
    ('Kobi Gyan', 'Jasimuddin', 300.00, 110, 1975),
    ('Raat Baka, Pahar Gora', 'Shahabuddin', 250.00, 130, 1990),
    ('Poetry of Liberation', 'Kazi Nazrul Islam', 500.00, 150, 1935);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    joined_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO customers (name, email, joined_date) VALUES
    ('Amina Begum', 'amina.begum@example.com', '2024-01-15'),
    ('Rahim Uddin', 'rahim.uddin@example.com', '2024-02-20'),
    ('Shahida Akter', 'shahida.akter@example.com', '2024-03-05'),
    ('Saidur Rahman', 'saidur.rahman@example.com', '2024-01-25'),
    ('Jannatul Ferdous', 'jannatul.ferdous@example.com', '2024-03-10'),
    ('Mahfuzur Rahman', 'mahfuzur.rahman@example.com', DEFAULT),
    ('Farhana Yasmin', 'farhana.yasmin@example.com', '2024-02-15'),
    ('Imran Hossain', 'imran.hossain@example.com', '2024-03-01'),
    ('Rifat Mahmud', 'rifat.mahmud@example.com', '2024-02-28'),
    ('Selina Sultana', 'selina.sultana@example.com', '2024-01-10'),
    ('Shihab Uddin', 'shihab.uddin@example.com', '2024-03-12'),
    ('Nazia Rahman', 'nazia.rahman@example.com', '2024-02-25'),
    ('Tanvir Hasan', 'tanvir.hasan@example.com', '2024-01-22'),
    ('Masud Karim', 'masud.karim@example.com', '2024-03-08'),
    ('Hina Parveen', 'hina.parveen@example.com', DEFAULT);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES "customers"(id) ON DELETE CASCADE,
    book_id INT NOT NULL REFERENCES "books"(id) ON DELETE CASCADE,
    quantity SMALLINT NOT NULL CHECK (quantity >= 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
    (1, 1, 2, '2025-03-01 10:30:00'),
    (2, 2, 1, DEFAULT),
    (3, 3, 3, '2025-03-03 09:20:00'),
    (4, 4, 5, '2025-03-04 14:00:00'),
    (5, 5, 1, '2025-03-05 16:15:00'),
    (6, 6, 4, '2025-03-06 12:00:00'),
    (7, 7, 2, '2025-03-07 13:30:00'),
    (8, 8, 6, '2025-03-08 15:00:00'),
    (9, 9, 3, '2025-03-09 17:00:00'),
    (10, 10, 2, '2025-03-10 10:00:00'),
    (11, 11, 4, '2025-03-11 11:15:00'),
    (12, 12, 1, DEFAULT),
    (13, 13, 2, '2025-03-13 14:45:00'),
    (14, 14, 1, '2025-03-14 09:50:00'),
    (15, 15, 3, '2025-03-15 10:10:00');


-- SQL Queries
-- Find books that are out of stock.
SELECT * FROM books 
    WHERE stock = 0;

--  Retrieve the most expensive book in the store.
SELECT * from books
    WHERE price = (
        SELECT max(price) FROM books
    );

-- Find the total number of orders placed by each customer.
SELECT name, count(name) as "total_orders" FROM orders as o
    JOIN customers as c ON c.id = o.customer_id
    GROUP BY name;

-- Calculate the total revenue generated from book sales.
SELECT SUM(price * quantity) as "total_revenue" FROM orders as o
    JOIN books as b ON o.book_id = b.id;

-- List all customers who have placed more than one order.
SELECT name, count(name) as "orders_count" FROM orders as o
    JOIN customers as c ON o.customer_id = c.id
    GROUP BY name
    HAVING count(name) > 1;

-- Find the average price of books in the store
SELECT ROUND(AVG(price), 2) as "average_price" FROM books;

-- Increase the price of all books published before 2000 by 10%.
UPDATE books
    SET price = price + (price * 0.1)
    WHERE published_year < 2000;


-- Delete customers who haven't placed any orders.
DELETE FROM customers
    WHERE id NOT IN (
        SELECT customer_id FROM orders
    );