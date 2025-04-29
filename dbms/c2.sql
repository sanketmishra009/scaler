-- concat funciton
select * , concat(customer_first_name , ' ' , customer_last_name) as full_name from customer; 
-- lower and upper

select *  , concat(lower(customer_first_name) , ' ' , upper(customer_last_name)) as full_name from customer;

-- substr

select * , concat(substr(customer_first_name , 1, 1) , '.' , substr(customer_last_name , 1 , 1)) as initials from customer;



-- get names in the proper format-> (upper(first_char) , lower(rest))

select * , concat(upper(substr(customer_first_name , 1 , 1))  , lower(substr(customer_first_name , 2))) as first_name_formatted
from customer;

-- initcap -> not available in mysql

-- Filtering

select * from customer_purchases
where product_id != 1;

-- Q: Extract all the data that are part of product category - 1:

select * from product 
where product_category_id = 1;

-- Q: All products that are not part of product category - 1:

select product_id , product_name from product
where product_category_id != 1;


-- Q: Extract all the purchases of customer-4 sorted by date:

select * , round(quantity * cost_to_customer_per_qty , 2) as total_amount from customer_purchases
where customer_id = 4
order by market_date desc;


-- select product ids > 2:

select * from product
where product_id > 3;


-- Q: Get all the product info for products with id between 3 and 8 (not inclusive) and of products with id 10.
select * from product
where (product_id > 3 and product_id < 8) or product_id = 10;

select * from product
where product_size = 'medium' or product_category_id= 1;

-- Q: Find the booth assignments for vendor_id 7 for all dates between April 3, 2019, and May 16, 2019, including the 2 dates.

select * from vendor_booth_assignments
where vendor_id = 7 and market_date between '2019-04-03' and '2019-05-16'
ORDER BY market_date asc


-- Q: Return a list of customers with the following last names: [Diaz, Edwards, Wilson]

select * from customer
where lower(customer_last_name) in ('diaz' , 'edwards' , 'wilson')


//subqueries

select market_date
from market_date_info
where market_rain_flag = 1;

select * from customer_purchases
where market_date in (
    select market_date
    from market_date_info
    where market_rain_flag = 1)

or market_date in (
    select market_date
    from market_date_info
    where market_snow_flag = 1
);



-- List all the product details where product_category name contains "Fresh" in it:
select * from product
where product_category_id in (
    select product_category_id
    from product_category
    where lower(product_category_name) like '%fresh%'
    );