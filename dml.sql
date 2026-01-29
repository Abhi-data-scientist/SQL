use regex1;
drop table actor_cp;
create table actor_cp  as 
select first_name as fname, last_name as last from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;
set sql_safe_updates=0;
update actor_cp set last='bairwa' where fname='ZERO';

/*
delete :-
		delete is a dml statement
		we provide condition 
        we can roll back 
		delete always delete the data
		it will never changes in structure
*/
delete from actor_cp;

/*
truncate :-
		this is ddl statement
        we do not provide any condtions 
        we can not revert(roll back) data 
        in case we execute any ddl statement we can not roll back data
*/
truncate actor_cp;


