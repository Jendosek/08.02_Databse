create database UniversityDB;
go
use UniversityDB;
go

create table Groups
(
    Id int primary key identity(1,1),
    Name nvarchar(10) not null unique check (Name <> ''),
    Rating int not null check (Rating between 0 and 5),
    Year int not null check (Year between 1 and 5)
);
go

create table Departments
(
    Id int primary key identity(1,1),
    Financing money not null check (Financing >= 0) default 0,
    Name nvarchar(100) not null unique check (Name <> '')
);
go

create table Faculties
(
    Id int primary key identity(1,1),
    Name nvarchar(100) not null unique check (Name <> '')
);
go

create table Teachers
(
    Id int primary key identity(1,1),
    EmploymentDate date not null check (EmploymentDate >= '1990-01-01'),
    Name nvarchar(max) not null check (Name <> ''),
    Premium money not null check (Premium >= 0) default 0,
    Salary money not null check (Salary > 0),
    Surname nvarchar(max) not null check (Surname <> '')
);
go

insert into Groups (Name, Rating, Year) values
('Group A', 4, 2),
('Group B', 3, 1),
('Group C', 5, 3),
('Group D', 2, 4),
('Group E', 1, 5);
go

insert into Departments (Financing, Name) values
(100000, 'Computer Science'),
(150000, 'Mathematics'),
(200000, 'Physics'),
(120000, 'Chemistry'),
(180000, 'Biology');
go

insert into Faculties (Name) values
('Faculty of Engineering'),
('Faculty of Science'),
('Faculty of Arts'),
('Faculty of Medicine'),
('Faculty of Law');
go

insert into Teachers (EmploymentDate, Name, Premium, Salary, Surname) values
('1995-05-15', 'John', 500, 3000, 'Doe'),
('2000-08-20', 'Jane', 300, 2500, 'Smith'),
('1992-03-10', 'Alice', 700, 4000, 'Johnson'),
('1998-11-25', 'Bob', 400, 3500, 'Williams'),
('2005-07-30', 'Charlie', 600, 3200, 'Brown');
go

select * from Groups;
go
select * from Departments;
go
select * from Faculties;
go
select * from Teachers;
go

drop table Teachers;
drop table Faculties;
drop table Departments;
drop table Groups;
use master;
drop database UniversityDB;