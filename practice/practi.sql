create database practice;
use practice;
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO Departments VALUES (1, 'Sales'), (2, 'Engineering'), (3, 'HR'), (4, 'Marketing');

INSERT INTO Employees VALUES 
(101, 'Alice', 1, 90000, NULL, '2020-01-15'),
(102, 'Bob', 1, 70000, 101, '2021-03-20'),
(103, 'Charlie', 2, 120000, NULL, '2019-07-10'),
(104, 'David', 2, 110000, 103, '2022-01-05'),
(105, 'Eve', 2, 105000, 103, '2021-11-12'),
(106, 'Frank', 3, 60000, NULL, '2023-02-01'),
(107, 'Grace', 4, 85000, NULL, '2020-10-25');

INSERT INTO Sales VALUES 
(1, 101, 5000, '2023-01-10'), (2, 101, 3000, '2023-02-15'),
(3, 102, 4000, '2023-01-20'), (4, 103, 1000, '2023-03-05'),
(5, 105, 8000, '2023-01-25'), (6, 101, 2000, '2023-04-10');

show tables;
select * from departments;
select * from employees;
select * from sales;

-- 1. List each department name and the number of employees in it.
select dept_name, count(e.emp_id)
from departments as d
left join employees as e
on e.dept_id=d.dept_id
group by dept_name;

-- 2. Find the total salary spent per department.
select dept_name, sum(e.salary)
from departments as d
left join employees as e
on e.dept_id=d.dept_id
group by dept_name
order by sum(e.salary) desc;

-- 3. Which department has the highest average salary?
select dept_name, avg(e.salary)
from departments as d
left join employees as e
on e.dept_id=d.dept_id
group by dept_name 
order by avg(e.salary) desc limit 1;

-- 4. List employees who haven't made any sales. (Use LEFT JOIN).
select e.emp_name from employees  as e
left join sales as s
on e.emp_id = s.emp_id
where sale_id is null;

select * from sales;
-- 5. Total sales per employee name
select e.emp_name, sum(sale_amount) from employees as e 
left join sales as s
on e.emp_id = s.emp_id
group by e.emp_name;

select * from employees;
-- 6. Show departments with more than 2 employees.
select dept_name from departments as d 
join employees as e 
on d.dept_id=e.dept_id
group by dept_name
having count(emp_id)>2;

-- 7. Classify employees into 'High Paid' (>$100k) or 'Standard Paid' (<= $100k).
select emp_name, case 
					when salary > 100000 then 'High Paid'
                    else  'standard paid'
                    end as pay_category 
from employees;

-- 8. Count how many 'High Paid' vs 'Standard Paid' employees exist. (CASE + GROUP BY).
select case 
	when salary > 100000 then 'high paid'
    else 'standard paid'
    end as pay_category, count(*)
from employees
group by pay_category;

-- 9. Show departments where the minimum salary is above $70,000.
select dept_name from departments as d
join employees as e 
on d.dept_id=e.dept_id
group by dept_name 
having min(salary)>70000;

-- 10. Find employees who earn more than the average salary of the whole company.
select emp_name from employees
where salary>(select avg(salary) from employees);

-- 11. Find employees who earn more than the average salary within their own department.
select emp_name, dept_name, salary from employees as emp
where salary > (select avg(salary) from employees as e where emp.dept_id = e.dept_id);

-- 12. Find the department name that has the employee with the maximum salary.
select dept_name, emp_id, salary from employees 
join departments
on employees.dept_id = departments.dept_id
where salary = (select max(salary) from employees);

select * from departments;
select * from employees;
-- 14. Select employees who were hired after the earliest hire date in the Sales department.
SELECT e.emp_name
FROM employees e
WHERE e.hire_date > (
    SELECT MIN(e2.hire_date)
    FROM employees e2
    JOIN departments d
    ON e2.dept_id = d.dept_id
    WHERE d.dept_name = 'Sales'
);

-- 15. Rank employees by salary within their department (highest salary = Rank 1).
select emp_name, salary, dept_id, rank() over(partition by dept_id order by salary desc) from employees;

