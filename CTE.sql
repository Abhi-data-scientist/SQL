/*
CTE => common table expression 
	-> this is temporary result for a sql query
    -> it can be access before the the query is terminated
    -> this can not stored permanently 
    -> helps to break down complex queries into smaller 
    -> 
*/

with tushar_cte as 
(select * from sakila.actor)
select * from tushar_cte;

with tushar_cte as 
(select * from sakila.actor where actor_id between 5 and 90)
select * from tushar_cte;

select * from tushar_cte; -- give error

with cte as 
(select *, month(payment_date) from sakila.payment)
select month(payment_date), count(*) from cte group by month(payment_date);

-- second largest amount ki all details 
with cte as 
(select *, dense_rank() over(order by amount desc) as rankings from sakila.payment) 
select * from cte where rankings = 2;

-- her customer ka second largest amount ki all details 
with cte as 
(select *, dense_rank() over(partition by customer_id order by amount desc) as rankings from sakila.payment) 
select * from cte where rankings = 2;










