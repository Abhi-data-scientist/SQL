/*
ddl
dml
tcl
dql
DCL =>  data control language
	=> permission which user can accessbility
	=> authentication (identify krta hai user ki identification) and authorization(ky ky permissions deni hai user ko)
    
*/

-- user -> create -> permission
-- ddl statement
create user regex identified by 'regex';

select * from mysql.user;

create database tushardb;
create table tushardb.actor1 as select actor_id, first_name from sakila.actor 
where actor_id between 1 and 5;

create table tushardb.actor2 as select actor_id, first_name from sakila.actor 
where actor_id between 3 and 7;

show grants for regex;
-- @ -> kis jgh se 
-- % ->  ip address

-- grant permission on database
grant select on tushardb.actor2 to regex;

-- granting permission to all tables in this data base 
grant select on tushardb.* to regex;

grant all privileges on tushardb.actor1 to regex



/*
assignments
give the privileges
give update and delete
try to revoke thos privileges
what is role -> add users and give permission to a group 

*/