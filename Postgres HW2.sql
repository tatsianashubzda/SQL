--Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.
CREATE TABLE employees(
    id serial primary key,
    employee_name varchar(50) not null
    ); 
   
insert into employees (employee_name) 
values('Tanya'), ('Tsveti'),('Grisha'),('Nikita'),('Sasha'), ('Zhenya'),('Vital'), ('Andrey'), ('Dima'), ('Katya'),
('Tanya1'), ('Tsveti1'),('Grisha1'),('Nikita1'),('Sasha1'), ('Zhenya1'),('Vital1'), ('Andrey1'), ('Dima1'), ('Katya1'),
('Tanya2'), ('Tsveti2'),('Grisha2'),('Nikita2'),('Sasha2'), ('Zhenya2'),('Vital2'),('Andrey2'), ('Dima2'), ('Katya2'),
('Tanya3'), ('Tsveti3'),('Grisha3'),('Nikita3'),('Sasha3'), ('Zhenya3'),('Vital3'), ('Andrey3'), ('Dima3'), ('Katya3'),
('Tanya11'), ('Tsveti21'),('Grisha21'),('Nikita13'),('Sasha33'), ('Zhenya31'),('Vital31'), ('Andrey21'), ('Dima13'), ('Katya14'),
('Tanya25'), ('Tsveti24'),('Grisha25'),('Nikita24'),('Sasha25'), ('Zhenya24'),('Vital25'), ('Andrey24'), ('Dima25'), ('Katya25'),
('Tanya37'), ('Tsveti36'),('Grisha37'),('Nikita36'),('Sasha37'), ('Zhenya37'),('Vital36'), ('Andrey37'), ('Dima36'), ('Katya37');

select * from employees 

--Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500

CREATE TABLE salary(
    id serial primary key,
    monthly_salary int not null
    ); 
   insert into salary (monthly_salary) values (1000),(1100), (1200),(1300),(1400), (1500),(1600),(1700), (1800),
   (1900), (2000), (2100), (2200), (2300), (2400), (2500);
  
  select * from salary
  
  --Создать таблицу employee_salary
--id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null,
foreign key (employee_id) references employees(id),
foreign key (salary_id) references salary(id)
);

select * from employee_salary

insert into employee_salary (employee_id, salary_id) 
values (2,4), (3,7), (1,16), (5, 9), (40, 13), (23, 4), (11, 2), (15, 13), (26, 4), (16, 1),
(70, 5), (12, 12), (14, 5), (45,12), (32, 5), (9, 12), (10, 3), (31, 12), (34, 11), (21, 9),
(69,4), (68,7), (67, 16), (65, 9), (64, 13), (63, 4), (62, 2), (61, 13), (59, 4), (58, 1),
(57, 5), (50, 12), (49, 5), (48,12), (47, 5), (46, 12), (43, 3), (42, 12), (33, 11), (35, 9);

 --Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)

create table roles (
id serial primary key,
role_name varchar not null unique);



select * from roles

insert into roles (role_name) 
values ('Junior Python developer'), ('Middle Python developer'),
('Senior Python developer'), ('Junior Java developer'),
('Middle Java developer'), ('Senior Java developer'),
('Junior JavaScript developer'), ('Middle JavaScript developer'),
('Senior JavaScript developer'), ('Junior Manual QA engineer'),
('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
('Project Manager'), ('Designer'), ('HR'), ('CEO'),
('Sales manager'), ('Junior Automation QA engineer'),
('Middle Automation QA engineer'), ('Senior Automation QA engineer');

select * from roles 

--Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)




