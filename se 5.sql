USE music_streaming_app;

-- task 1
CREATE TABLE Restaurants (
    id      INT PRIMARY KEY,
    name    VARCHAR(100),
    cuisine VARCHAR(50),
    rating  DECIMAL(2,1),
    city    VARCHAR(50)
);

INSERT INTO Restaurants (id, name, cuisine, rating, city) VALUES
(1, 'Swagat Restaurant', 'Gujarati',     4.3, 'Ahmedabad'),
(2, 'Swadisht Kitchen',  'South Indian', 4.6, 'Surat'),
(3, 'Dragon Wok',        'Chinese',      3.8, 'Ahmedabad'),
(4, 'Pasta Palace',      'Italian',      4.1, 'Mumbai'),
(5, 'Swaad Bhavan',      'Punjabi',      3.4, 'Surat'),
(6, 'Idli Express',      'South Indian', 4.5, 'Delhi'),
(7, 'Roma Pizzeria',     'Italian',      3.9, 'Ahmedabad');

SELECT * FROM Restaurants;

-- task 2
SELECT * FROM Restaurants
WHERE rating > 4.0
  AND (city = 'Ahmedabad' OR city = 'Surat');
  
  
  -- task 3
  SELECT * FROM Restaurants
WHERE name LIKE 'Swa%';


-- task 4
SELECT * FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;

-- task 5
SELECT * FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
