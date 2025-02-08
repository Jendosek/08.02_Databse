create database HospitalDB;
go
use HospitalDB;
go

-- Таблиця Відділення (Departments)
create table Departments
(
    ID int primary key identity(1,1),
    Building int not null check (Building between 1 and 5),
    Financing money not null check (Financing >= 0) default 0,
    Name nvarchar(100) not null unique check (Name <> '')
);
go

-- Таблиця Захворювання (Diseases)
create table Diseases
(
    ID int primary key identity(1,1),
    Name nvarchar(100) not null unique check (Name <> ''),
    Severity int not null check (Severity >= 1) default 1
);
go

-- Таблиця Лікарі (Doctors)
create table Doctors
(
    ID int primary key identity(1,1),
    Name nvarchar(max) not null check (Name <> ''),
    Phone char(10) not null,
    Salary money not null check (Salary > 0),
    Surname nvarchar(max) not null check (Surname <> '')
);
go

-- Таблиця Обстеження (Examinations)
create table Examinations
(
    ID int primary key identity(1,1),
    DayOfWeek int not null check (DayOfWeek between 1 and 7),
    EndTime time not null,
    Name nvarchar(100) not null unique check (Name <> ''),
    StartTime time not null check (StartTime between '08:00' and '18:00'),
    constraint CHK_EndTime check (EndTime > StartTime)
);
go

-- Додавання даних до таблиць
insert into Departments (Building, Financing, Name) values
(1, 100000, 'Cardiology'),
(2, 150000, 'Neurology'),
(3, 200000, 'Orthopedics'),
(4, 120000, 'Pediatrics'),
(5, 180000, 'Oncology');
go

insert into Diseases (Name, Severity) values
('Hypertension', 2),
('Diabetes', 3),
('Arthritis', 2),
('Asthma', 1),
('Cancer', 5);
go

insert into Doctors (Name, Phone, Salary, Surname) values
('John', '1234567890', 5000, 'Doe'),
('Jane', '0987654321', 6000, 'Smith'),
('Alice', '1122334455', 5500, 'Johnson'),
('Bob', '2233445566', 7000, 'Williams'),
('Charlie', '3344556677', 6500, 'Brown');
go

insert into Examinations (DayOfWeek, EndTime, Name, StartTime) values
(1, '10:00', 'Routine Checkup', '09:00'),
(2, '11:00', 'Blood Test', '10:00'),
(3, '12:00', 'X-Ray', '11:00'),
(4, '13:00', 'MRI Scan', '12:00'),
(5, '14:00', 'Ultrasound', '13:00');
go

-- Вибірка даних з таблиць
select * from Departments;
go
select * from Diseases;
go
select * from Doctors;
go
select * from Examinations;
go

-- Видалення таблиць та бази даних
drop table Examinations;
drop table Doctors;
drop table Diseases;
drop table Departments;
use master;
drop database HospitalDB;