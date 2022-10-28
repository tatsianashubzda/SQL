
--1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary 
 from employees join employee_salary
 on employees.id = employee_salary.employee_id 
 join salary  
 on employee_salary.salary_id = salary.id

--2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary 
 from employees join employee_salary
 on employees.id = employee_salary.employee_id 
 join salary  
 on employee_salary.salary_id = salary.id
where monthly_salary<2000;

--3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select salary.monthly_salary, employee_salary.employee_id  from salary left join employee_salary on salary.id=employee_salary.salary_id  where employee_id is null

--4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select salary.monthly_salary, employee_salary.employee_id  from salary left join employee_salary on salary.id=employee_salary.salary_id
where  salary.monthly_salary<2000 and employee_id is null

--5. ����� ���� ���������� ���� �� ��������� ��.
select employees.employee_name, employee_salary.salary_id   from employees left join employee_salary on employees.id=employee_salary.employee_id where salary_id is null 

--������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id

--7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Java d%'


 --8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Python d%'

--9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '% QA %'

 --10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Manual QA%'

 --11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id where roles.role_name like '%Aut%QA%'

--12. ������� ����� � �������� Junior ������������
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior%'

--13.  13. ������� ����� � �������� Middle ������������
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Middle%'

 --14. ������� ����� � �������� Senior ������������
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Senior%'


--15. ������� �������� Java �������������
select role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Java%'

 --16. ������� �������� Python �������������
select role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Python %'

--17. ������� ����� � �������� Junior Python �������������
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior Python%'

 --18. ������� ����� � �������� Middle JS �������������
select employee_name,role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Middle JavaS%'

 --19. ������� ����� � �������� Senior Java �������������
select employee_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Senior Java %'

--20. ������� �������� Junior QA ���������
select role_name, role_name, monthly_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior QA%'

 --21. ������� ������� �������� ���� Junior ������������
select AVG(monthly_salary) as AVG_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%Junior%'

--22. ������� ����� ������� JS �������������
select SUM(monthly_salary) as Sum_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%JavaS%de%'

--23. ������� ����������� �� QA ���������
select Min(monthly_salary) as Min_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%QA%'

--24. ������� ������������ �� QA ���������
select MAX(monthly_salary) as Max_salary
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%QA%'

 --25. ������� ���������� QA ���������
select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%QA%'

-- 26. ������� ���������� Middle ������������.
 select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%Middle%'
 
-- 27. ������� ���������� �������������
  select count(roles.role_name) as count_role
from roles_employee join roles on roles.id=roles_employee.role_id 
 where roles.role_name like '%developer%'
 
-- 28. ������� ���� (�����) �������� �������������.
select SUM(monthly_salary) as Sum_salary 
from roles_employee join employees on employees.id = roles_employee.employee_id 
join roles on roles.id=roles_employee.role_id 
join employee_salary  on employees.id=employee_salary.employee_id
join salary on salary.id=salary_id where roles.role_name like '%devel%'

 --29. ������� �����, ��������� � �� ���� ������������ �� �����������
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id 
order by salary.monthly_salary


-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary

 --31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary<2300
order by salary.monthly_salary

 --32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary 
from roles_employee  join employees on employees.id = roles_employee.employee_id 
left join roles on roles.id=roles_employee.role_id 
left join employee_salary  on employees.id=employee_salary.employee_id
left join salary on salary.id=salary_id where salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary