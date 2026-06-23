use churn
select * from ecommerce_customer_churn_dataset;

-- window functions

use churn
select * from ecommerce_customer_churn_dataset;
-- sub queries in SQl
-- subqueries or nested queries in SQL means that we are writting queries under queries
-- we want to find the customers above the average lifetime value 
select * 
from ecommerce_customer_churn_dataset
where Lifetime_Value>
(
select avg(Lifetime_Value)
from ecommerce_customer_churn_dataset
);
-- LTV (lifetime value )
--= average order value * total purchases 
--=15*147.33
-- aov = total revenue /total orders 

-- this insight tell us who is high potenial customers for business 
-- cuatomers with max purchases 
select *
from ecommerce_customer_churn_dataset
where Total_Purchases=
(
select max(Total_Purchases)
from ecommerce_customer_churn_dataset
);
select max(Total_purchases) from ecommerce_customer_churn_dataset;

-- countries with above average churn
select country,
count(*) customers 
from ecommerce_customer_churn_dataset
group by country 
having count(*)>
(
select avg(customer_count)
from 
(
select count(*) customer_Count 
from ecommerce_customer_churn_dataset
group by country 
)d
);
-- we are putting a here becuase of alias keyword the inner table temperoary table temprroary table 
-- A in the above sub qeury is used becuase we are using this as an alias keyword for the derived table created by the subquery sql 
-- server requires every derived table to have an alias so that the outer query can reference it 
-- subqueries are used when one query depends on the result of another query 
-- when to use them : when you have to compare rows against aggregate value 
-- customer abover average age 
select * 
from ecommerce_customer_churn_dataset
where Age>
(
select avg(age)
from ecommerce_customer_churn_dataset
);
-- find the cusotmers with minimum credit balance 
select * 
from ecommerce_customer_churn_dataset
where Credit_Balance=
(
select min(Credit_Balance)
from ecommerce_customer_churn_dataset
);
-- gender groups with above average customer count
SELECT Gender,
       AVG(Lifetime_Value) AS Avg_Lifetime_Value
FROM ecommerce_customer_churn_dataset
GROUP BY Gender
HAVING AVG(Lifetime_Value) >
(
    SELECT AVG(Lifetime_Value)
    FROM ecommerce_customer_churn_dataset
);
-- with alias
select gender ,
count(*) customers 
from ecommerce_customer_churn_dataset
group by gender 
having count(*)>
(
select avg(cust_count)
from
(
select count(*) as cust_count
from ecommerce_customer_churn_dataset
group by gender 
)a
);
-- window function 
-- it is a way to perform calculation accross a set of rows without reducing the nuomber of rows returned 
-- window functions are used so that we can run our query in short time without making it large it helps to use automatic functions to achieve the results 
--without worrying about results making the query shorter
--over() it is always used in a qindow function 
-- parition by -- cretae groups 
-- order by -- to orders rows inside each group 
-- row_number 
-- row_number is a window function which is used to assign a unique number to each row 
select country,
Lifetime_Value,
ROW_NUMBER()
OVER(
partition by Country 
order by Lifetime_Value desc 
) as row_num
from ecommerce_customer_churn_dataset;
-- rank 
-- rank rows 
select 
Lifetime_Value,
Rank()
over(
order by Lifetime_Value desc
) as rank_no
from ecommerce_customer_churn_dataset;
-- rank function ranks the rows based on the value but what it do for ex 
-- lifetime value 50000,50000,450000 rank functions will assign the rank 1 to both 500000 number and then 3 to 450000 skipping 2 no 
-- dense rank rows 
select 
Lifetime_Value,
dense_Rank()
over(
order by Lifetime_Value desc
) as dense_Rank_no
from ecommerce_customer_churn_dataset;
--- dense rank function dont skip the 2 posiiton or rank for ex if the lifetime value is 50000, 50000,45000 dense rank asigns 2 45000
-- average window function without grouping or creating sub query 
select 
Country,
Lifetime_Value,
avg(Lifetime_Value)
over (
partition by Country 
) as avg_ltv
from ecommerce_customer_churn_dataset;
-- sum
select 
Country,
Lifetime_Value,
sum(Lifetime_Value)
over (
partition by Country 
) as sum_ltv
from ecommerce_customer_churn_dataset;
-- min
select 
Country,
Lifetime_Value,
min(Lifetime_Value)
over (
partition by Country 
) as min_ltv
from ecommerce_customer_churn_dataset;
-- max
select 
Country,
Lifetime_Value,
max(Lifetime_Value)
over (
partition by Country 
) as max_ltv
from ecommerce_customer_churn_dataset;
-- lag 
--returns previous row 
-- first value is always null
-- when you have to compare current value with previous value or current forecast with previous forecast 
select 
Total_Purchases,
LAG(Total_Purchases)
over(
order by Membership_Years 
) as previous_value
from ecommerce_customer_churn_dataset;
-- lead
-- lead returns the next row 
select 
Total_Purchases,
Lead(Total_Purchases)
over(
order by Membership_Years 
) as next_value
from ecommerce_customer_churn_dataset;
-- use in trend analysis more 
-- percent_rannk
-- shows percentile of the positon 
select Lifetime_Value,
PERCENT_RANK()
OVER(
ORDER BY Lifetime_Value
)As percentile
from ecommerce_customer_churn_dataset;
-- parition by 
--pariiton  by divides the data into groups before applying the window function 
select country,
lifetime_value,
rank() over(
partition by country 
order by lifetime_value desc
) as rank_no
from ecommerce_customer_churn_dataset;

--lifetime value , country divide 
-- without parition by 
select country,
lifetime_value,
rank() over(
order by lifetime_value desc
) as rank_no
from ecommerce_customer_churn_dataset;

-- window functions 
-- first value
select * from ecommerce_customer_churn_dataset;
-- NTILE()
-- ntile functions divides the rows into equal groups it diivided the data based on lifetime value 
SELECT * ,NTILE(4) over(
order by Lifetime_Value DESC 
) as qurtile 
from ecommerce_customer_churn_dataset;
-- first value
-- it compares the records with highest/lowest performer 
select Country,
Lifetime_Value,
first_value (Lifetime_Value) 
over (order by Lifetime_Value desc)
as highest_cltv
from ecommerce_customer_churn_dataset;

-- it compares the records with highest/lowest performer COMPARES WITH LAST VALUE 
select Country,
Lifetime_Value,
last_value (Lifetime_Value) 
over (order by Lifetime_Value desc)
as highest_cltv
from ecommerce_customer_churn_dataset;

-- COALESCE() IT IS a function in sql 
-- it returns the first non-null value from alist of expressions 
-- COALSECE () IS USED to handle null values in SQL it returns the first non-null value and is commanly used for data cleaning to 
-- replace missing values 
select 
Country,
COALESCE(Country,'Unknown Country') as Country_filled
from ecommerce_customer_churn_dataset;
select * from ecommerce_customer_churn_dataset;

-- CTE tables (Comman table expressions)
-- A CTE (Comman table expression ) is a tempraory names result set that exists only during execution of a query 
-- it helps in making complex SQL queries easier to read , write and execute 
-- it also helps in sql query optimization 
-- syntax 
--WITH CTE AS 
--(
--select colum1 , column2 
--from table name 
--)
--select * from cte_name ;
-- why we use CTE
-- reuse query results 
-- you can reference in the main query
-- break complex logic
-- divide the complex query into smaller parts
-- customers above the averge lifetime value
with avg_clv as 
(
select avg(Lifetime_Value) as avg_lifetime_value
from ecommerce_customer_churn_dataset
)
select * 
from ecommerce_customer_churn_dataset
where Lifetime_Value>
(
select avg_lifetime_value
from avg_clv
);
--churn of customers by gender 
with churn_gender as 
(
select 
Gender,
count(*) as Total_customers,
sum(cast(churned as int)) as churned_customers
from ecommerce_customer_churn_dataset
group by Gender
)
select * from churn_gender;
-- views in sql 
-- view is a virtual table which store the result in the seperate table withput impacting the master table
-- view does not store your data physically in a table it only stores the sql query and whenver you want to view the query sql fetches the lastest data from underlying table
-- sytax
-- create view view_name as select column 1 , column2 , ... from table name ;
-- uses
-- total cusotmers and churned customers
create view vw_churn as 
select 
count(*) as total_Cusotmers,
sum(CAST(Churned as int)) as churned_customers
from ecommerce_customer_churn_dataset;
select * from vw_churn;