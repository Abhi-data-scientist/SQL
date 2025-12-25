/*
Aggregate function :- multiline function => 
						will give you some result
						can apply on multiple columns
*/

-- 1. distinct => gives unique values
			-- => it's keyword 
            -- => also used as function
select distinct continent from country;
select distinct continent, region from country; -- dono ke combination ki distinct value print krega

-- aggregate function -> used to apply some calculation over set of rows
 -- 2. count() => only data present will be counted 
 select count(indepyear) from country;
 select count(*) from country;

select count(population), sum(population), avg(population), max(population), min(population) from country;

select count(continent), count( distinct continent) from country;

select name, indepyear from country where continent='Asia';

-- get the total country, and the total region along with the avg life expectancy and the total population
-- for the country is who have got the independence after 1947 and before 1998
select count(name), count(region),avg(LifeExpectancy), sum(population) from country where indepyear>1947 and IndepYear<1998;

-- get the total number of countries, the unique regions along with the total population and heighest lifeexpectancy rate
-- with the total capitals for the countries starting with letter a and the latter with d

select count(name), count(distinct region), sum(population), max(lifeexpectancy), count(capital) from country where name like 'a%' or name like'd%';
select count(name), count(distinct region), sum(population), max(lifeexpectancy), count(capital) from country where left(name,1)='a' or left(name,1)='d';








