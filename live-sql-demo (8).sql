-- create or replace function mytest return int is 
-- begin 
--     dbms_output.PUT_LINE('called function');
--     return 1;
-- end;

create or replace function mytest return int is 
begin 
    dbms_output.PUT_LINE('called function');
    return 1;
end;