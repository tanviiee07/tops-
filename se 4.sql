USE music_streaming_app;

CREATE TABLE MusicPlaylist (
    id        INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist    VARCHAR(100),
    genre     VARCHAR(50),
    duration  DECIMAL(4,2)
);

INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration) VALUES
(1, 'Kesariya',        'Arijit Singh',    'Bollywood', 4.28),
(2, 'Blinding Lights', 'The Weeknd',      'Pop',       3.20),
(3, 'Apna Bana Le',    'Arijit Singh',    'Bollywood', 4.21),
(4, 'Shape of You',    'Ed Sheeran',      'Pop',       3.53),
(5, 'Believer',        'Imagine Dragons', 'Rock',      3.24),
(6, 'Tum Hi Ho',       'Arijit Singh',    'Romantic',  4.22);

SELECT * FROM MusicPlaylist;

SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;

USE music_streaming_app;

CREATE TABLE FoodOrders (
    id         INT PRIMARY KEY,
    restaurant VARCHAR(100),
    food_item  VARCHAR(100),
    order_date DATE
);

INSERT INTO FoodOrders (id, restaurant, food_item, order_date) VALUES
(1, 'Pizza Hub',    'Margherita Pizza', '2026-09-01'),
(2, 'Spice Garden', 'Paneer Tikka',     '2026-09-03'),
(3, 'Pizza Hub',    'Garlic Bread',     '2026-09-05'),
(4, 'Burger Point', 'Veg Burger',       '2026-09-08'),
(5, 'Spice Garden', 'Butter Naan',      '2026-09-10');

-- Task 3 remove duplicate value 
SELECT DISTINCT restaurant FROM FoodOrders;

-- Task 4 The alias changes the heading in the result only. The real column names in the table stay the same.
SELECT food_item AS 'Dish', order_date AS 'Date Ordered' FROM FoodOrders;

-- Task 5 (fixed query)
SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;
