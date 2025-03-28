#Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:
#1. Write an SQL query to calculate the total payments made by a specific student. You will need to
#join the "Payments" table with the "Students" table based on the student's ID.
select * from courses;
select students.student_id ,count(payments.payment_id) from payments
join students on students.student_id=payments.student_id
group by students.student_id;
 
#2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
#course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
select courses.course_id,courses.course_name,count(enrollments.student_id) as total_count from courses
left join enrollments on courses.course_id=enrollments.course_id
group by courses.course_id;

#3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
#LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
#without enrollments.
select students.student_id,students.first_name,students.last_name from students
left join enrollments on students.student_id =enrollments.student_id
where enrollments.student_id is null;

select student_id,first_name,last_name from students 
where student_id not in(select student_id from enrollments);

#4. Write an SQL query to retrieve the first name, last name of students, and the names of the
#courses they are enrolled in. Use JOIN operations between the "Students" table and the
#"Enrollments" and "Courses" tables.
select students.student_id,students.first_name,students.last_name,courses.course_name from students
join enrollments on students.student_id=enrollments.student_id
join courses on enrollments.course_id=courses.course_id;

#5. Create a query to list the names of teachers and the courses they are assigned to. Join the
#"Teacher" table with the "Courses" table.
select * from students;
select teacher.first_name,teacher.last_name, courses.course_name from teacher
join courses on teacher.teacher_id=courses.teacher_id;

#6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
#"Students" table with the "Enrollments" and "Courses" tables.

select students.student_id,students.first_name,students.last_name,enrollments.enrollment_date, courses.course_name
from students
join enrollments on students.student_id = enrollments.student_id
join courses on enrollments.course_id =courses.course_id
where courses.course_name='history';

#7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
#"Students" table and the "Payments" table and filter for students with NULL payment records.
select students.student_id,students.first_name,students.last_name from students
left join payments on students.student_id=payments.student_id
where payments.student_id is null;
#8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
#between the "Courses" table and the "Enrollments" table and filter for courses with NULL
#enrollment records.
select* from enrollments;
select courses.course_name from courses 
left join enrollments on courses.course_id=enrollments.course_id
where enrollments.course_id is null;

#9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
#table to find students with multiple enrollment records.
SELECT students.student_id, students.first_name, students.last_name, COUNT(enrollments.course_id) AS total_courses
FROM students
 JOIN enrollments ON students.student_id = enrollments.student_id
GROUP BY students.student_id, students.first_name, students.last_name
HAVING COUNT(enrollments.course_id) > 1;

#10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
#table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT teacher.teacher_id, teacher.first_name, teacher.last_name 
FROM teacher
LEFT JOIN courses ON teacher.teacher_id = courses.teacher_id
WHERE courses.course_id IS NULL;
