select * from employees;



Select avg(quantity) as avg_qty
from `customer_purchases`
where market_date = '2019-05-01'

Select round(avg(BMI),2) as avg_bmi
from `hospital`
where lower(Medical_Condition) = "obesity"

select count(*) as total_records 
from hospital

select age , count(*) as no_patients
from hospital
GROUP BY `Age`
order by age;

--Q. How do billing amounts vary based on the patient's insurance provider?


Select Insurance_Provider,
      sum(Billing_Amount) as total
from `hospital`
group by 1
order by 2 desc;

-- select *
-- from hospital;


-- //divide the employees according to salary in group of 4.
SELECT grp, MAX(salary) AS max_salary , count(*) as members
FROM (
    SELECT salary, NTILE(4) OVER (ORDER BY salary) AS grp
    FROM employees
) AS sub
GROUP BY grp
ORDER BY grp;

select extract(month from market_date) as month , sum(quantity) as sales
from customer_purchases
group by 1
order by 1;

-- compare current month sales with next month salses

select * , lag(mom , 1) over(order by quarter) as shifter_mom
from
    (SELECT 
        quarter, 
        total_sales, 
        LEAD(total_sales, 1) OVER (ORDER BY quarter) AS next_quarter_sales,
        (LEAD(total_sales, 1) OVER (ORDER BY quarter) - total_sales) / total_sales * 100 AS mom
    FROM (
        SELECT 
            quarter, 
            SUM(quantity) AS total_sales
        FROM (
            SELECT 
                NTILE(4) OVER (ORDER BY EXTRACT(MONTH FROM market_date)) AS quarter, 
                quantity
            FROM customer_purchases
        ) AS monthly
        GROUP BY quarter
    ) AS quarterly
    ) as quaterly;