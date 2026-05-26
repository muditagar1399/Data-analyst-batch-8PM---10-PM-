create database sales 
use sales
create table orders(
order_id int primary key,
order_date date ,
order_category char(20),
total_Sales int);

insert into orders values 
(102,'11-05-2025','electronics',50000),
(103,'4-07-2019','makeup',60000),
(104,'5-07-2023','brushes',40000);

select * from orders;

-- alter 
alter table orders add location char(20);
select * from orders;
-- inserting data using update command 
update  orders set location='mumbai' where order_id=102;
update  orders set location='jaipur' where order_id=103;
update  orders set location='UP' where order_id=104;
-- aggregate functions 
select sum(total_Sales) as total from orders;
select max(total_Sales) as total from orders;
select  min(total_Sales) as total from orders;
select count(total_Sales) as total from orders;
-- where clause 
-- where clause is used to filter the data
select * from orders where total_Sales >50000;
-- order by (sorting by default it sorts in asc order)
select total_Sales, order_category from orders order by total_Sales desc;
select total_Sales, order_category from orders order by total_Sales ;
-- delete command 
-- delete command just to delete row 
delete from orders where order_id=102;
select * from orders ;
-- drop command 
--drop table orders;-- it will drop whole table 
--drop total_Sales from orders;

-- and , or , not 

-- and operator works when both conditon are true 
select * from orders where order_id=104 and total_Sales>50000;
-- or 
-- or operators works even if one cinditon is true 
select * from orders where order_id=104 or total_Sales>50000;

-- not 
select * from orders where order_id !=103;
-- if order id 103 you dont want to see then we use this command 

-- in drop command if we want to drop any column having constraint for ex primary key , not null
-- first we have to drop the constraint then the column 
exec sp_help orders;
alter table orders drop constraint PK__orders__46596229432C2B57;
-- truncate command 
-- truncate is used to qucikly delete all the rows from the table 
-- truncate table orders;
-- drop command 
--drop table orders -- it will drop full table 
-- but truncate command removes the data from the table 
-- roll back 
-- roll back is used to previosuly retun the step it is like ctrl+z like undo 
begin transaction 
update orders 
set total_Sales=70000 where order_id=103;
select * from orders;
rollback transaction;
-- like operator 

-- like operator is used when we want to find some data in the table with some keyword 
select * from orders where order_category like '%m%';