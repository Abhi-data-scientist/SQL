use regex;
show tables;
/*
Temporary Table :
		-> A temporary table is a table that exists only for a short time 
        -> it is automatically deleted after the session ends.
        -> Instead of running same subquery again → store result in temp table.
        
When to Use Temp Table
		large intermediate data
		multiple joins
		repeated use
		complex query
		reporting
*/


create table st(
	id int primary key,
	name varchar(30),
    city varchar(30),
    marks int
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    fees INT,
    foreign key (student_id) 
    references st(id) 
    on delete cascade
);

INSERT INTO st VALUES (1,'Amit','Jaipur',85);
INSERT INTO st VALUES (2,'Neha','Delhi',72);
INSERT INTO st VALUES (3,'Rohit','Mumbai',60);
INSERT INTO st VALUES (4,'Pooja','Jaipur',90);
INSERT INTO st VALUES (5,'Karan','Delhi',55);

INSERT INTO courses VALUES (101,1,'Python',5000);
INSERT INTO courses VALUES (102,2,'SQL',4000);
INSERT INTO courses VALUES (103,3,'Java',6000);
INSERT INTO courses VALUES (104,4,'Data Science',8000);
INSERT INTO courses VALUES (105,5,'Web Dev',4500);

select * from st;
select * from courses;

-- Create a temporary table that stores all students with marks > 70.
create temporary table temp_topper as 
select * from st where marks>70;

-- Create a temporary table of students from Jaipur.
create temporary table jaipur_st as
select * from st where city = 'jaipur';
select * from jaipur_st;

-- Create a temporary table that stores only: id, name, marks
create temporary table student as 
select id, name, marks from st;
select * from student;

-- student name, city, course_name, fees
create temporary table details as 
select s.*, c.* from st as s
join courses as c
on s.id=c.student_id;

select * from details;

-- Create temp table of average marks by city.
create temporary table avg_marks as 
select city, avg(marks) from details group by city;
select * from avg_marks;

select * from details where fees < 5000;

-- Create temp table of Delhi students who are enrolled in any course.
create temporary table enrolled as 
select * from details where city = 'delhi';

select * from enrolled;