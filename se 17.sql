USE zomato_analysis;

-- task 1 --
create table restaurant(
 id int primary key auto_increment,
 name varchar(100),
 cuisine varchar(50),
 location varchar(100),
 average_rating decimal(2,1)
 );
 
INSERT INTO Restaurant
(name, cuisine, location, average_rating)
VALUES
('Punjabi Rasoi', 'North Indian', 'Ahmedabad', 4.5),
('Delhi Darbar', 'North Indian', 'Surat', 4.2),
('Spice Garden', 'South Indian', 'Ahmedabad', 4.3),
('Dosa House', 'South Indian', 'Vadodara', 4.1),
('Pizza Hub', 'Italian', 'Ahmedabad', 4.6),
('Pasta Corner', 'Italian', 'Surat', 4.0);

-- task 2 --
select 
	cuisine,
    count(*) as total_restaurants
from restaurant
group by cuisine
order by total_restaurants desc;

-- task 3 --
CREATE TABLE Review (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_date DATE,

    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurant(id)
);

INSERT INTO Review
(restaurant_id, user_name, rating, review_date)
VALUES
(1, 'Rahul', 4.5, '2026-01-05'),
(1, 'Priya', 4.0, '2026-01-06'),
(1, 'Amit', 5.0, '2026-01-07'),

(2, 'Neha', 4.0, '2026-01-08'),
(2, 'Karan', 4.5, '2026-01-09'),

(3, 'Riya', 4.5, '2026-01-10'),
(3, 'Jay', 4.0, '2026-01-11'),

(4, 'Anjali', 3.5, '2026-01-12'),
(4, 'Vishal', 4.0, '2026-01-13'),

(5, 'Mehul', 5.0, '2026-01-14'),
(5, 'Pooja', 4.5, '2026-01-15'),

(6, 'Krish', 3.5, '2026-01-16');

-- task 4 --
select 
	r.name,
    r.cuisine,
    round(avg(rv.rating), 2) as average_review_rating
from restaurant r
inner join review rv
	on r.id = rv.restaurant_id
group by r.id, r.name, r.cuisine
order by average_review_rating desc;

-- task 5 --
with restaurantratings as (
 select 
	r.name,
    r.cuisine,
    round(avg(rv.rating), 2) as average_review_rating
from restaurant r
inner join review rv
	on r.id = rv.restaurant_id
group by r.id, r.name, r.cuisine
)
select 
	name,
    cuisine,
    average_review_rating,
    
    rank() over(
		partition by cuisine
        order by average_review_rating desc
        ) as restaurant_rank
        
from restaurantratings
order by cuisine, restaurant_rank;