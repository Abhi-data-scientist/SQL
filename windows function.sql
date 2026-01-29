/*
WINDOW FUNCTION =>
				-> It allows to applys aggregate function with each row
                -> use to perform a calculation on a set of rows 
						with refrence to current row
                -> there are majorly three parts 
					1. over => to apply the function over a window
                    2. partition by => 
*/

use world;
select * from country;
select code, name, population from country;

--  total population
select sum(population) from country;

-- print the total population with each row
select code, name, continent, population, (select sum(population) from country) from country;


-- over() => when we want to use aggregate function over the set of rows
select code, name, continent, population,
sum(population) over(), avg(population) over() from country;
 
 -- Partition by => Divides the rows into groups(Partitions)
 select continent, sum(population) from country group by continent;
 
 select code,name,continent,population,
 sum(population) over(partition by continent) from country
 
 






