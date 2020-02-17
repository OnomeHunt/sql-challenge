-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select public."Employee".emp_no  "employee number"
	,last_name "last name"
	,first_name "first name"
	,gender
	,salary
from public."Employee"
	join public."Salaries" on public."Employee".emp_no = public."Salaries".emp_no;

-- 2. List employees who were hired in 1986.
select last_name
	,first_name
	,hire_date
from public."Employee"
where hire_date > '12/31/1985'
	and hire_date < '01/01/1987';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

select a.dept_no "Department Number"
		,a.emp_no "Department Name"
		,b.dep_name "Mgr Number"
		,c.last_name "Mgr Last Name"
		,c.first_name "Mgr First Name"
		,a.from_date "Mgr Start Date"
		,a.to_date "Mgr End Date"
from public."Dept_Manager" a
	left join public."Departments" b on a.dept_no = b.dept_no
	left join public."Employee" c on a.emp_no = c.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no "employee number"
		,last_name "last name"
		,first_name "first name"
		,dep_name "department name"
from public."Employee" emp 
left join public."Dept_Emp" dept_emp on  emp.emp_no = dept_emp.emp_no
left join public."Departments" dept on dept_emp.dept_no = dept.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select emp_no,birth_date,first_name,last_name,gender,hire_date
from public."Employee"
where first_name = 'Hercules'
	and last_name like 'B%';
	
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no "employee number"
		,emp.last_name "last name"
		,emp.first_name "first name"
		,dept.dep_name "department name"
from public."Employee" emp
	left join public."Dept_Emp" dept_emp on  emp.emp_no = dept_emp.emp_no
	left join public."Departments" dept on dept_emp.dept_no = dept.dept_no
where dept.dep_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no "employee number"
		,emp.last_name "last name"
		,emp.first_name "first name"
		,dept.dep_name "department name"
from public."Employee" emp
	left join public."Dept_Emp" dept_emp on  emp.emp_no = dept_emp.emp_no
	left join public."Departments" dept on dept_emp.dept_no = dept.dept_no
where dept.dep_name in ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name "employee last name"
		, count(last_name) "count of employee last name"
from public."Employee"
group by last_name
order by last_name desc;

