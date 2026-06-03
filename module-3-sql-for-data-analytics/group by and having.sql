select * from dbo.[Online-eCommerce];
-- delete operation 
delete from [Online-eCommerce] where Order_Number=NULL;
select * from [Online-ecommerce];
--IS NULL = we have to write is null
delete from [Online-eCommerce] where Order_Number IS NULL;
-- null cannot be use to compare thats why we cant use = here 
-- artheetic functions here 
select sum(Total_Sales) as total_amount from [Online-eCommerce];
select max(Total_Sales) as total_amount from [Online-eCommerce];
select min(Total_Sales) as total_amount from [Online-eCommerce];
select count(Total_Sales) as total_amount from [Online-eCommerce];
-- group by
-- group by is a cluase which is used to group one or more categories in sql it is used so that we can have better results in analysis 
-- total sales and their brands 
select Brand,sum([Total_Sales]) as totalsales from [Online-eCommerce] group by brand order by totalsales ;
-- categories with sales greater than 1000000
select Category , sum([Total_Sales]) as total_Amount from [Online-eCommerce] group by Category having sum([Total_Sales]) >100000 order by total_amount desc;
-- having clause 
--like where clause we were using for filtering data similarly having clause is used to filter the data but after group by 
--if group by clause is used then to filter the data having clause will be used 
select Category , sum([Total_Sales]) as total_Amount from [Online-eCommerce] 
group by Category having sum([Total_Sales]) >100000 
order by total_amount desc;
-- states with highest sales 
select [State_Code], sum([Total_Sales]) as TotalSales from [Online-eCommerce] group by [State_Code] order by TotalSales desc;
--supervisors managing most sales 
select [Assigned_Supervisor] ,sum([Total_Sales]) as Totalsales from [Online-eCommerce] group by 
[Assigned_Supervisor] order by Totalsales desc;
-- customers with more than 5 orders 
select [Customer_Name],count([Order_Number]) as ordercount 
from [Online-eCommerce] group by [Customer_Name] having count ([Order_Number])>5 
order by OrderCount desc;