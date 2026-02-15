declare 
    CURSOR emp_cur is select * from emp_cp; -- cursor created explicit
    emp_record emp_cp%rowtype; -- record variable as same as of the table 

begin 
    -- open emp_cur; -- opend cursor

    -- fetch emp_cur into emp_record;
    -- while emp_cur%found loop
    --     dbms_output.put_line(emp_record.employee_id);
    --     fetch emp_cur into emp_record;
    -- end loop;

    -- close emp_cur;  --  close the cursor here

    for line in emp_cur LOOP
        dbms_output.put_line(line.employee_id);
    end loop;

end;