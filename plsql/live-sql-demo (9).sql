declare 
    n int ;
begin 
    n := mytest();
    dbms_output.put_line('value of n ' || n);
end;