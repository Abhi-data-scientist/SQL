use sakila;
select * from film;

-- case practice
select first_name, active,
case 
when active=1 then 'active customer'
when active=0 then 'inactive customer'
else 'farzi'
end as status
from customer;

select length ,
case 
when length>60 then 'short movie'
when length between 60 and 120 then 'medium'
else 'long'
end 
from film;

select * from film;
select rating, count(*), 
case
	when count(*)<200 then 'low count'
    when count(*) between 200 and 400 then 'medium count'
    else 'high count'
end as counts
from film group by rating ;
		
select * from customer;
select * from payment;
select p.customer_id, c.first_name, sum(amount),
case
when sum(amount) < 90 then 'Low spend'
    else 'High spend'
end
from payment as p
join customer as c
where p.customer_id = c.customer_id
group by p.customer_id , c.first_name;

select * from film;
select * from inventory;
select * from rental;

select f.title, count(r.rental_id) from rental as r
join inventory as i
on r.inventory_id = i.inventory_id
 join film as f
on i.film_id = f.film_id
group by f.title;

select * from customer;
desc customer;
select c.customer_id, c.first_name, c.store_id, cu.store_id, cu.customer_id, cu.first_name  from customer as c
join customer as cu
on c.store_id = cu.store_id
where c.store_id = cu.store_id
and c.customer_id <> cu.customer_id;


select * from customer;
select * from payment;

-- find the customers whose total payment is greater then the average total payment of all customer 

with cte as 
(select customer_id,sum(amount) as total  from payment group by customer_id)
select c.customer_id, first_name, sum(amount) from customer as c 
join payment as p 
on c.customer_id = p.customer_id
group by c.customer_id, first_name
having sum(amount)> (select avg(total) from cte);


select customer_id,sum(amount) as total  from payment group by customer_id;
select customer_id,avg(total) as total  from (select customer_id, sum(amount) as total from payment group by customer_id) as t;


-- find films whose rental count is greater than the average rentals per film 
select * from film;
select * from inventory;
select * from rental;


select f.film_id, f.title, count(r.rental_id) from rental as r
join inventory as i
on r.inventory_id = i.inventory_id
 join film as f
on i.film_id = f.film_id
group by f.title, f.film_id
having count(r.rental_id)>all(select avg(r.rental_id) from rental as r
join inventory as i
on r.inventory_id = i.inventory_id
 join film as f
on i.film_id = f.film_id
group by f.film_id);

with cte as 
(select f.film_id, f.title, count(r.rental_id) from rental as r
join inventory as i
on r.inventory_id = i.inventory_id
 join film as f
on i.film_id = f.film_id
group by f.title, f.film_id)

select 











