CREATE DATABASE zomato_analysis;

USE zomato_analysis;

CREATE TABLE zomato (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    online_order VARCHAR(10),
    book_table VARCHAR(10),
    rate VARCHAR(10),
    votes INT,
    location VARCHAR(100),
    rest_type VARCHAR(100),
    cuisines VARCHAR(255),
    `approx_cost(for two people)` VARCHAR(30),
    `listed_in(type)` VARCHAR(50)
);

INSERT INTO zomato
(name, online_order, book_table, rate, votes, location,
rest_type, cuisines, `approx_cost(for two people)`, `listed_in(type)`)
VALUES

('Punjabi Rasoi', 'Yes', 'Yes', '4.5/5', 850, 'Koramangala',
'Casual Dining', 'North Indian', '800', 'Delivery'),

('Spice Garden', 'Yes', 'No', '4.2/5', 620, 'Koramangala',
'Casual Dining', 'North Indian, Mughlai', '600', 'Delivery'),

('Delhi Darbar', 'Yes', 'Yes', '4.7/5', 1200, 'Koramangala',
'Casual Dining', 'North Indian, Chinese', '900', 'Dine-out'),

('Food Palace', 'Yes', 'No', '2.8/5', 150, 'Koramangala',
'Quick Bites', 'North Indian', '300', 'Delivery'),

('Royal Kitchen', 'Yes', 'Yes', '2.5/5', 110, 'Koramangala',
'Casual Dining', 'North Indian', '450', 'Delivery'),

('Burger King', 'Yes', 'No', '4.1/5', 950, 'Koramangala',
'Quick Bites', 'Burger, Fast Food', '400', 'Delivery'),

('Pizza Hut', 'Yes', 'Yes', '4.3/5', 1100, 'Koramangala',
'Casual Dining', 'Pizza, Italian', '700', 'Delivery'),

('Dominos', 'Yes', 'No', '4.0/5', 900, 'BTM',
'Quick Bites', 'Pizza, Fast Food', '500', 'Delivery'),

('Punjabi Rasoi', 'Yes', 'Yes', '4.4/5', 700, 'HSR Layout',
'Casual Dining', 'North Indian', '850', 'Dine-out'),

('Spice Garden', 'Yes', 'No', '3.9/5', 450, 'BTM',
'Casual Dining', 'North Indian, Mughlai', '550', 'Delivery'),

('McDonalds', 'Yes', 'No', '4.2/5', 1500, 'Indiranagar',
'Quick Bites', 'Burger, Fast Food', '350', 'Delivery'),

('KFC', 'Yes', 'No', '4.1/5', 1300, 'Whitefield',
'Quick Bites', 'Fast Food, Burger', '450', 'Delivery'),

('The Royal Orchid', 'No', 'Yes', '4.8/5', 1800, 'MG Road',
'Fine Dining', 'Continental, North Indian', '1500', 'Dine-out'),

('Empire Restaurant', 'Yes', 'Yes', '4.0/5', 1000, 'BTM',
'Casual Dining', 'North Indian, Biryani', '650', 'Delivery'),

('Food Junction', 'Yes', 'No', '2.9/5', 120, 'Koramangala',
'Quick Bites', 'South Indian', '250', 'Delivery'),

('Cafe Coffee Day', 'Yes', 'No', '3.8/5', 500, 'Jayanagar',
'Cafe', 'Cafe, Beverages', '400', 'Cafes'),

('Truffles', 'Yes', 'Yes', '4.6/5', 2000, 'Koramangala',
'Casual Dining', 'American, Burger', '800', 'Dine-out'),

('Meghana Foods', 'Yes', 'No', '4.4/5', 2200, 'Koramangala',
'Casual Dining', 'Biryani, North Indian', '700', 'Delivery'),

('Dominos', 'Yes', 'No', '4.2/5', 800, 'HSR Layout',
'Quick Bites', 'Pizza, Fast Food', '500', 'Delivery'),

('Pizza Hut', 'Yes', 'Yes', '4.1/5', 750, 'BTM',
'Casual Dining', 'Pizza, Italian', '750', 'Dine-out'),

('Punjabi Rasoi', 'Yes', 'Yes', '4.3/5', 600, 'Whitefield',
'Casual Dining', 'North Indian', '900', 'Delivery'),

('Burger King', 'Yes', 'No', '3.9/5', 650, 'Indiranagar',
'Quick Bites', 'Burger, Fast Food', '350', 'Delivery'),

('Empire Restaurant', 'Yes', 'Yes', '4.2/5', 1200, 'Koramangala',
'Casual Dining', 'North Indian, Biryani', '750', 'Dine-out'),

('Food Palace', 'Yes', 'No', '2.7/5', 90, 'BTM',
'Quick Bites', 'Chinese, Fast Food', '300', 'Delivery'),

('The Royal Orchid', 'No', 'Yes', '4.9/5', 2100, 'Indiranagar',
'Fine Dining', 'Continental, North Indian', '1800', 'Dine-out'),

('McDonalds', 'Yes', 'No', '4.0/5', 1400, 'Koramangala',
'Quick Bites', 'Burger, Fast Food', '400', 'Delivery'),

('KFC', 'Yes', 'No', '4.3/5', 1600, 'BTM',
'Quick Bites', 'Fast Food, Burger', '500', 'Delivery'),

('Meghana Foods', 'Yes', 'No', '4.5/5', 2500, 'HSR Layout',
'Casual Dining', 'Biryani, North Indian', '800', 'Delivery'),

('Truffles', 'Yes', 'Yes', '4.7/5', 2300, 'Indiranagar',
'Casual Dining', 'American, Burger', '950', 'Dine-out'),

('Cafe Coffee Day', 'Yes', 'No', '2.9/5', 200, 'Koramangala',
'Cafe', 'Cafe, Beverages', '350', 'Delivery');

describe zomato;

-- task 1 --
select
 name, location, cuisines, rate, votes 
from zomato
where location = 'koramangala'
and cuisines like '%north indian%'
and rate regexp '^[0-9]'
order by cast(substring_index(rate, '/', 1) as decimal(3,1)) desc
limit 5;

-- task 2 --
SELECT
    cuisines,
    ROUND(
        AVG(CAST(`approx_cost(for two people)` AS DECIMAL(10,2))),
        2
    ) AS average_cost
FROM zomato
WHERE `approx_cost(for two people)` REGEXP '^[0-9]+$'
GROUP BY cuisines
ORDER BY average_cost DESC
LIMIT 3;
    
-- task 3 --
select 
	name,location,cuisines,rate,online_order,votes
    from zomato 
where online_order = 'yes'
and rate regexp '^[0-9]'
and cast(substring(rate, '/') as decimal(3,1)) < 3.0
order by cast(substring_index(rate, '/',1) as decimal(3,1)) asc;

-- task 4 --
SELECT
    CASE
        WHEN CAST(`approx_cost(for two people)` AS UNSIGNED) < 400
            THEN 'Budget'

        WHEN CAST(`approx_cost(for two people)` AS UNSIGNED) <= 800
            THEN 'Mid-Range'

        ELSE 'Premium'
    END AS market_segment,

    COUNT(*) AS total_restaurants

FROM zomato

WHERE `approx_cost(for two people)` REGEXP '^[0-9]+$'

GROUP BY market_segment
ORDER BY total_restaurants DESC;

-- task 5 --
select 
	name as restaurant_chain,
    count(*) as total_outlets
from zomato
group by name 
order by total_outlets desc
limit 10;