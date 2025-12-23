CREATE DATABASE REGEX;
USE REGEX;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);

show tables;
select * from customers;
select * from orders;

select c.cid, c.customer_name,o.customer_id,o.amount from customers as c
join orders as o 
where c.customer_id=o.customer_id;

-- same output 
-- 1. inner join => it prints common output
select c.cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
inner join orders as o 
on c.customer_id=o.customer_id;

-- 2. outer join => it gives common and other all data 
			  -- => it gives nul on non mathching data
-- a. left join =>  it give all  data of left table 
select c.cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
left join orders as o
on c.customer_id=o.customer_id;

-- b. right join => it gives all data from right table
select c.cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
right join orders as o
on c.customer_id=o.customer_id;



-- 3. natural join => here we don't define any condition 
				-- => here the condition impliment implicit (andr hi andr apne aap lag jaati hai)
                -- => same as inner join 
                -- => common column is neceassary
select c.customer_id, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
natural join orders as o ;

alter table customers rename column customer_id to cid;
desc customers;

-- here it will be many to many relationship
-- it will also called cross or cartesian join
-- jab koi bhi column common nhi hoga tba yeh chiz hoyegi 
-- because of this we don't use this in sql
select c.cid, c.customer_name, o.order_id, o.customer_id, o.amount from customers as c
natural join orders as o ;

-- what is total amount spent by each customer
select c.customer_name, sum(o.amount) from customers as c
inner join orders as o
on c.cid=o.customer_id 
group by c.customer_name;

-- find actor_id and actor name and in which movies they work
use sakila;
select * from film;
select * from film_actor;
select * from actor;

select a.actor_id, a.first_name, count(fa.film_id) from actor as a
join film_actor as fa
where a.actor_id=fa.actor_id
group by a.actor_id;

/*
what is super key
what is candidate key
what is normalization
what is 1NF, 2NF, 3NF
partial dependency => non key attribute
what are outer join
what is self join
*/






