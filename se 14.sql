USE music_streaming_app;

SELECT * FROM orders;

-- task 2 --
select
		order_id,
        user_name,
        total_amount,
        order_date,
        LAG(total_amount) over(
         partition by user_name
         order by order_id, order_date
         )as Previous_Order_Amount
		from orders
	order by user_name , order_id , order_date;
    
-- task 3 --
select
		order_id,
        user_name,
        total_amount,
        order_date,
        LEAD(total_amount) over(
         partition by user_name
         order by order_id, order_date
         )as Next_Order_Amount
		from orders
	order by user_name , order_id , order_date;
    
-- task 4 --
select
		order_id,
        user_name,
        total_amount,
        order_date,
        sum(total_amount) over(
        partition by user_name 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
         )as runnig_total
		from orders
	order by user_name , order_id , order_date;
    
-- task 5 --
select
		order_id,
        user_name,
        total_amount,
        order_date,
	round(
			avg(total_amount) over(
             partition by user_name
             order by order_date, order_id
			ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            ),2 
            )as moving_avg
		from orders
	order by user_name, order_date, order_id;