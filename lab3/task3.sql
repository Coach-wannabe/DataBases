--Find all students who have taken Comp. Sci. course and got an excellent
--grade (i.e., A, or A-) and sort them alphabetically
select * from student;
select * from takes;

--Find all advisors of students who got grades lower than B on any class
select * from advisor;
select * from takes;
select s_id, i_id from advisor
inner join student s on advisor.s_id = s.id
left join takes t on s.id = t.id and grade not in ('A', 'A-', 'B+', 'B');

--Find all courses offered in the morning hours (i.e., courses ending before
--13:00);
select time_slot_id, day from time_slot
where start_hr < 13 and end_hr < 13 and end_min < 60;

