	-- Employee DB queries
    --  Prepared by Farshad Esnaashari , due by 2 NOV 2019

    -- 1. Employee details, including salary 
	Select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
	from employees as e
	left join salaries as s on (e.emp_no = s.emp_no)
	order by emp_no;

	-- 2. Employees who were hired in 1986
	Select emp_no, last_name, first_name, hire_date
	from employees
	where hire_date between '1986-01-01' and '1986-12-31';

	-- 3. Department Manager details
	select dm.emp_no, e.last_name, e.first_name, d.dept_name, dm.from_date, dm.to_date
	from dept_manager as dm
	inner join employees as e on (dm.emp_no = e.emp_no)
	inner join departments as d on (dm.dept_no = d.dept_no);

	-- 4. Department details of each employees
	select e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees as e
	inner join dept_emp as de on (e.emp_no = de.emp_no)
	inner join departments as d on (de.dept_no = d.dept_no);

	-- 5. Employees with first name "Hercules" and last name begin with "B"
	select last_name, first_name
	from employees
	where first_name ='Hercules' and last_name like 'B%';
	
	-- 6. Employees in the Sales department
	select e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees as e
	inner join dept_emp as de on (e.emp_no = de.emp_no)
	inner join departments as d on (de.dept_no = d.dept_no)
	where d.dept_name = 'Sales';
	
-- 7. Employees in the Sales and Development departments
	select e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees as e
	inner join dept_emp as de on (e.emp_no = de.emp_no)
	inner join departments as d on (de.dept_no = d.dept_no)
	where d.dept_name in  ('Sales', 'Development');

-- 8. Count of how many employees share the same last name in descening order
	select last_name, count(last_name) as frequency
	from employees 
	group by last_name
	order by frequency desc;