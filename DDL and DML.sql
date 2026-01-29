/*
DDL => (Data Defination Language)
	-> create 
    -> drop
    -> truncate
    -> alter
*/
use regex1;
-- 1. Create :- object ko banana
			-- object means a structure that can be manage store and refer the data 
			-- tables,view are objects
create table a1(col int);
-- create table as select (CTAS)
create table actor_cp as 
select first_name as fname, last_name as lname from sakila.actor;
drop table actor_cp;
select * from actor_cp;

-- 2. drop => table's structor and data both are deleted
			-- use to drop objects
drop table actor_cp;

create table actor_cp as 
select first_name as fname, last_name as lname from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- 3. alter => -- Used to modify table structure
				-- used to modify object
alter table actor_cp add column (salary int); -- add column 
alter table actor_cp add constraint new_key primary key (fname); -- adding primary key
desc actor_cp;
alter table actor_cp drop column lname; -- column drop
alter table actor_cp rename column salary to new_salary; -- rename column


/*
DML => Data manipulation language
	-> insert
    -> update  set  col=value
*/

set sql_safe_updates=0;
update actor_cp set new_salary=900;
update actor_cp set new_salary=888 where fname='UMA';
select * from actor_cp;





