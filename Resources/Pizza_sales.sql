use [Pizza DB];
select * from  pizza_sales;

select 
sum(total_price) as total_revenue 
from pizza_sales;

select 
sum(total_price)/count(distinct order_id) as avg_order_value 
from pizza_sales;

select
sum(quantity) as pizza_sold 
from pizza_sales;

select 
count(distinct order_id) as total_order
from pizza_sales;

select 
cast(cast(sum(quantity) as decimal(10,2)) /
 cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_pizza_per_order
from pizza_sales; 

select
datename(w, order_date) as order_day,
count(distinct order_id) as total_order
from pizza_sales
group by datename(w, order_date)

select
datename(mm, order_date) as month,
count(distinct order_id) as total_order
from pizza_sales
group by datename(mm, order_date)
order by total_order desc;

select
pizza_category,
sum(total_price)*100 /(select  sum(total_price) from pizza_sales) as total_sale_percentage
from pizza_sales
group by pizza_category

select
pizza_size,
cast(sum(total_price)*100 /(select  sum(total_price) from pizza_sales) as decimal(10,2)) as total_sale_percentage
from pizza_sales
group by pizza_size

select 
top 5 pizza_name,
sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc --top 5. if we want bottom 5 then just change the desc to asc.

select 
top 5 pizza_name,
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name 
order by total_quantity asc  --Bottom 5.