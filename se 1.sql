CREATE DATABASE music_streaming_app;


CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name        VARCHAR(100),
    created_by  VARCHAR(50)
);


INSERT INTO playlists (playlist_id, name, created_by) VALUES
(1, 'Bollywood Hits',  'Amit'),
(2, 'Chill Vibes',     'Priya'),
(3, 'Workout Mix',     'Rahul'),
(4, 'Romantic Melodies', 'Amit'),
(5, 'Road Trip Songs', 'Sneha'),
(6, 'Retro Classics',  'Karan');


SELECT * FROM playlists
WHERE created_by = 'Amit';

Difference Between a Table, Row, and Column in SQL (Using a Zomato Example)
In SQL, data is stored in tables. A table is like a spreadsheet that contains related information.
For example, Zomato may have a table called Orders to store details of food orders placed by customers.

OrderID	  CustomerName	Restaurant	  Amount
101	      Rahul	        Pizza Hut	  450
102    	  Priya	        McDonald's	  320
103	      Amit	         Domino's      550
1. Table
A table is the complete collection of related data organized into rows and columns. In this example, the entire Orders dataset is a table.

2. Row
A row represents a single record in the table. Each row contains information about one order.

Example row:

OrderID	CustomerName	Restaurant	Amount
101  	Rahul	        Pizza Hut	450

This row represents one food order placed by Rahul.

3. Column
A column represents a specific type of information stored for all records in the table.

Examples of columns in the Orders table:

OrderID
CustomerName
Restaurant
Amount

For instance, the CustomerName column stores the names of customers for every order.

Summary:

Table: Entire dataset (Orders table)
Row: One record/order (e.g., Rahul's order)
Column: One category of data (e.g., CustomerName, Restaurant, Amount)