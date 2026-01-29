use world;
select * from country;

select population, sum(population) from country; -- error

select code, name, continent, population,region, 
sum(population) over(),sum(population) over(partition by continent), sum(population) over(partition by continent, region) from country;

select name, continent, region, 
avg(population) over(), avg(population) over(partition by continent), avg(population) over(partition by continent, region) from country;

