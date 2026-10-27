-- task 1 --
SELECT VERSION();

-- task 2 --
CREATE DATABASE IF NOT EXISTS foodie_app;

USE foodie_app;

-- task 3 --
CREATE TABLE IF NOT EXISTS restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

INSERT INTO restaurants (id, name, cuisine, rating, location)
VALUES
(1, 'Spice Garden', 'Indian', 4.5, 'Ahmedabad'),
(2, 'Pizza Corner', 'Italian', 4.2, 'Surat'),
(3, 'Dragon Wok', 'Chinese', 4.0, 'Mumbai'),
(4, 'Burger House', 'Fast Food', 3.9, 'Ahmedabad'),
(5, 'Tandoori Treat', 'Punjabi', 4.6, 'Delhi');

-- task 4 --
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone_number VARCHAR(15) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, phone_number)
VALUES
('Rahul Patel', 'rahul@example.com', '9876500001'),
('Priya Shah', 'priya@example.com', '9876500002'),
('Amit Kumar', 'amit@example.com', '9876500003'),
('Neha Joshi', 'neha@example.com', '9876500004'),
('Karan Mehta', 'karan@example.com', '9876500005');

-- task 5--
-- incorrect query
CREATE TABLE error_demo (
    id INT PRIMARY KEY,
    name VARCHAR(100)
    email VARCHAR(100)
    );
  
-- correct query
    CREATE TABLE error_demo (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

DESCRIBE error_demo;