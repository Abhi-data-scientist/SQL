use world;
show tables;
select * from country;
select name , population from country;
select continent, count(name) from country where indepyear>1950;
select continent, count(name) from country where indepyear > 1950 group by continent;
select continent, count(name) from country group by continent having count(name)>30;
select continent, sum(population) from country group by continent having sum(population)>100;
select IndepYear, count(Name) from country where indepyear>1930 group by indepyear having count(name)>2;

select governmentform , count(name) from country group by governmentform having count(name)>20;
select governmentform , count(name) from country  where capital>30 group by governmentform;
select continent, sum(name), sum(population),count(region) from country where lifeexpectancy>38 group by continent having sum(population)>30; 

use sakila;
show tables;
select count(*) from payment where amount = 2.99;
select amount , count(amount) from payment group by amount;
select * from payment;
select customer_id , sum(amount) from payment where amount > 3 group by customer_id;
select customer_id , count(amount) from payment where month(payment_date)=5 group by customer_id;

 -- find out the maximum amount of transection amount the avg transection amount and the total trans. amount done through each staff
select staff_id , max(amount) , avg(amount) , sum(amount) from payment group by staff_id;

 -- find out the maximum amount of transection amount the avg transection amount and the total trans. amount done through each staff which only for the even number of customer id 
select staff_id , max(amount) , avg(amount) , sum(amount) from payment where customer_id%2=0 group by staff_id;

-- get the amount and the total trans done for each amount only for the payment done through staff id 1 and the total trans should be > 30
select amount ,  count(amount) from payment where staff_id=1 group by amount having count(amount)>30;

-- find out the number of customer served avg amount and the total amount spend in each month for staff id 1 and 2
-- find out the number of customer served avg amount and the total amount spend in each month for staff id 1 and 2 done for each month and each year

select month(payment_date), count(customer_id) , avg(amount) , sum(amount) from payment where staff_id=1 or staff_id=2 group by month(payment_date);
select month(payment_date) , year(payment_date), count(customer_id) , avg(amount) , sum(amount) from payment where staff_id=1 or staff_id=2 group by year(payment_date),month(payment_date);


-- order by it sort the data 
-- order by customer_id desc
select * from payment order by customer_id , amount;
