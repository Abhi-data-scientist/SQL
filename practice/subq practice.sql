use regex; 
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(50),
    enrollment_year INT
);
INSERT INTO Students (student_id, name, major, enrollment_year) VALUES
(101, 'Alice', 'Computer Science', 2023),
(102, 'Bob', 'Mathematics', 2022),
(103, 'Charlie', 'Computer Science', 2023),
(104, 'Diana', 'Physics', 2021),
(105, 'Ethan', 'Mathematics', 2023);
CREATE TABLE Grades (
    student_id INT,
    course_id VARCHAR(20),
    grade INT,
    credits INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Grades (student_id, course_id, grade, credits) VALUES
(101, 'CS50', 95, 4),
(101, 'MATH10', 88, 3),
(102, 'MATH10', 92, 3),
(103, 'CS50', 78, 4),
(104, 'PHYS20', 85, 4),
(105, 'MATH10', 91, 3);
SELECT * FROM Students;
SELECT * FROM Grades;

-- 1. Find the names of students who have a grade higher than the average grade of all students.
select name from students as s
join grades as g
on s.student_id=g.student_id
where g.grade >(select avg(grade) from grades);

-- 2. List the names of students who are enrolled in the same major as 'Alice' (excluding Alice herself).
select name from students as s 
where s.major = (select major from students where name = 'Alice') and name<>'Alice';

-- 3. Find the student_id of students who have NOT taken any courses.
-- (Use NOT IN or NOT EXISTS)
select student_id
from Students
where student_id not in (
    select student_id
    from Grades
);


-- 4. Find the names of students who have the highest grade in each specific course.
select name from students as s
join grades as g
on s.student_id=g.student_id
where grade =  (select max(grade) from grades as gr where g.course_id=gr.course_id);

-- 5. List all majors where at least one student scored above 90.
select distinct major from students as s 
join grades as g
on s.student_id=g.student_id
where grade>90;

-- 6. Find students who have a higher average grade than the overall average grade of the 'Mathematics' major.
select name from students as s
join grades as g
on s.student_id=g.student_id
group by name 
having avg(grade)>(select avg(grade) from grades as gr
						join students as st
                        on st.student_id=gr.student_id
                        where major = 'Mathematics');
                        
-- do aggregate function compare kr skte hai ky having se 

SELECT * FROM Students;
SELECT * FROM Grades;
-- 7. Identify students who have taken all courses that 'Bob' has taken.
select student_id, name from students as s
join grades as g
on s.student_id=g.student_id
where course_id =all (select course_id from grades as gr 
					join students as st
					on st.student_id=gr.student_id
                    where name = 'Bob');

-- 1,Medium,Find the names of students who have a grade higher than the average grade of all students.,5
-- 2,Medium,List the names of students who are enrolled in the same major as 'Alice' (excluding Alice herself).,5
-- 3,Medium,Find the student_id of students who have not taken any courses (using NOT IN or NOT EXISTS).,5
-- 4,Hard,Find the names of students who have the highest grade in each specific course.,10
-- 5,Medium,List all majors where at least one student scored above 90.,5
-- 6,Hard,Find students who have a higher average grade than the overall average grade of the 'Mathematics' major.,10
-- 7,Hard,Identify students who have taken all courses that 'Bob' has taken.,15
-- 8,Medium,Use a subquery in the SELECT clause to show each student's name alongside the total number of credits they've earned.,10
-- 9,Hard,Find the name of the student(s) with the second-highest total credits earned.,15
-- 10,Hard,List students whose grades in all their courses are above the average grade of 'Computer Science' students.,20

