-- subquery is the query within the another query
-- it is also called as inner query or nested query
-- use to acces the data based on the conditions

-- use to filter the data as a condtion for outer query
-- it is use to filter or appy calculation on data based on dynamic conditons
-- outer(nested/inner) => subquery

use sakila;
select * from payment;
select * from payment where amount=(select amount from payment where payment_id=5);
--  get the payment id and amount where amount is not equal to the amount of payment id 23
select payment_id, amount from payment where amount!=(select amount from payment where payment_id=23);
-- get the payment id coustomer id amount and paymentdate where the month of payment should be same as the payment id 6
select payment_id, customer_id, amount, payment_date from payment where month(payment_date)=(select month(payment_date) from payment where payment_id=6);

-- where the staff serving the customer should be same as of payment_id = 7
select * from payment where staff_id = (select payment_id from payment where payment_id=7);

-- get all the payment information where the amount is same as max() payment table
select * from payment where amount=(select max(amount) from payment);

-- get the amount and the total number of payments done for each amount only for
-- those payment whose amount is less than the amount of rental id 1725

select amount, count(payment_id) from payment where amount < (select amount from payment where rental_id=1725) group by amount;

-- get the month and the total amount spend only for 
-- those customers whose month of payment is > customer_id 1 and payment id 3
select month(payment_date), amount from payment where month(payment_date)>(select month(payment_date) from payment where customer_id=1 and payment_id=3);

-- multi row subquery 
-- in , any , all