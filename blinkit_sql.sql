 create database blinkit_db; 
 use blinkit_db; 
 
 create table blinkit_orders( 
 order_id varchar(50), 
 customer_id varchar(50), 
 order_date date, 
 product_name varchar(100), 
 category varchar(50), 
 quantity int, 
 price decimal(10,2), 
 order_total decimal(10,2), 
 delivery_status varchar(20), 
 delivery_time_minutes int
 );  
 


 -- Total Sales:-
 select sum(order_total) as Total_sales from blinkit_orders; 
 
 -- Total Orders:-
 select count(*) as Total_Orders from blinkit_orders; 
 
 -- Top 5 Product:- 
 select product_name,sum(quantity) as QTY from 
 blinkit_orders group by product_name order by QTY desc limit 5; 
 
 -- Category Sales:- 
 select category,sum(order_total) as Sales from 
 blinkit_orders group by category order by Sales desc; 
 
 -- Delivery Status %:-
 select delivery_status,count(*) as
	Total,round(count(*)*100.0/(select count(*) from blinkit_orders),1) 
		as pct from blinkit_orders  group by delivery_status; 
 
 -- Top 5 Customer:- 
 select customer_id,sum(order_total) as spent from blinkit_orders group by 
 customer_id order by spent desc limit 5; 
 
 -- Avg Delivery Time:- 
 select Avg(delivery_time_minutes) as avg_delivery_time from blinkit_orders; 
 
 -- Late delivery by category:-
 select category,avg(delivery_time_minutes) as avg_time from blinkit_orders 
 group by category order by avg_time desc ;
 
 -- Monthly Sales:- 
 select date_format(order_date,"%Y-%m") as month,sum(order_total) as Sales from 
 blinkit_orders group by month order by month; 
 
 -- Delayed orders:- 
 select Count(*) as Delayed_orders from blinkit_orders 
 where delivery_status="slightly Delayed"; 
 