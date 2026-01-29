/*
Data types :-
			
*/

use regex1;
drop table order1;
create table customer1 (cid int primary key, cname varchar(50));
insert into customer1 values(10,'aman'),(11,'abhi');

create table order1 (oid int, city varchar(50), cid int, foreign key (cid) references customer1(cid));
insert into order1 values(1009,'jaipur',10),(10010,'goa',11),(10011,'j k', 10);

select * from customer1;
select * from order1;

/* 1. Numbers => int , decimal
		tinyint -> 1byte => 8bit => 2**8 => (-128 to 127),
        smallint -> 2byte
        mediumint -> 3byte
        int -> 4byte
        bigint -> 5byte
	decimal =>
			float
            double
*/

create table abhi(salary tinyint);
insert into abhi values(127);
insert into abhi values(128); -- out of range of tinyint

create table abhi1(salary float, price double);
drop table abhi1;
insert into abhi1 values(10.3213465, 100.4684986);
select * from abhi1;

/* 
String values -> 
			char => fixed length/size character
				=> fast 
                => use in country codes etc 
                => last waale whitespaces truncate ho jaate hai 
            varchar() => variable length character 
					=> will have the white spaces upto the size of the column
            
*/

create table abhi2(name varchar(20), gender char(10));
insert into abhi2 values('abhi','male'), ('tushar', 'male'), ('akaksha', 'female');
select * from abhi2;
insert into abhi2 values('abhi          ','male          ');
select *, length(name), length(gender) from abhi2;





