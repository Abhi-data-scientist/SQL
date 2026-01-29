/*
Constraints :-
			=> constraints are the rule that is applied to the table to not allow the invalid data entry 
            => so that we can remove or restrict the invalid data entry
            => it is use to maintain data accuracy and consistency (if the data is in valid so the complete operation will be aborted (stoped)

table :-
		=> DDL statement (data defination language)
        => create, alter, drop, truncate
        
        => DML statement (data manipulation language)
        => insert, update, delete, merge
*/

create database regex1;
use regex1;
create table test1(sno int);  -- table create (sno column name)
describe test1; 
drop table test1;
select * from test1;

insert into test1 values(10);
insert into test1 values(11);
insert into test1 values(12),(null),(30); -- 3 rows insert

select count(sno), count(*) from test1;
-- count(column) => null ko count nhi krta 
-- count(*) 	 => sbko count krta hai 

-- constraints
-- 1. Not Null => by the the column can not allow null values 
create table test2(sno int not null, salary int);
select * from test2;
insert into test2(sno, salary) values(20,10000);
insert into test2(sno, salary) values(20,null);
insert into test2(sno, salary) values(null,10000); -- give error
insert into test2(sno) values(11);
insert into test2(salary) values(50000); --  give error

-- 2. Default => here we can set default value for the column 
create table test3(sno int not null default 80, salary int);
select * from test3;
insert into test3(salary) values(50000);

-- 3. Unique => allow only unique values
			-- => allow multiple null values
            -- => main difference b/w primary and unique key is duplicacy of null values 
create table test4(sno int not null, salary int unique default 100);
drop table test4;
insert into test4(sno,salary) values(1000,2000);
insert into test4(sno,salary) values(1001,2000); -- give error duplicate values
insert into test4(sno) values(600);
insert into test4(sno) values(700); --  error 100 is a value already in table
insert into test4(sno,salary) values(1001,null);
insert into test4(sno,salary) values(1001,null); -- no error bcz null means no data 

-- 4. check =>  check conditions
create table test5(
sno int , salary int,
constraint regex_test5_sno_chk check (sno between 1 and 100),
constraint regex_test5_salary_chk check (salary in (1000,2000))
);
drop table test5;
insert into test5(sno,salary) values(1,2000);
insert into test5(sno,salary) values(4,5000); -- error regex_test5_salary_chk constraint is violated
insert into test5(sno,salary) values(0,2000); -- error regex_test5_sno_chk check constraint is violated


/* create a table name as employee 
	employee id as primary key
    employee name of varchar
    email column with unique contraint
    college with a default value 
    age with condition with a condition greater than 18
    gardian name should be a plaindrome
*/

create table employee(
	eid int primary key,
    ename varchar(50),
    email varchar(50) unique,
    college varchar(50) default 'Regex',
    age int,
    gardian varchar(50),
    constraint regex_employee_age_chk check (age>18),
    constraint regex_employee_gardian_chk check (reverse(gardian)=gardian)
);

insert into employee(eid,ename,email,college,age,gardian) values
(100, 'Abhi', 'mr.abhi1149@gmail.com', 'ciitm', 25, 'naman');
select * from employee;




