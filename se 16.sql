create database salesanalysis;
use salesanalysis;
 
 -- task 1 --
 create table foodorders(
	order_id int primary key,
    restaurant_name  varchar(100),
	customer_name varchar(100),
    order_amount decimal(10,2),
    order_date date 
    );
select * from FoodOrders;
SELECT COUNT(*) FROM FoodOrders;

SHOW CREATE TABLE foodorders;

ALTER TABLE foodorders
MODIFY order_date VARCHAR(20);

-- task 2 --
CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs
(song_id, song_title, artist, streams, release_date)
VALUES
(1, 'Blinding Lights', 'The Weeknd', 4500000000, '2019-11-29'),
(2, 'Shape of You', 'Ed Sheeran', 4200000000, '2017-01-06'),
(3, 'Starboy', 'The Weeknd', 3500000000, '2016-09-22'),
(4, 'As It Was', 'Harry Styles', 3000000000, '2022-03-31'),
(5, 'Someone You Loved', 'Lewis Capaldi', 2800000000, '2018-11-08');

SELECT * FROM TopSongs;

-- task 3 --
SELECT
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- task 4 --
SELECT
    restaurant_name,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_revenue DESC;

-- task 5 --
SELECT
    'Average Order Amount' AS kpi_name,
    ROUND(AVG(order_amount), 2) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT
    'Total Unique Customers' AS kpi_name,
    COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;