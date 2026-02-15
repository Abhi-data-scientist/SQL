-- create a plsql program to find a number is armstrong or not 
-- DECLARE
--     N    INT := 153;
--     rem int;
--     TOTAL INT := 0;
--     A     INT;
-- BEGIN
--     A := N;
--     WHILE A > 0 LOOP
--         rem := MOD(a,10);
--         TOTAL := TOTAL + POWER(REM, 3);
--         A := TRUNC(A / 10);
--     END LOOP;

--     IF TOTAL = N THEN
--         DBMS_OUTPUT.PUT_LINE('Armstrong');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('NOT Armstrong');
--     END IF;

-- END;

-- prime 
-- DECLARE
--     NUM NUMBER := 10;
--     I   NUMBER;
--     C NUMBER := 0;
-- BEGIN
--     FOR I IN 2..NUM - 1 LOOP
--         IF MOD(NUM, I) = 0 THEN
--             C := C + 1;
--         END IF;
--     END LOOP;

--     IF
--         C = 0
--         AND NUM > 1
--     THEN
--         DBMS_OUTPUT.PUT_LINE('Prime number');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Not prime number');
--     END IF;

-- END;

-- lcm
-- DECLARE
--     A   INT := 4;
--     B   INT := 6;
--     C   INT := 2;
--     LCM INT := 1;
-- BEGIN 
--     while a>1 OR b>1 loop 
--         if mod(a,c)=0 or mod(b,c)=0 then 
--             if mod(a,c)=0 then 
--                 a := a/c;
--             end if ;
--             if mod(b,c)=0 then 
--                 b := b/c;
--             end if ;
--             lcm := lcm*c;
            
--         else
--             c := c+1;
        
--         end if;
--     END LOOP;
--         DBMS_OUTPUT.PUT_LINE ( LCM );
--     END



-- create table emp_cp as
-- select employee_id, first_name from hr.EMPLOYEES where employee_id between 100 and 104;

-- select * from emp_cp;

-- begin 
--     dbms_output.put_line('we are inside the begin');
--     -- update emp_cp set first_name='regex';
--     -- DELETE from emp_cp where employee_id<103;
--     DBMS_OUTPUT.put_line(sql%rowcount);
-- end;

declare 
    CURSOR emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table 

begin 
    open emp_cur; -- opend cursor
    -- fetch emp_cur into emp_record;

    if emp_cur%isopen then --  is cursor open => otherwise false
        dbms_output.put_line('cursor is open');
    end if ;

    if emp_cur%found then 
        dbms_output.put_line('cursor got the data');
    else 
        dbms_output.put_line('cursor dont found the data');

    end if ;
    close emp_cur;  --  close the cursor here

end;