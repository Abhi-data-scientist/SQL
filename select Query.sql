  use world; 
  show tables;
  
  -- to see column of table country
  describe country;
  
  -- print
  select * from country;
  
  --  to see three columns
select name , region, population from country;

-- any order you can print column
select name, population, region from country;

-- can do any calculation 
-- calculation se original table me change nhi hota 
select population+500 from country;

-- SQL case insensetive hota hai 
-- indentation ki bhi need nhi hoti 
-- query shi honi chahiye

-- mysql and rdbms row by row data access krta hai ise
-- hi row database kehte hai 


-- to filter we use where
select * from country where continent='Asia'; 

select * from country where indepyear=1984;

/*
what is database
file system vs dbms 
dbms vs rdbms
type of dbms and write a brief about it 
*/ 

