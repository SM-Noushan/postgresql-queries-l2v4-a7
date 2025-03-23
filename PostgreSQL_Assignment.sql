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
    ('Chandranath', 'Dinesh Chandra Sen', 350.00, 70, 1955),
    ('The Glass Palace', 'Amitav Ghosh', 600.00, 120, 2000),
    ('In Search of Lost Time', 'Marcel Proust', 750.00, 80, 1913),
    ('The Alchemist', 'Paulo Coelho', 400.00, 180, 1988),
    ('Lajja', 'Taslima Nasreen', 350.00, 220, 1993),
    ('Khilafat Movement', 'Maulana Azad', 600.00, 60, 1941),
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
