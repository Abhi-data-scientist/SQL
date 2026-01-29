/*
Group by :-
		=> similar values ko collect krna 
        => jis bhi column per group by lgta hai whi column select me use hoga 

SQL Execution Order :-
			FROM
			WHERE
			GROUP BY
			HAVING
			SELECT
			ORDER BY
            
Where vs having :-
			# where -> filter rows
					-> Executed before group by 
                    -> Aggregate functions are not allowed
                    
			# having clause -> filter groups
							-> Executed after group by 
                            -> Allowed Aggregate functions
*/

use world;
select * from country;
select continent from country group by continent;

-- sum of population of each continent
select continent, sum(population) from country group by continent;

-- how many countries which are independend after 1950 in asia
select continent, count(name) from country where continent = 'Asia' and indepyear>1950;

-- how many countries which are independend after 1950 in each continent
select continent, count(name) from country where indepyear>1950 group by continent;

-- print the continent which have more than 30 countries
select continent, count(name) from country group by continent having count(name)>30






