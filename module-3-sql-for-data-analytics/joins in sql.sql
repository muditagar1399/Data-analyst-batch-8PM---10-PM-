-- 1 table dept 
create table dept(
dept_id int primary key,
dept_name varchar(50)
);
-- 2 table employee 
create table emp(
emp_id int primary key, 
emp_name char(20),
dept_id int ,
foreign key (dept_id) references dept(dept_id)
);
-- adding data 
insert into dept (dept_id,dept_name) values 
(101,'MIS'),
(102,'IT'),
(103,'IT'),
(104,'HR'),
(105,'HR');

-- add data in 2 table 

insert into emp (emp_id,emp_name,dept_id) values 
(121,'archit',101),
(122,'mudit',102),
(123,'soniya',102),
(124,'lokesh',104),
(125,'devendra',105);

select * from dept;
select * from emp;

-- inner join 

-- we want to fetch emp name by department 
-- inner join 
-- give both the matching rows from both tables 
select e.emp_id,e.emp_name,d.dept_id
from emp e
inner join dept d 
on e.dept_id=d.dept_id;
-- left join 
-- it gives matching rows from right side but all data from left side 
select e.emp_id,e.emp_name ,d.dept_name
from emp e 
left join dept d 
on e.dept_id=d.dept_id;

-- right join 
-- it only give the matching rows from right side but all data from right side 
select e.emp_id ,e.emp_name,d.dept_name
from emp e 
right join dept d 
on e.dept_id=d.dept_id;
-- full outer join 
-- it gives the data from both tables (All data) but it gives the null if the data is not matching 
select e.emp_id,e.emp_name,d.dept_name
from emp e 
full outer join dept d 
on e.dept_id=d.dept_id;

-- cross join 
-- it gives cartesian product 
-- it returns the every row in emp is combined with every row in dept
-- it multiples the data of one value in a table with all other data for ex in this case if the number of id is 5 in 1 table 
--in other table if it is 5 again it will give cartesian product of 1 id for 5 times 
select * from emp cross join dept;
