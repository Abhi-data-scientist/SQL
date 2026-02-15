/*
Triggers :-
    -> triggers like a block of code that will autometicaly execute when a event happened
    -> event like insert update delete
    -> these triggers are stored in the database 
    -> use in auditing/monitering (kis user ne kab ky kiya )
    -> backup 
    -> ek table ko dusri table se sync krna 

    -> trigger have two type 
        1. row level -> her row ke liye chlta 
        2. statement level -> kisi ek statement ke liye chalate hai 
*/

-- create table emp_copy as
-- select employee_id, first_name
-- from hr.employees where employee_id between 100 and 105;

-- select * from emp_copy;

-- create or replace trigger emp_trigger_1
-- before insert 
-- on emp_copy

-- begin 
--     dbms_output.PUT_LINE('trigger called before the insert statement');
-- end;

-- insert into emp_copy values(999, 'regex');

-- create or replace trigger emp_trigger_2
-- after insert 
-- on emp_copy

-- begin 
--     dbms_output.PUT_LINE('trigger called after the insert statement');
-- end;

-- insert into emp_copy values(998, 'regex');

-- create or replace trigger emp_trigger_3
-- after update 
-- on emp_copy 
-- for each row
-- BEGIN
--     dbms_output.PUT_LINE('trigger called after the update statement');
-- end;
-- /
-- update emp_copy set first_name = 'abhi';

-- create or replace trigger emp_trigger_4
-- after update or INSERT
-- on emp_copy 
-- for each row

-- begin 
--     if updating then
--         dbms_output.put_line('Trigger called before the update statement');
--     else 
--         dbms_output.PUT_LINE('we inserted');
--     end if;
-- end;
-- /

-- update EMP_COPY set first_name = 'Abhishek';
-- insert into emp_copy values(898, 'tushar');