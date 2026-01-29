-- Create database
CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;

-- Employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    hire_date DATE NOT NULL
);

-- Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT NOT NULL,
    sale_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Insert employees data
INSERT INTO employees 
(emp_id, full_name, department, city, salary, hire_date) 
VALUES
(101, 'Asha Nair', 'Sales', 'Mumbai', 65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales', 'Pune', 72000, '2021-07-05'),
(103, 'Neha Singh', 'Sales', 'Delhi', 68000, '2023-01-15'),
(104, 'Kabir Rao', 'Engineering', 'Bengaluru', 120000, '2020-09-20'),
(105, 'Isha Verma', 'Engineering', 'Hyderabad', 110000, '2021-11-12'),
(106, 'Vikram Das', 'Engineering', 'Bengaluru', 125000, '2019-03-08'),
(107, 'Pooja Shah', 'HR', 'Mumbai', 60000, '2020-02-01'),
(108, 'Arjun Iyer', 'HR', 'Chennai', 58000, '2022-06-18');

-- Insert sales data
INSERT INTO sales 
(sale_id, emp_id, sale_date, amount) 
VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05', 8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09', 5000.00),
(5, 103, '2026-01-04', 7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03', 9000.00),
(9, 103, '2026-02-05', 13000.00),
(10, 101, '2026-02-08', 6000.00),
(11, 102, '2026-02-10', 16000.00),
(12, 103, '2026-02-12', 4000.00);

select * from employees;
select *, sum(salary) over(partition by department),
sum(salary) over(partition by department, city) from employees;

-- over() => ascending order main arrange krke laana
		-- =>  running sum ya cummaltive sum of salary
select *, sum(salary) over(order by salary) from employees;
select *, sum(salary) over(order by city) from employees;
select *, sum(salary) over(partition by department order by salary) from employees;

-- row_number() => to difine a unique values
select *, row_number() over()
from employees;

select *, row_number() over(partition by department)
from employees;

select *, row_number() over(partition by department order by hire_date)
from employees;


-- rank() -> give rank and parameter if there are tie value rank will be same and skip next rank
-- dense_rank() -> it never skip the next rank
-- difference b/w rank , denseranke, row_number
select *, 
rank() over(order by city),
dense_rank() over(order by city)
from employees;

select *, dense_rank() over(partition by department order by salary) from employees;

select *,
row_number() over(order by city),
rank() over(order by city), 
dense_rank() over(order by city)
from employees;
 
-- 1. Add a row number for employees sorted by salary (highest first)
select *, row_number() over(order by salary desc) from employees;

-- 2. Rank employees by salary (ties share rank)
select *, rank() over(order by salary) from employees;

-- 3. Dense rank employees by salary (no gaps in rank numbers)
select *, dense_rank() over(order by salary) from employees;

-- 4. Row number within each department by salary desc
select *, row_number() over(partition by department order by salary desc) from employees;

-- 5. Rank within each department by salary desc
select *, rank() over(partition by department order by salary desc) from employees;

-- lead() => next row ka data current row me lata hai 
-- lag() =>  previous row ka data current row me lata hai 
-- both are use to comparision 
select *, lead(salary,2) over() from employees;
select *, lag(salary,1) over() from employees;
select *, lead(salary,1) over(partition by department) from employees;


-- 6. Show previous and next salary in overall salary order (LAG/LEAD) 
select *, lag(salary,1) over(order by salary), lead(salary,1) over(order by salary) from employees;

-- 7 Running total of sales amounts by date (overall)
select * from sales;
select *, sum(amount) over(order by sale_date) from sales;
-- 8. Running total of sales per employee by date
select *, sum(amount) over(partition by emp_id order by sale_date) from sales;

-- 9. Total sales per row (same total repeated using window SUM)
select *, sum(amount) over() from sales;

-- 10. Average salary per department shown on every employee row
select *, avg(salary) over(partition by department) from employees;

-- 11. Top 2 salaries in each department (use ROW_NUMBER)
--  subquery saved to a variable named as tempdata
-- first the subquery is solved save to the variable 
--  and then we access the column and we filter out the data
select * from 
(select *, row_number() over(partition by department order by salary) as row_value from employees) as tempdata
where row_value<=2; 

-- 12. Salary difference vs department average
select *, avg(salary) over(partition by department) as avg_salary,
salary-avg_salary from employees;
select *, avg(salary) over(partition by department),
salary-avg(salary) over(partition by department) from employees;

-- 13. Percent rank of employees by salary (overall)
-- PERCENT_RANK = (rank - 1) / (total_rows - 1)
select *, round(percent_rank() over(order by salary),2) from employees;

-- 14. Salary distribution into 4 buckets (NTILE)
select *, 





