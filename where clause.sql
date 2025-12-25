/*
where clause :-
	use to filter data
    
*/

use world;
show tables;
select * from country;

select * from country where continent = "Asia";
select * from country where indepyear = 1991;

select name, continent,indepyear from country where indepyear=1991;
-- In operator for specific
select name, continent from country where continent In ("Asia","Africa");
select name, continent, indepyear from country where indepyear not In (1960,1991);
-- Between operator for range
select name, continent, indepyear from country where indepyear between 1960 and 1991;
select name, continent, indepyear from country where indepyear not between 1960 and 1991;

/*
Question:-
	1.  get the country name in the continent where the region is not south eorupe
    2.  get the country name , continent , population along with 10% increment in the population
    3.  get all the columns where the life expectency is either 75.1 or 77.8 or 63.7
    4.  get the country name , population , region where the population should not be from 50000 to 300000
*/

select name, continent, region from country where region != "Southern Europe";
select name, continent, population+(population*10)/100 from country;
select * from country where lifeexpectancy in (75.1,77.8,63.7);
select name,  population, region from country where population not between 5000 and 300000;


-- Like operator => Match pattern
-- name => letter start, letter include, letter end
-- % => special character / wildcard character
-- % => zero or more character

-- _ underscore : only 1 character

-- start with A => A%
select * from country where name like 'A%';
select * from country where name like 'An%';

-- end with A => %A 
select * from country where name like '%a';
select * from country where name like '%h';

--  every where in the word => start, middle, end => %r%
select * from country where name like '%ab%';
-- we can also use not in this
select * from country where name not like "a%";

-- Ir se start ho or sirf 4 character ka hi word ho 
select * from country where name like 'Ir__';
-- only 4 character ka word ho 
select * from country where name like '_____';
-- first kuch bhi but second u hona chahiye 
select * from country where name like '_u%';

-- 1.  get the country name in the continent where the continent start with the latter 'n'
select name, continent from country where continent like 'N%';
-- 2.  get the country name in the continent where the continent with the second last latter 'p'
select name, continent from country where continent like '%p_';
-- 3.  get the countries which have the continent have minimum 4 characters 
select name, continent from country where continent like '____%';
-- 5.  get the name and continent where the second latter is a and the second last latter is a from the region column
select name, continent, region from country where region like '_a%a_';
-- 6.  get the region name where the third character is 'c' and the last three character is 'sia'
select name, continent, region from country where region like '__c%sia';
-- 7.  get the name and region where the continent is not america or south america
select name, region from country where continent not in ('America','South America');











 

