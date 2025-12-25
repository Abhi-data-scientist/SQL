-- Functions in SQL
use world;
-- Numeric and date functions
-- 1. round => 0.5 se jyda than 1 value up ho jata hai
		-- => decimal values me change krna 
select lifeexpectancy, round(lifeexpectancy) from country;
select 30.68, round(30.68,1), 20.33, round(20.63,2);
-- => round =>  round of to nearest 10th place, nearest 10000
-- 456.12 => 6-one place, 5-10th place, 4-100th place
-- 6=> nearest 10 => 0 ya fir 10
-- 243 => nearest 10 => 240 

-- nearest 10th
select 2.435, round(2.435,-1);
select 514.00215, round(514.00215,-1);
-- nearest 100th
select round(27.0012,-2);
select round(467.26959,-2);
-- nearest 1000th
select round(789.10,-3);

-- 2. truncate() => yeh koi bhi value ko round off nhi krti
select round(3653.68,1), truncate(3653.68,1);
select round(3653.68,0), truncate(3653.68,0);
select round(3653.68,-1), truncate(3653.68,-1);

-- 3. mod => reminder
-- 4. ceil => upper value 
-- 5. floor => lower value 
-- 6. pow => power deta hai 
select mod(10,3), ceil(4.00000000001), floor(4.99999999), pow(2,4); 

-- date function
-- 1. now() => current date and time 
select now(), current_timestamp(), current_date(), current_time();

-- 2. add date function => by default date add, (month,year,time)
select now(), adddate(now(), 2);  -- => aaj ki date me 2 day add krr diya
select now(), adddate(now(), -2);	-- => aaj ki date me 2 day subtract krr diya
select now(), adddate(now(), interval 2 month);
select now(), adddate(now(), interval -2 year); 

select now(), year(now());
select now(), month(now());

-- extract => month, year, hour, minute, week
select now(), extract(week from now());

-- date_formate => extract but with a string (message)
select now(), extract(year from now()), date_format(now(), 'year is %Y');
select now(), extract(year from now()), date_format(now(), 'year is %M');




