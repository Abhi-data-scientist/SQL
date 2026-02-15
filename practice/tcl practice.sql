use regex1;
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    marks INT
);

INSERT INTO student VALUES (1,'Amit',20,'Jaipur',80);
INSERT INTO student VALUES (2,'Neha',21,'Delhi',75);
INSERT INTO student VALUES (3,'Rohit',22,'Mumbai',60);
INSERT INTO student VALUES (4,'Pooja',19,'Jaipur',90);
INSERT INTO student VALUES (5,'Karan',23,'Delhi',55);
commit;
select * from student;

select @@autocommit;
set @@autocommit=0;
set @@autocommit=1;

INSERT INTO student VALUES (8,'Avni',20,'Jaipur',80);
rollback;

delete from student
where id = 8;
commit;

-- Insert new student and save permanently.
INSERT INTO student VALUES (9,'ssdf',20,'Jaipur',80);
commit;

-- Update marks and undo.
start transaction;
update student 
set marks = 99;
rollback;

-- Update 2 students, rollback only seconds
start transaction;
update student
set marks = 90
where id =1;
savepoint s1;

update student
set marks = 90
where id =2;
savepoint s2;

rollback to s1;

create table st_ctas
as select * from student;




