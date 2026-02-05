use regex1;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    age INT,
    city VARCHAR(30)
);
INSERT INTO employees VALUES
(1, 'Amit',    'IT',      60000, 25, 'Delhi'),
(2, 'Neha',    'HR',      45000, 28, 'Mumbai'),
(3, 'Ravi',    'IT',      80000, 32, 'Bangalore'),
(4, 'Pooja',   'Finance', 70000, 30, 'Delhi'),
(5, 'Rahul',   'HR',      50000, 26, 'Pune'),
(6, 'Kiran',   'IT',      90000, 35, 'Hyderabad'),
(7, 'Sneha',   'Finance', 65000, 29, 'Mumbai'),
(8, 'Arjun',   'IT',      55000, 24, 'Chennai'),
(9, 'Manoj',   'Sales',   40000, 27, 'Delhi'),
(10,'Anita',   'Sales',   48000, 31, 'Pune'),
(11,'Deepak',  'Finance', 75000, 34, 'Bangalore'),
(12,'Sonal',   'HR',      52000, 29, 'Delhi'),
(13,'Vikas',   'Sales',   60000, 36, 'Mumbai'),
(14,'Nidhi',   'IT',      85000, 33, 'Pune'),
(15,'Rohit',   'Finance', 68000, 28, 'Chennai');

select * from employees;
-- Employees working in same department as 'Amit'
select * from employees where department = (select department from employees where emp_name = 'Amit');

-- Find employees who earn more than 70% of employees in their department
 select * from employees as e 
 where
 (select count(*) from employees where e.department = department and e.salary>salary)>=
 (select count(*)*0.7 from employees where e.department = department);

-- Find employees who earn maximum salary in their city
select * from employees as e 
where salary >=all(select salary from employees salary where e.city =  city);

-- Find departments where minimum salary > overall company average salary.
select department from employees
group by department
having 
min(salary)>all
(select avg(salary) from employees);

-- Find employees whose salary rank is TOP 2 in their department
select * from (select *, dense_rank() over(partition by department order by salary desc) as rnk from employees) t
where rnk <=  2;

select * from employees e1
where 2>=(select count(*) from employees where e1.department = department and e1.salary>salary);
