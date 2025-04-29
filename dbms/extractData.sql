-- Active: 1741180767687@@127.0.0.1@3306@farmers_market
select * 
from product;

select * from customer;


select * from product
order by product_id DESC;

select * ,
quantity * cost_to_customer_per_qty as amount 
from customer_purchases
order by customer_id , amount desc;

-- Arrange the data by most recent transaction made by the customer

select * 
from customer_purchases
-- where market_date <= "2020-09-30"
order by market_date desc , transaction_time desc
limit 10;


