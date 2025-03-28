
CREATE DATABASE SISDB;

USE SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', '1999-05-22', 'jane.smith@example.com', '0987654321'),
('Emily', 'Johnson', '2001-03-30', 'emily.johnson@example.com', '2345678901'),
('Michael', 'Brown', '1998-11-11', 'michael.brown@example.com', '3456789012'),
('Sarah', 'Davis', '2002-07-07', 'sarah.davis@example.com', '4567890123'),
('David', 'Wilson', '2000-12-12', 'david.wilson@example.com', '5678901234'),
('Laura', 'Garcia', '1997-09-09', 'laura.garcia@example.com', '6789012345'),
('James', 'Martinez', '1996-04-04', 'james.martinez@example.com', '7890123456'),
('Linda', 'Hernandez', '2003-02-02', 'linda.hernandez@example.com', '8901234567'),
('Robert', 'Lopez', '1995-08-08', 'robert.lopez@example.com', '9012345678');

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Teacher (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('Diana', 'Davis', 'diana.davis@example.com');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Chemistry', 3, 3),
('Biology', 3, 4),
('Computer Science', 4, 1),
('History', 3, 2),
('Literature', 3, 3),
('Art', 2, 4),
('Music', 2, 1),
('Philosophy', 3, 2);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-01-11'),
(3, 3, '2023-01-12'),
(4, 4, '2023-01-13'),
(5, 5, '2023-01-14'),
(6, 6, '2023-01-15'),
(7, 7, '2023-01-16'),
(8, 8, '2023-01-17'),
(9, 9, '2023-01-18'),
(10, 10, '2023-01-19');



CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 1500.00, '2023-01-20'),
(2, 1600.00, '2023-01-21'),
(3, 1700.00, '2023-01-22'),
(4, 1800.00, '2023-01-23'),
(5, 1900.00, '2023-01-24'),
(6, 2000.00, '2023-01-25'),
(7, 2100.00, '2023-01-26'),
(8, 2200.00, '2023-01-27'),
(9, 2300.00, '2023-01-28'),
(10, 2400.00, '2023-01-29');
