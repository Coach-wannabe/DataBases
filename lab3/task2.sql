--For each department, find the average salary of instructors in that
--department and list them in ascending order. Assume that every
--department has at least one instructor
select dept_name, avg(salary) from instructor group by dept_name order by avg(salary) asc;

--Find the building where the biggest number of courses takes place
select * from section;
--Not finished

--Find the department with the lowest number of courses offered
--Not finished

--Find the ID and name of each student who has taken more than 3 courses
--from the Computer Science department
select * from student;
select * from course;
select * from takes;
--Not finished

--Find all instructors who work either in Biology, Philosophy, or Music
--departments
select instructor.name from instructor where instructor.dept_name in ('Biology', 'Philosophy', 'Music');

--Find all instructors who taught in the 2018 year but not in the 2017 year
select * from instructor;
select * from teaches;
select distinct instructor.name from instructor
inner join teaches t on instructor.id = t.id and t.year = '2018';







