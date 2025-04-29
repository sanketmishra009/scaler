-- Find customers whose first name starts with J.
select * 
from customer
where lower(customer_first_name) like 'j%';

-- Find customer who's first name ends with e.

select *
from customer
where lower(customer_first_name) like '%e';

-- Find customers who's first naem starts with j and ends with e:

select *
from customer
where lower(customer_first_name) like 'j%e';


--Distinct:

--get all the unique first names:

select distinct customer_first_name
from customer;

--Find unique products purchased by all the customers:
select distinct product_id
from customer_purchases;

-- Find the unique combination of products purchased by each customer:

select distinct customer_id , product_id
from customer_purchases;

select * from product;

-- Do we have a product with missing product size ?
select distinct product_size
from product;

select *
from product
where product_size is not null;

-- Find products with blank product_size:

select *
from product
where product_size like ' ';

--Replace null product sizes with unkonwn:

select product_name , product_size , 
ifnull(product_size , 'unknown') as cleaned_product_size
from product;