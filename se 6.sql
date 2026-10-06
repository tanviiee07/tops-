USE music_streaming_app;

CREATE TABLE products (
    id    INT PRIMARY KEY,
    name  VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (id, name, price) VALUES
(1, 'Wireless Mouse',       599.00),
(2, 'Bluetooth Speaker',   1999.00),
(3, 'Smart Watch',         3499.00),
(4, 'Headphones',          1499.00),
(5, 'Laptop Bag',           899.00),
(6, 'Mechanical Keyboard', 2799.00),
(7, 'Power Bank',          1299.00),
(8, 'Gaming Laptop',      65999.00);

CREATE TABLE movies (
    id           INT PRIMARY KEY,
    title        VARCHAR(100),
    release_year INT,
    rating       DECIMAL(2,1)
);

INSERT INTO movies (id, title, release_year, rating) VALUES
(1, 'Jawan',       2023, 7.0),
(2, 'Animal',      2023, 6.2),
(3, 'Dunki',       2023, 6.5),
(4, 'Gully Boy',   2019, 7.9),
(5, 'Kabir Singh', 2019, 7.1),
(6, 'Dangal',      2016, 8.3),
(7, '3 Idiots',    2009, 8.4);

CREATE TABLE songs (
    id         INT PRIMARY KEY,
    title      VARCHAR(100),
    play_count INT,
    added_date DATE
);

INSERT INTO songs (id, title, play_count, added_date) VALUES
(1, 'Kesariya',        1500000, '2026-08-10'),
(2, 'Apna Bana Le',    1200000, '2026-09-01'),
(3, 'Tum Hi Ho',       1500000, '2026-09-15'),
(4, 'Believer',         900000, '2026-07-20'),
(5, 'Shape of You',    1200000, '2026-09-20'),
(6, 'Blinding Lights',  800000, '2026-06-05');

-- task 1
SELECT * FROM products
ORDER BY price ASC;

-- task 2
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;
-- LIMIT 5 then keeps only the first 5 rows of that sorted result.

-- task 3 Movies by year (latest first), then by rating (highest first)
SELECT title, release_year, rating
FROM movies
ORDER BY release_year DESC, rating DESC;

-- task 4
SELECT * FROM Restaurants
ORDER BY name ASC
LIMIT 10;
-- ORDER BY name ASC sorts alphabetically (A to Z) for text columns. LIMIT 10 shows at most 10 rows.

-- task 5
SELECT title, play_count, added_date
FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;
-- If two songs have the same play_count, added_date DESC puts the more recently added one first.