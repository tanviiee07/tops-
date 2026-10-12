use music_streaming_app;

-- task 1 --
CREATE TABLE restaurants_new (
id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(50)
);

INSERT INTO restaurants_new VALUES
(1,'Royal Spice','Ahmedabad'),
(2,'Urban Tadka','Surat'),
(3,'Food Factory','Vadodara');

CREATE TABLE dishes_new (
id INT PRIMARY KEY,
restaurant_id INT,
dish_name VARCHAR(100),
price DECIMAL(10,2)
);

INSERT INTO dishes_new VALUES
(101,1,'Paneer Butter Masala',250),
(102,1,'Veg Biryani',220),
(103,2,'Cheese Pizza',350),
(104,2,'Burger',180),
(105,3,'Masala Dosa',120),
(106,3,'Idli Sambhar',90);

-- task 2 --
SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name,
    r.city
FROM dishes_new d
INNER JOIN restaurants_new r
ON d.restaurant_id = r.id;

-- task 3 --
INSERT INTO restaurants_new VALUES
(4, 'Green Garden', 'Rajkot'),
(5, 'Sky Dine', 'Bhavnagar');

SELECT
    r.name AS restaurant_name,
    r.city,
    d.dish_name,
    d.price
FROM restaurants_new r
LEFT JOIN dishes_new d
ON r.id = d.restaurant_id;

-- task 4 --
INSERT INTO dishes_new
VALUES (107,99,'Special Pasta',280);

SELECT
    d.dish_name,
    d.price,
    r.name AS restaurant_name
FROM restaurants_new r
RIGHT JOIN dishes_new d
ON r.id = d.restaurant_id;

-- task 5 --
CREATE TABLE playlist_songs (
    playlist_id INT,
    song_id INT
);
INSERT INTO playlist_songs
VALUES
(1,1),
(1,2),
(2,3),
(3,1),
(5,2);

SELECT
    p.playlist_id,
    p.name AS playlist_name,
    s.id AS song_id,
    s.title AS song_name
FROM playlists p
LEFT JOIN playlist_songs ps
    ON p.playlist_id = ps.playlist_id
LEFT JOIN songs s
    ON ps.song_id = s.id;

