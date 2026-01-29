/*
Recursive CTE ->
		
*/

-- union -> combine two or more tables 
		-- -> also give duplicate for one time 
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

-- union all -> it gives all values chahe duplicate ho ya nhi 
-- 				-> number of column same hona chahiye 
select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all 
select actor_id, first_name from sakila.actor where actor_id between 3 and 5;

select actor_id, first_name from sakila.actor where actor_id between 1 and 4
union all 
select first_name, actor_id from sakila.actor where actor_id between 3 and 5;

with recursive cte as (
select 10 as num			-- assigning values to this num column (startin point)
union all 
select num+1 from cte		-- cte call karna 
where num<15				-- terminating condition (stop point)
)
select * from cte;

-- employee hierarchy
use regex;
CREATE TABLE employees (
    employeeid INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);


INSERT INTO employees (employeeid, name, managerid) VALUES
(1, 'Alice', NULL),      -- CEO
(2, 'Bob', 1),           -- Reports to Alice
(3, 'Charlie', 2),       -- Reports to Bob
(4, 'Diana', 2),         -- Reports to Bob
(5, 'Eve', 3);           -- Reports to Charlie

select * from employees;

-- employee hierarchy
with recursive cte as (
select employeeid, name, name as hierarchy_path from employees where managerid is null
union all 
select e.employeeid, e.name, concat(e.name, '->', cte.hierarchy_path) from employees as e
join cte where e.managerid=cte.employeeid and e.employeeid<5
)
select * from cte;

-- employee level
with recursive cte as (
select employeeid, name, 1 as level from employees where managerid is null
union all 
select e.employeeid, e.name, level+1 from employees as e
join cte where e.managerid=cte.employeeid and e.employeeid<5
)
select * from cte;

/*
Assignment :-	
		-> 
*/





