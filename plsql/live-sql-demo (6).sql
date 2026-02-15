-- DECLARE 
--  x int := 10;
--  y int := 0;

-- begin 
--     FOURTH_PROCEDURE(x,y);
--     dbms_output.PUT_LINE('return of but in y variable ' || y);
-- end;

DECLARE 
 x int := 10;

begin 
    fifth_PROCEDURE(x);
    dbms_output.PUT_LINE('return of but in y variable ' || x);
end;