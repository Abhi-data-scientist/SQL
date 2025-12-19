use world;
show tables;
-- city ( id pk) country code => foreign key
select * from city; 
describe city;


-- code is primary key
select * from country;
select count(code) , count(distinct code) from country;
describe country;

select cy.id, cy.name, cy.countrycode from city as cy ;
select cnt.name, cnt.code, cnt.continent from country as cnt;

select cy.id, cy.name, cy.countrycode, cnt.code,cnt.name, cnt.continent from city as cy
	join 
    country as cnt
    where cy.countrycode = cnt.code;
    

-- find the city name , population the country name along with the govt form for each city

select cy.name, cy.population , cnt.name, cnt.governmentform from city as cy
	join
    country as cnt
    where cy.countrycode = cnt.code;
    
select * from countrylanguage;

 -- get the country name , it's population and the language spoken with the percentage with each language 
 select cnt.name , cnt.population, cl.language, cl.percentage from countrylanguage as cl
 join country as cnt
 where cnt.code=cl.countrycode



