-- **************************************************
-- APPLY DDL
-- **************************************************

create database multi_datasets;
use multi_datasets;

create table brands (
brand_id int primary key ,
brand_name varchar(100)
);

create table categorise (
category_id int primary key,
category_name varchar(100) 
);

create table customers (
customer_id int primary key ,
first_name varchar(100),
last_name varchar(100),
phone varchar(20) ,
email varchar(90),
street varchar(50),
city varchar(50),
state varchar(50),
zip_code varchar(10)
);

create table stores (
store_id int primary key,
store_name varchar(100),
phone varchar(20) ,
email varchar(50),
street varchar(90),
city varchar(50),
state varchar(10),
zip_code varchar(10)
);

create table products (
product_id int primary key,
product_name varchar(100),
brand_id int ,
category_id int,
model_year int,
list_price decimal(10,2) ,
foreign key (brand_id) references brands (brand_id),
foreign key (category_id) references  categorise (category_id)
);



create table stocks (
store_id int ,
product_id int ,
quantity int,
primary key (store_id , product_id),
foreign key (product_id) references products (product_id),
foreign key (store_id) references stores (store_id)
);

create table staffs (
staff_id int primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(60),
phone varchar(20),
active int ,
store_id int,
manager_id int,
foreign key (manager_id) references staffs (staff_id),
foreign key (store_id) references stores (store_id)
);


create table orders (
order_id int primary key ,
customer_id int ,
order_status int ,
order_date date,
required_date date,
shipped_date date,
store_id int ,
staff_id int ,
foreign key (customer_id) references customers (customer_id),
foreign key (store_id) references stores (store_id),
foreign key (staff_id) references staffs (staff_id)
);


create table order_items (
order_id int ,
item_id int ,
product_id int ,
quantity int ,
list_price decimal(10,2) ,
discount decimal(4,2) ,
primary key (order_id, item_id),
foreign key (order_id) references orders (order_id),
foreign key (product_id) references products (product_id)
);


select *
	from multi_datasets.brands limit 5;
    
    
    select *
	from multi_datasets.categorise limit 5;
    
    
    select *
	from multi_datasets.customers limit 10;
    
    
    
	select *
	from multi_datasets.order_items limit 10;
   
-- ******************************************************************
-- APPLY DML
-- 1- The SQL INSERT Statement
-- 2- The SQL UPDATE Statement
-- 3- The SQL DELETE Statement
-- ******************************************************************

select
	*
from
	brands
limit 10;
-- ******************************************************************

insert into brands
(
	brand_id,
	brand_name
)values
(
	31,
	'lobnaa'
);
    
-- ******************************************************************
select
	*
from 
	categorise
order by category_id desc
limit 10;
    
-- **************************************************    
-- Inserting Data INTO a New Table
-- **************************************************

create table departments 
(
    dept_number char(4) not null,
    dept_name varchar(40) not null
);

insert into departments values ('d010', 'Business Analysis');
    
select 
	*
from
	departments
limit 10;
-- **************************************************
-- update sql statment
-- **************************************************

select * from customers
where 
	customer_id = 30;
-- ******************************************************************
update customers
set 
	first_name = 'lobnaa',
    last_name = 'saad',
    city = 'kafrelsheikh'
where 
	customer_id = 30;
commit;  --  used to change data in the dataset we can also use 'rollback' to return data as it was

-- **************************************************
--  The DELETE Statement     
-- **************************************************


SELECT 
    *
FROM
    products
ORDER BY model_year;

DELETE FROM products;

ROLLBACK;

-- **************************************************
DELETE FROM departments 
WHERE
    dept_number = 'd010';


-- **************************************************
-- APPLY DQL 
-- The SQL SELECT Statement
-- AND & OR & NOT
-- in & not in
-- like & not like
-- between and
-- is null & is not null
-- other comparison operators
-- select distinct >> 'use to return unique values'
-- **************************************************

SELECT 
    first_name, last_name
FROM
    staffs;
    
-- ******************************************************************
SELECT 
    *
FROM
    staffs
WHERE
    first_name = 'Kali';

-- ******************************************************************
SELECT 
    *
FROM
    staffs
WHERE
    first_name = 'Kali' AND active = 1; -- AND maen 2 conditions should be true
-- ******************************************************************

SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Kasha' OR first_name = 'Debra';  -- OR maen at least 1 conditions should be true
-- ******************************************************************

-- unexpected syntax
 
SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Debra' AND first_name = 'Kasha';

-- ******************************************************************
SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Kasha' AND last_name = 'Todd' or customer_id = 3;
    
 -- ******************************************************************
 SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Kasha' AND (last_name = 'Todd' or customer_id = 3);
    
 -- ******************************************************************   
    
SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Tameka'
        OR first_name = 'Kasha'
        OR first_name = 'Kaylee';
-- same above code 
SELECT 
    *
FROM
    customers
WHERE
    first_name IN ('Tameka' , 'Kasha', 'Kaylee');
-- ******************************************************************
SELECT 
    *
FROM
    customers
WHERE
    first_name not IN ('Tameka' , 'Kasha', 'Kaylee');
    
    -- ******************************************************************
    
SELECT 
    *
FROM
    customers
WHERE
    first_name LIKE('S%'); -- name starts with S
-- ******************************************************************
    
SELECT 
    *
FROM
    customers
WHERE
    first_name LIKE('%s%'); -- name contain s
-- ******************************************************************
SELECT 
    *
FROM
    customers
WHERE
    first_name NOT LIKE ('%s%');
-- ******************************************************************   
SELECT 
    model_year
FROM
    products
WHERE
    model_year BETWEEN '2016' AND '2018';
-- ******************************************************************   

SELECT 
    manager_id
FROM
    staffs
WHERE
    manager_id IS NOT NULL; 
-- ******************************************************************
SELECT 
    manager_id
FROM
   staffs
WHERE
    manager_id IS NULL;
-- ******************************************************************
SELECT 
	manager_id
FROM 
	staffs
WHERE
	manager_id <> 'Null';
-- same above code != dont equal mark ******************************************************************
SELECT 
	manager_id
FROM 
	staffs
WHERE
	manager_id != 'Null';
-- ******************************************************************
SELECT DISTINCT
    manager_id
FROM
    staffs;
    
    
-- ******************************************************************
-- MYSQL Aggregation Functions
-- count() >> count rows
-- sum()
-- min()
-- max()
-- avg()
-- round()
-- group by()
-- order by()
-- having()
-- ******************************************************************
SELECT 
    *
FROM
    staffs
ORDER BY manager_id DESC
LIMIT 10; 

-- ******************************************************************
SELECT 
    COUNT(manager_id)
FROM
    staffs;
-- ******************************************************************
SELECT 
    COUNT(DISTINCT manager_id)
FROM
    staffs;
-- ******************************************************************
SELECT 
    COUNT(*)
FROM
    staffs;
-- ******************************************************************
SELECT 
    SUM(manager_id)
FROM
    staffs;
-- ******************************************************************
SELECT 
    MAX(manager_id)
FROM
    staffs;

SELECT 
    MIN(manager_id)
FROM
    staffs;
-- ******************************************************************
SELECT 
    AVG(manager_id)
FROM
    staffs;
-- ******************************************************************
SELECT 
    ROUND(AVG(manager_id))
FROM
    staffs;

SELECT 
    ROUND(AVG(manager_id), 2)
FROM
    staffs;
-- ******************************************************************
SELECT 
    *
FROM
    brands
ORDER BY brand_id desc;
-- ******************************************************************
SELECT 
    brand_id
FROM
    brands
GROUP BY brand_id;
-- ******************************************************************
SELECT 
    *
FROM
    customers
WHERE
    first_name = 'Tameka';
    
SELECT 
    *
FROM
    customers
HAVING
    first_name = 'Tameka';

-- ******************************************************************    
-- ******************************************************************
-- joins
-- 1- inner join
-- 2-left join
-- 3-right join
-- 4-full join
-- 5-self join
-- ******************************************************************

-- 1- inner join
select first_name,last_name,email,order_id,order_status, order_date
from orders O, customers C 
where C.customer_id = O.customer_id 
order by O.customer_id desc;

-- same code

select first_name,last_name,email,order_id, order_status, order_date
from orders O join customers C 
on C.customer_id = O.customer_id ;



select first_name,last_name,email,order_id, order_status, order_date
from orders O join staffs S 
on O.staff_id = S.staff_id ;

-- concatenation
select concat(first_name ,",", last_name) from customers as full_name;
-- ****************************************************************** 
-- join more than 2 tables

select first_name , last_name, order_id, order_date, store_name, s.street, s.city
from customers c, orders o, stores s
where c.customer_id = o.customer_id and o.store_id = s.store_id;

-- same code

select first_name , last_name, order_id, order_date, store_name, s.street, s.city
from customers c join orders o on c.customer_id = o.customer_id join  stores s on o.store_id = s.store_id;
-- ******************************************************************
select o.order_id, order_date, p.product_id, product_name, p.list_price
from orders o, products p, order_items i
where o.order_id = i.order_id and i.product_id = p.product_id;
-- ******************************************************************
select first_name, last_name, email, o.order_id, order_status, order_date,item_id, i.list_price, discount, p.product_id 
from customers c, orders o, order_items i, products p
where c.customer_id = o.customer_id and o.order_id = i.order_id and i.product_id = p.product_id;
-- ******************************************************************  
-- left join
select first_name, last_name , order_id,order_date , shipped_date
from customers c
left join orders o on c.customer_id = o.customer_id;
-- ****************************************************************** 
-- right join
select first_name, last_name,order_id,order_date, shipped_date
from customers c
right join orders o on c.customer_id = o.customer_id;
-- ****************************************************************** 
-- full join    
select first_name, last_name,order_id,order_date, shipped_date
from customers c
left join orders o on c.customer_id = o.customer_id

union

select first_name, last_name,order_id,order_date, shipped_date
from customers c
right join orders o on c.customer_id = o.customer_id;
-- ******************************************************************     
-- self join
select c.first_name , c.last_name, u.first_name, u.last_name
from customers c
right join customers u on c.customer_id = u.customer_id;
    
    

