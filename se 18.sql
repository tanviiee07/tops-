USE music_streaming_app;

ALTER TABLE songs
ADD COLUMN artist_name VARCHAR(100);
SELECT * FROM songs;

UPDATE songs
SET artist_name = 'Arijit Singh'
WHERE id = 1;

-- task 1--
select 
	artist_name,
    count(id) as total_songs
from songs 
where artist_name is not null
group by artist_name 
having count(id) > 3
order by total_songs desc ;

SELECT * FROM songs;

UPDATE songs
SET artist_name = 'Ed Sheeran'
WHERE id = 5;

UPDATE songs
SET artist_name = 'The Weeknd'
WHERE id = 6;

-- task 2--
SELECT
    u.username,
    COALESCE(SUM(o.total_amount), 0) AS total_order_amount
FROM users AS u
LEFT JOIN orders AS o
    ON u.username = o.user_name
GROUP BY u.id, u.username
ORDER BY total_order_amount DESC;

-- task 3 --
SELECT
    id,
    name,
    rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
)
ORDER BY rating DESC;

-- task 4 --
CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE
);

INSERT INTO transactions
(user_id, amount, transaction_date)
VALUES
(1, 500, '2026-01-05'),
(1, 300, '2026-01-10'),
(1, 200, '2026-01-15'),
(2, 400, '2026-01-06'),
(2, 600, '2026-01-12'),
(3, 700, '2026-01-08'),
(3, 300, '2026-01-18');

select 
	id,
    user_id,
    amount,
    transaction_date,
    
    sum(amount) over (
			partition by user_id
            order by transaction_date, id
            ) as running_total 
	from transactions
    order by user_id, transaction_date, id;
    
-- task 5 --
-- Optimization 1: Create an Index
USE flipkart;

CREATE INDEX idx_category_price
ON products(category, price);

-- Optimization 2: Write an efficient query
SELECT
    product_id,
    product_name,
    category,
    price
FROM products
WHERE category = 'Electronics'
AND price BETWEEN 1000 AND 50000;

