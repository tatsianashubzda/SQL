
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary 
 from employees join employee_salary
 on employees.id = employee_salary.employee_id 
 join salary  
 on employee_salary.salary_id = salary.id

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary 
 from employees join employee_salary
 on employees.id = employee_salary.employee_id 
 join salary  
 on employee_salary.salary_id = salary.id
where monthly_salary<2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employee_salary.employee_id  from salary left join employee_salary on salary.id=employee_salary.salary_id  where employee_id is null

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employee_salary.employee_id  from salary left join employee_salary on salary.id=employee_salary.salary_id
where  salary.monthly_salary<2000 and employee_id is null

--5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, employee_salary.salary_id   from employees left join employee_salary on employees.id=employee_salary.employee_id where salary_id is null 

--Вывести всех работников с названиями их должности.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id

--7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Java d%'


 --8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Python d%'

--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '% QA %'

 --10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Manual QA%'

 --11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Aut%QA%'

--12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior%'

--13.  13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Middle%'

 --14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Senior%'


--15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Java%'

 --16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Python %'

--17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior Python%'

 --18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name,role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Middle JavaS%'

 --19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Senior Java %'

--20. Вывести зарплаты Junior QA инженеров
select role_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior QA%'

 --21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary) as AVG_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior%'

--22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary) as Sum_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%JavaS%de%'

--23. Вывести минимальную ЗП QA инженеров
select Min(monthly_salary) as Min_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%QA%'

--24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) as Max_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%QA%'

 --25. Вывести количество QA инженеров
select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%QA%'

-- 26. Вывести количество Middle специалистов.
 select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%Middle%'
 
-- 27. Вывести количество разработчиков
  select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%developer%'
 
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) as Sum_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%devel%'

 --29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id 
order by salary.monthly_salary


-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary

 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary<2300
order by salary.monthly_salary

 --32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary