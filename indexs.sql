-- make a group(role) in which add a user after that give a permission to a role and than show grants 

use sakila; 
drop table test100;
create table test100 as select actor_id, first_name from actor where actor_id between 1 and 10;
-- ctas se koi bhi constraint copy nhi hota 
select * from test100;
desc test100;

-- explain -> kisi bhi row ko dhundhna chahte hai toh yeh btata hai ki kaise query chal rhi hai 
--  		kaise rows filter ho rhi hai 
-- 			why the query is slow 
-- 			performance increase krna 

explain select * from test100 where actor_id=5;
/*
object - this is a structure where we can manage data 
		-> cte, indexes, database, 

Indexes => Indexes are a data structure which is used to acess your data in a faster way 
		=> this is object
Types of indexes ->
		a. clustered index
			-> sorted formate me data store hota hai 
			-> Table ka physical order change karta hai
			-> Ek table me sirf 1 clustered index ho skta hai
			-> Mostly Primary Key par hota hai
            
        b. non- clustered index
			-> physical order change nhi krta 
            -> multiple column allowed hote hai 
*/-- 

-- clustered
insert into test100 values(14,'abc'), (13,'def'), (12,'abhi'), (11,'div');

select * from test100;

-- alter statement
alter table test100 add primary key(actor_id);
alter table test100 drop primary key;

select * from test100;
desc test100;

select * from test100 where actor_id=5;
explain select * from test100 where actor_id=5;
explain select * from test100 where first_name = 'NICK';

-- non clustered
select * from test100;
create index indx1 on test100(actor_id);
drop index indx1 on test100;
--  cardinality means unique
show index from test100;
explain select * from test100 where actor_id = 5;
explain select * from test100 where first_name = 'aman';

-- duplicate values
insert into test100 values(14,'abc'), (13,'def');
explain select * from test100 where actor_id=13;


-- index on 2 values 
create index indx_composite on test100(actor_id, first_name);
show index from test100;


explain select * from test100 where actor_id=3;
-- sequence matter krta hai 
explain select * from test100 where first_name = 'abc';

explain select * from test100 where actor_id > 10 and first_name = 'abc';

-- PARTIAL INDEX 
insert into test100 values(16,'PENNING'), (17,'NICKPRIYANKA'), (18,'JOHLLY'), (19,'JOEROOT'), (20,'divyansh');
show index from test100;
drop index indx_composite on test100;
select * from test100;

create index index_3_char on test100(first_name(3));
show index from test100;

explain select * from test100 where first_name='JOHNNY';
explain select * from test100 where first_name = 'JOEROOT';

explain select * from test100 where first_name like 'JOH%';

