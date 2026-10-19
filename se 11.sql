 use music_streaming_app;
 
 -- task 1 --
SELECT r.id, r.name, r.city, r.rating
FROM restaurants r
WHERE r.rating > (
    SELECT AVG(r2.rating)
    FROM restaurants r2
    WHERE r2.city = r.city
);


-- task 2 --

SELECT
    u.username,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.user_name = u.username
    ) AS total_orders
FROM users u;


-- task 3 --
CREATE TABLE movie_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    rating INT
);

INSERT INTO movie_reviews (movie_id, rating)
VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 3),
(1, 4),
(5, 5);

SELECT id, title
FROM movies
WHERE id IN (
    SELECT movie_id
    FROM movie_reviews
    WHERE rating = 5
);

-- task 4 --

CREATE TABLE shop_sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100)
);

CREATE TABLE shop_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE shop_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    seller_id INT,
    category_id INT
);

INSERT INTO shop_sellers VALUES
(1, 'Tech World'),
(2, 'Fashion Hub'),
(3, 'Smart Store');

INSERT INTO shop_categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances');

INSERT INTO shop_products VALUES
(1, 'Laptop', 1, 1),
(2, 'Mobile', 1, 1),
(3, 'T-Shirt', 1, 2),
(4, 'Mixer', 1, 3),
(5, 'Jeans', 2, 2),
(6, 'Jacket', 2, 2),
(7, 'Fan', 3, 3);

SELECT seller_name
FROM shop_sellers s
WHERE NOT EXISTS (
    SELECT category_id
    FROM shop_categories c
    WHERE NOT EXISTS (
        SELECT product_id
        FROM shop_products p
        WHERE p.seller_id = s.seller_id
          AND p.category_id = c.category_id
    )
);