# Tasks 2: Select, Where, Between, AND, LIKE:
# 1. Write an SQL query to insert a new student into the "Students" table with the following details:
# a. First Name: John
# b. Last Name: Doe
# c. Date of Birth: 1995-08-15
# d. Email: john.doe@example.com
# e. Phone Number: 1234567890
insert into students(first_name, last_name, date_of_birth, email, phone_number)
values("John","Doe",'1995-08-15',"john.doe@example.com",1234567890);

# 2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
# insert a record into the "Enrollments" table with the enrollment date.
insert into enrollments(student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-03-27');

# 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
# modify their email address.
update teacher
set email="abc@gmail.com"
where teacher_id=1;

# 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
# an enrollment record based on the student and course.
delete from enrollments where student_id=2 and course_id=2;

# 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
#teacher from the respective tables.

update courses set teacher_id=2
where course_id=1;

#6. Delete a specific student from the "Students" table and remove all their enrollment records
#from the "Enrollments" table. Be sure to maintain referential integrity.
ALTER TABLE enrollments DROP FOREIGN KEY enrollments_ibfk_2;
ALTER TABLE enrollments 
ADD CONSTRAINT fk1_course 
FOREIGN KEY (course_id) REFERENCES courses(course_id) 
ON DELETE CASCADE;

DELETE FROM Enrollments
WHERE student_id = 1;
DELETE FROM courses 
WHERE course_id IN (
    SELECT course_id FROM enrollments WHERE student_id = 1
);
set sql_safe_updates=0;
DELETE FROM students
WHERE student_id = 1;
select * from enrollments;

#7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
#payment record and modify the payment amount.
update payments
set amount=10
where payment_id=1;