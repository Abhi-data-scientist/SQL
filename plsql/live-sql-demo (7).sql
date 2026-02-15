-- create or replace procedure second_procedure(salary in int)
-- as 
-- begin 
--     dbms_output.put_line('procedure input value  ' || salary);
--     procedure_test;
    
-- end;


-- create or replace PROCEDURE third_procedure(num in int)
-- as 
-- a_num int;
-- begin 
--     a_num := num;
--     while a_num<11 loop 
--         dbms_output.PUT_LINE(a_num);
--         a_num := a_num+1;
--     end loop;
-- end;

-- create or replace procedure fourth_procedure (salary in int, newsalary out int )
-- as 
-- begin
--     DBMS_OUTPUT.PUT_LINE('procedure intput value : ' || salary);
--     newsalary := salary+500;

-- end;

create or replace procedure fifth_procedure (salary in out int)
as 
begin
    DBMS_OUTPUT.PUT_LINE('procedure intput value : ' || salary);
    salary := salary+500;

end;


-- function must return a value 
-- can be called directly with sql statements
-- can not manage trnasection 

-- procedures may or may not return a value
-- cannt be called directly with sql statements
-- can be manage trnasection