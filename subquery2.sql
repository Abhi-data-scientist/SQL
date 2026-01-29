
-- singal row subquery => ek query
-- 					   => 1 row return
use sakila;
select * from payment;
/*
 multirow subquery 
			=> comparision operators can not use 
            => when inner query returns one or more than one output to outer query

*/

-- 1. in => given list of values me se check krta hai 
select * from payment where amount in (select amount from payment where payment_id=3 or payment_id=2);

-- 2. any => 
--  dono me se koi sa bhi 
select * from payment where amount = any (select amount from payment where payment_id=3 or payment_id=2);
--  subquery ki kisi bhi value se bda 
select * from payment where amount > any (select amount from payment where payment_id=3 or payment_id=2);
--  kisi se bhi bda ya barabar
select * from payment where amount >= any (select amount from payment where payment_id=3 or payment_id=2);
-- kisi se bhi chota
select * from payment where amount < any (select amount from payment where payment_id=3 or payment_id=2);

-- 3. all => 
-- sbse bda
select * from payment where amount > all (select amount from payment where payment_id=3 or payment_id=2);
-- sbse chota
select * from payment where amount <= all (select amount from payment where payment_id=3 or payment_id=2);

-- Q. Get all the payment information where the month of payment should be same as month of payment_id 2 or 3 
select * from payment where month(payment_date) in (select month(payment_date) from payment where payment_id=3 or payment_id=2);

-- Q. get all the payment info whose amount is larger than among all the amount of payment id 2 to 8 
select * from payment where amount > all (select amount from payment where payment_id=2 or payment_id=8);

 
-- ifnull(gdp,0)

--  what are correlated subquery and how they are executed 
--  what are constraints in sql 










