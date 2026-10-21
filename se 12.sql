 USE music_streaming_app;
-- task 1 --
 WITH TopRatedProducts AS (
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;

-- task 2 --
-- A. Using a Subquery
SELECT *
FROM Restaurants
WHERE id IN (
    SELECT id
    FROM Restaurants
    WHERE city = 'Ahmedabad'
      AND delivery_charge < 50
);

-- B. Using a CTE
WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
      AND delivery_charge < 50
)
SELECT *
FROM AhmedabadRestaurants;

-- Comparison:

-- Subquery												CTE
-- Query inside another query.							Named temporary result using WITH.
-- Can be harder to read when queries.	Often 			easier to read and maintain.
-- Useful for simple filtering and comparisons.		    Useful for organizing complex queries.

-- task 3 --
CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    caption VARCHAR(100),
    likes INT
);

INSERT INTO Posts (user_id, caption, likes) VALUES
(1, 'Sunset at Sabarmati Riverfront', 1520),
(2, 'My new workout routine', 980),
(3, 'Street food in Manek Chowk', 2430),
(1, 'Weekend trip to Kutch', 3100),
(4, 'Coding setup tour', 760),
(5, 'Navratri garba night', 2875),
(2, 'Morning coffee vibes', 540);

ALTER TABLE Users ADD COLUMN followers INT DEFAULT 0;

UPDATE Users SET followers = 1200 WHERE id = 1;
UPDATE Users SET followers = 850  WHERE id = 2;
UPDATE Users SET followers = 3400 WHERE id = 3;
UPDATE Users SET followers = 560  WHERE id = 4;
UPDATE Users SET followers = 2100 WHERE id = 5;

INSERT INTO Users (id, username, followers) VALUES (5, 'user_five', 2100);


WITH TopUsers AS (
    SELECT username, followers
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT caption, likes
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT 'Top User' AS category, username AS name, followers AS total
FROM TopUsers
UNION ALL
SELECT 'Top Post' AS category, caption AS name, likes AS total
FROM TopPosts;

-- task 4 --
WITH RECURSIVE next_7_days AS (
    SELECT CURDATE() AS show_date
    UNION ALL
    SELECT DATE_ADD(show_date, INTERVAL 1 DAY)
    FROM next_7_days
    WHERE show_date < CURDATE() + INTERVAL 6 DAY
)
SELECT show_date,
       DAYNAME(show_date) AS day_name
FROM next_7_days;

-- task 5 --
-- Messy version (before):
SELECT *
FROM (
    SELECT id, username, followers
    FROM Users
    WHERE id IN (
        SELECT id FROM Users WHERE followers > 1000)
) AS t
WHERE t.followers > 1000
ORDER BY t.followers DESC;

-- CTE version (after):
WITH PopularUsers AS (
    SELECT id, username, followers
    FROM Users
    WHERE followers > 1000
)
SELECT * FROM PopularUsers
ORDER BY followers DESC;