
-----------------------------------------------------------------------------------------------------------------
----1 List the following details of each employee: employee number, last name, first name, gender, and salary.
---------------------------------------------------------------------------------------------------------------

select e.emp_no as "employee number", last_name as "Last name", first_name as "First Name", gender, s.salary
	from public.employees e
	inner join public.salaries s
	on e.emp_no = s.emp_no
	order by e.emp_no;

-------------------------------------------------
----List employees who were hired in 1986.
-------------------------------------------------

select * 
	from public.employees
	where hire_date>= '1986-01-01' and hire_date <='1986-12-31'

----------------------------------------------------------------------------------------------
-- --List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--------------------------------------------------------------------------------------------------------
-- --current MANAGER 
-- select * 
-- from employees
-- where emp_no in (select  emp_no
-- 	from public.dept_managers
-- 	where to_date = '9999-01-01');

-- -------------------------------------------------------------------------------------------
-- --all managers  history
select d.dept_name, dm.dept_no, dm.emp_no, dm.from_date as "start as manager", 
		dm.to_date as "end_date", 
-- 			case dm.to_date when '9999-01-01' then 'To_DATE'
-- 			ELSE dm.to_date 
-- 			end as "last date as manager",
		e.last_name, e.first_name, e.hire_date
from public.dept_managers dm
inner join public.employees e 
on dm.emp_no = e.emp_no
join public.departments d on 
dm.dept_no = d.dept_no
order by dept_no, from_date, to_date;

----------------------------------------------------------------------------
----4. List the department of each employee with the following information: employee number, last name, 
-------first name, and department name.
---------------------------------------------------------------------------
----current employee with where condition, remove it give all employees

select e.emp_no, e.last_name, e.first_name, d.dept_name
from public. dept_emp de
inner join employees e
on de.emp_no = e.emp_no
join public.departments d 
on de.dept_no = d.dept_no
where de.to_date = '9999-01-01'
order by  d.dept_name, e.emp_no

-------------------------------------------------------------------------------------------------
-------5. List all employees whose first name is "Hercules" and last names begin with "B."
-- ---------------------------------------------------------------------------------------------------

select * 
from public.employees
where first_name = 'Hercules' and  last_name like'B%';


---------------------------------------------------------------------------------------------------
----6 List all employees in the Sales department(d007, Sales), including their employee number, last name, 
-------first name, and department name.
---------------------------------------------------------------------------------------------------
---select * from public.departments
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public.dept_emp de
inner join public.employees e
on de.emp_no = e.emp_no
join departments d
on d.dept_no = de.dept_no
where de.dept_no = 'd007' and de.to_date = '9999-01-01';


---------------------------------------------------------------------------------------------------------
----7- List all employees in the Sales and Development departments, 
----including their employee number, last name, first name, and department name.
-- ---------------------------------------------------------------------------------------------------------
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public.dept_emp de
inner join public.employees e
on de.emp_no = e.emp_no
join departments d
on d.dept_no = de.dept_no
where de.dept_no in ('d005', 'd007') and de.to_date = '9999-01-01';


-------------------------------------------------------------------------------------
----8 - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
------------------------------------------------------------------------------------------------------------------------

select count(last_name) frequency, last_name
from public.employees
group by last_name
order by frequency desc


----------------------------------------------------------------------------------------------------------------------


