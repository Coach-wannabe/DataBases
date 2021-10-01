--Find all courses worth more than 3 credits
select course.title from course where credits > 3;

--Find all classrooms situated either in ‘Watson’ or ‘Packard’ buildings
select classroom.room_number from classroom where building in ('Watson', 'Packard');

--Find all courses offered by the Computer Science department
select course.title from course where dept_name = 'Comp. Sci.';

--Find all courses offered during fall
select course.title from course inner join
section on course.course_id = section.course_id and section.semester = 'Fall';

--Find all students who have more than 45 credits but less than 90
select student.id, student.name from student where tot_cred between '45' and '90';

--Find all students whose names end with vowels
select student.id, student.name from student where (name like '%a') or (name like '%e')
or (name like '%i') or (name like '%o') or (name like '%u') or (name like '%y');

--Find all courses which have course ‘CS-101’ as their prerequisite
select course.title from course inner join
prereq on prereq.course_id = course.course_id and prereq_id = 'CS-101';



