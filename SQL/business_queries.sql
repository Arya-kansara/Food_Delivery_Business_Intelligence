select count(distinct customer_id) AS Total_Customers from customers;
select count(*) AS Total_Orders from orders;

select order_status , count(*) AS total_orders from orders group by order_status;

SELECT
    ROUND(SUM(order_value),2) AS total_gmv
FROM orders
WHERE order_status='Delivered';

----- Company Revenue ------
select round(SUM(company_commission),2) as Company_revenue from orders where order_status = "Delivered";
----- Average order value ----
select round(AVG(order_value),2) AS Avg_order_value from orders where order_status = "Cancelled" or order_status = "Delivered";
----- Top 5 cities by customer -----
select city , count(*) as total_customers from customers group by city order by total_customers DESC limit 5;
----- Restaurants by Cuisine -----
select cuisine , count(*) AS Total_restaurants from restaurants group by cuisine order by Total_restaurants DESC;
----- payment method used most -------
select payment_method , count(*) as Total_Transaction , SUM(payment_amount) as Total_Amount from payments group by payment_method order by Total_Transaction; 
----- revenue by city -----
select c.city , round(sum(order_value),2) AS total_revenue from customers c inner join orders o ON c.customer_id = o.customer_id group by city order by total_revenue DESC;
----- top 10 restaurants by revenue ----
select restaurant_name ,round(sum(order_value),2) AS total_revenue from restaurants r inner join orders o ON r.restaurant_id = o.restaurant_id group by restaurant_name order by total_revenue desc;
----- Revenue By Cusine -----
select cuisine , round(sum(order_value),2) AS total_revenue from restaurants r inner join orders o ON r.restaurant_id = o.restaurant_id group by cuisine order by total_revenue desc;
----- Top 10 Customers by spending -----
select c.customer_id , 
count(o.order_id) AS Total_orders , 
ROUND(SUM(o.order_value),2) AS Total_Spending 
from customers c 
inner join orders o 
ON c.customer_id = o.customer_id 
where o.order_status = "Delivered"
group by customer_id 
order by Total_Spending DESC
limit 10;

SELECT
    gender,
    COUNT(*) AS customers
FROM customers
GROUP BY gender;

SELECT
    c.gender,
    ROUND(AVG(o.order_value),2) AS avg_spend
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status='Delivered'
GROUP BY c.gender;

SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5
ORDER BY total_orders DESC;


use food_delivery_bi;
select round(AVG(delivery_time_minutes),2) AS Avg_Delivery_Time from orders where order_status = "Delivered";

select c.city , 
round(AVG(o.delivery_time_minutes),2) AS Avg_Delivery_Time 
from customers c 
inner join orders o
ON c.customer_id = o.customer_id 
where order_status = "Delivered"
group by city
order by Avg_Delivery_Time DESC;


select c.city,
round(100 * SUM(CASE when o.order_status="cancelled" THEN 1 ELSE 0 END) / count(*) , 2) AS Cancellation_Rate
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by city
order by Cancellation_Rate;

SELECT
restaurant_id,
ROUND(AVG(customer_rating),2) AS avg_rating
FROM orders
WHERE order_status='Delivered'
GROUP BY restaurant_id
ORDER BY avg_rating DESC
LIMIT 10;

select AVG(order_value) from orders;
select * from orders where order_value > (select AVG(order_value) from orders);


select AVG(order_value) from orders where order_status = "Delivered";

select * from orders where order_status = "Delivered" = (select order_value > AVG(order_value) from orders);
select * from orders where order_status = "Delivered" and order_value > (select AVG(order_value) from orders where order_status = "Delivered");


----- Show Customers
select c.customer_name ,  
SUM(order_value) AS Total_value 
from customers c 
inner join orders o 
ON c.customer_id = o.customer_id 
where o.order_status = "Delivered"
group by customer_name
order by Total_value DESC;

select customer_name,
SUM(order_value) AS Total_Spending
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.order_status = "Delivered" and SUM(order_value) > (select AVG(order_value) from orders where order_status = "Delivered")
group by c.customer_name
order by Total_Spending DESC


limit 10;


select * from restaurants where  rating > (select AVG(rating) from restaurants );


WITH customer_spending AS 
(
select customer_id , SUM(order_value) AS Total_Spending
from orders
where order_status = "Delivered"
group by customer_id
)
select * from customer_spending 
order by Total_Spending DESC
limit 1;

use food_delivery_bi;

with delivered_orders AS 
(
	select customer_id,
    order_id,
    order_value
    from orders
    where order_status = "Delivered"
)

select * from delivered_orders;




select restaurant_id , SUM(order_value) AS Total_Revenue from restaurants r inner join orders o ON r.restaurant_id = o.restaurant_id group by restaurant_id , order by Total_Revenue DESC limit 5;
select * from orders group by restaurant_id order by order_value DESC limit 5;

