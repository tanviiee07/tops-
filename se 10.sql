 use music_streaming_app;
 
 -- task 1 --
 CREATE TABLE Influencers (
id INT PRIMARY KEY,
name VARCHAR(100)
);
CREATE TABLE Collaborations (
id INT PRIMARY KEY,
influencer1_id INT,
influencer2_id INT,
collab_date DATE
);

INSERT INTO Influencers VALUES
(1,'Rohit'),
(2,'Priya'),
(3,'Amit'),
(4,'Neha'),
(5,'Rahul');

INSERT INTO Collaborations VALUES
(101,1,2,'2025-01-10'),
(102,2,3,'2025-02-15'),
(103,4,5,'2025-03-20');

-- FULL JOIN Logic --

SELECT
    i.name AS influencer_name,
    i2.name AS collaboration_partner,
    c.collab_date
FROM Influencers i
LEFT JOIN Collaborations c
ON i.id = c.influencer1_id
LEFT JOIN Influencers i2
ON c.influencer2_id = i2.id;

CREATE TABLE nested_playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO nested_playlists VALUES
(1,101,'Bollywood Hits',NULL),
(2,101,'Romantic Songs',1),
(3,102,'Workout Mix',NULL),
(4,102,'Gym Motivation',3),
(5,103,'Chill Vibes',NULL);

SELECT
    p1.playlist_name AS child_playlist,
    p2.playlist_name AS parent_playlist
FROM nested_playlists p1
LEFT JOIN nested_playlists p2
ON p1.parent_playlist_id = p2.id;

-- task 3 --

CREATE TABLE Users (
id INT PRIMARY KEY,
username VARCHAR(50)
);

CREATE TABLE Orders_9 (
id INT PRIMARY KEY,
user_id INT,
order_date DATE
);

CREATE TABLE Payments (
id INT PRIMARY KEY,
order_id INT,
amount DECIMAL(10,2)
);

INSERT INTO Users VALUES
(1,'Rohan'),
(2,'Priya'),
(3,'Neha'),
(4,'Amit');

INSERT INTO Orders_9 VALUES
(101,1,'2025-08-01'),
(102,2,'2025-08-03'),
(103,4,'2025-08-05');

INSERT INTO Payments VALUES
(1,101,1500),
(2,102,2000);

SELECT u.username, o.order_date, p.amount
FROM Users u
LEFT JOIN Orders_9 o
    ON u.id = o.user_id
LEFT JOIN Payments p
    ON o.id = p.order_id;
    
    -- task 4 --
    
    CREATE TABLE Cafe_List (
    cafe_id INT PRIMARY KEY,
    cafe_name VARCHAR(100)
);

CREATE TABLE Cafe_Reviews (
    review_id INT PRIMARY KEY,
    cafe_id INT,
    rating INT
);

INSERT INTO Cafe_List VALUES
(1,'Coffee House'),
(2,'Cafe Mocha'),
(3,'Brew Lounge');

INSERT INTO Cafe_Reviews VALUES
(101,1,5),
(102,1,4),
(103,1,3),
(104,2,5),
(105,2,4),
(106,3,5);

SELECT * FROM Cafe_Reviews;


SELECT DISTINCT
    c.cafe_id,
    c.cafe_name
FROM Cafe_List c
JOIN Cafe_Reviews cr
ON c.cafe_id = cr.cafe_id;

-- A restaurant can have many reviews (one-to-many relationship), so the JOIN creates multiple rows for the same restaurant.
-- Used DISTINCT to display each restaurant only once.

-- task 5 --

-- Query 1
SELECT
p.product_name,
c.category_name
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- Query 2
SELECT
p.product_name,
c.category_name
FROM Categories c
INNER JOIN Products p
ON c.category_id = p.category_id;

-- Both queries return the same result because they join the tables using the same category_id.
-- The order of tables in an INNER JOIN does not change the final output.