use sakila;
show tables;

select count(*), count(distinct(actor_id)) from actor; 

select count(*), count(distinct(actor_id)) from film_actor;

select a.first_name, a.actor_id from actor as a
join film_actor as  fa 
where a.actor_id=fa.actor_id;


--  two columns make primry key than it calls composite key
desc film;
select * from film_actor;
desc film_actor;



select fa.film_id, fa.actor_id, f.film_id, f.title from film_actor as fa
 join film as f
 where fa.film_id = f.film_id; 
 
 select * from actor;
 desc actor;
 select * from film_actor;
 desc film_actor;
 select * from film;
 desc film;
 
 select a.actor_id,fa.film_id,f.title from actor as a
 join film_actor as fa
 join film as f
 where a.actor_id=fa.actor_id and fa.film_id=f.film_id order by a.actor_id;
 
 -- what are inner join
 -- what are outer join 
 -- types of outer joins
 