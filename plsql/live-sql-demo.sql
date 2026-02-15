-- declare
--     var int :=0;

-- begin

--     dbms_output.put_line('Hello world');
--     dbms_output.put_line('Rgex_software');
--     dbms_output.put_line('hey' || '-' || 'Abhishek');
--     dbms_output.put_line('hello' || ' ' || var);

--     var := 12; -- value is changed
--     if mod(var, 2)=0 then 
--         dbms_output.put_line('Even Number');
--     else
--         dbms_output.put_line('Odd Number');
--     end if ;

--     while var<=3 loop 
--         DBMS_OUTPUT.PUT_LINE('counter is ' || var);
--         var := var+1;
--     end loop;

-- end;

-- LOOPS

-- declare 
--     var int := 0;

-- begin
--     while var<=3 loop 
--         DBMS_OUTPUT.PUT_LINE('counter is ' || var);
--         var := var+1;
--     end loop;

-- end;

-- select * from hr.employees;

declare 
    v_name varchar(20);
    v_salary hr.employees.salary%type;
    v_rec hr.employees%rowtype;

begin
    select first_name into v_name from hr.employees where employee_id=100;
    select salary into v_salary from hr.employees where employee_id=100;
    select * into v_rec from hr.employees where employee_id = 100;
    -- dbms_output.PUT_LINE(v_name ||'-' || v_salary);
    DBMS_OUTPUT.PUT_LINE(v_rec.first_name || '  ' || v_rec.hire_date);
end;

-- create a plsql program to find a number is armstrong or not 
-- a number is prime or not 
-- using while loop find out the lcm of two numbers 

-- what is cursor and type of cursor