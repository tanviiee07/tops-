USE music_streaming_app;

-- task 1
CREATE TABLE Orders_s8 (
    order_id       INT PRIMARY KEY,
    user_id        INT,
    payment_method VARCHAR(20),
    amount         DECIMAL(10,2)
);

INSERT INTO Orders_s8 (order_id, user_id, payment_method, amount) VALUES
(1,  101, 'UPI',    250.00),
(2,  102, 'Card',   800.00),
(3,  101, 'Wallet', 150.00),
(4,  103, 'COD',    400.00),
(5,  102, 'UPI',    350.00),
(6,  104, 'Card',   500.00),
(7,  103, 'UPI',    200.00),
(8,  101, 'COD',    300.00),
(9,  104, 'Wallet', 100.00),
(10, 102, 'Card',   600.00);

select * from orders_s8;

-- task 2
SELECT payment_method, COUNT(*) AS order_count
FROM Orders_s8
GROUP BY payment_method;
-- group by same payment method rows in group
-- count(*) count a row in each grpup 

-- taks 3
SELECT user_id, SUM(amount) AS total_spend
FROM Orders_s8
GROUP BY user_id;
-- GROUP BY user_id roups the orders of each user together.
-- SUM(amount) adds up the amount of each group to give its total.

-- task 4
SELECT payment_method, AVG(amount) AS avg_amount
FROM Orders_s8
GROUP BY payment_method
HAVING AVG(amount) > 300;
-- first using group by to make payment method group 
-- AVG(amount) find avg in each group 
-- HAVING AVG(amount)>300 keeps only the groups whose average is greater than 300.    

-- task 5
-- WHERE is the security guard at the gate. He checks each person and lets only some people in. This happens before teams are made.
-- HAVING is the judge. The people are already divided into teams, and the judge decides which teams stay in the competition.

-- WHERE (filters rows)
SELECT payment_method, COUNT(*) AS order_count
FROM Orders_s8
WHERE amount > 300
GROUP BY payment_method;

-- HAVING (filters groups)
SELECT payment_method, COUNT(*) AS order_count
FROM Orders_s8
GROUP BY payment_method
HAVING COUNT(*) >= 3;