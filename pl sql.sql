/*
Pl/sql (procedural language/standard query language):- (crud opertions use krta hai sql => create, update, delete)
    -> Pl means procedural sql language
    -> pl is extension of sql where we combine the capability of sql and programming language together
    -> Why we use it =>
			-> reusibility
            -> error handling
            -> we can use control flow structures like if-else, while, for loop and functions
            
Pl sql blocks =>
		-> declaration block => agar hume koi bhi variable , function , cursor, exception define krte hai toh isi block me krte hai 
		-> begin-end block => it is executable block  -> necessory
        -> exception block => in this we handle all code error
        
Plsql cursors => 
		-> this is a pointer which provides control over the result of the sql query 

%type =>
	-> 
    
%rowtype =>
	-> this is attribute which is used to create a variable of record type 
    -> in this record type we create a column with it's data type 

record datatype 
	-> this is a data structure which is used to store different type of data types
    
    
=> Acid properties, normalization
=> how to optimize sql query

*/

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