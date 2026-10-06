USE music_streaming_app;
-- task 1
CREATE TABLE Orders (
    order_id     INT PRIMARY KEY,
    user_name    VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_date   DATE
);


INSERT INTO Orders (order_id, user_name, total_amount, order_date) VALUES
(1, 'Amit',  1200.00, '2026-09-01'),
(2, 'Priya', 850.50,  '2026-09-03'),
(3, 'Amit',  NULL,    '2026-09-05'),
(4, 'Rahul', 2300.00, '2026-09-08'),
(5, 'Priya', 450.00,  '2026-09-10');

SELECT * FROM Orders;

-- task 2
SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;
-- COUNT(*) counts the rows.
-- GROUP BY user_name puts all rows of the same user together, so the count is calculated per user.
-- AS order_count names the output column, as the task asks.


-- task 3
SELECT AVG(total_amount) AS average_amount
FROM Orders
WHERE total_amount IS NOT NULL;
-- (1200 + 850.50 + 2300 + 450) / 4 = 1200.125. If NULL were treated as 0, the average would be lower, but SQL does not do that.


-- task 4
SELECT MAX(total_amount) AS highest_order,
       MIN(total_amount) AS lowest_order
FROM Orders;


-- task 5
SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;
