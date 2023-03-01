--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, last_name ,first_name, sex, s.salary
	FROM public.employees e
	INNER JOIN public.salaries s
	ON e.emp_no = s.emp_no
	ORDER BY e.emp_no;
	
--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name , hire_date
	FROM public.employees e
	WHERE EXTRACT(YEAR FROM hire_date) = 1986;
	
--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT m.dept_no, d.dept_name,m.emp_no,e.last_name ,e.first_name
	FROM public.dept_manager m
	INNER JOIN public.departments d
	on m.dept_no = d.dept_no
	INNER JOIN public.employees e
	on e.emp_no = m.emp_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT de.emp_no, e.last_name ,e.first_name, d.dept_name
	FROM public.dept_emp de
	INNER JOIN public.departments d
	on de.dept_no = d.dept_no
	INNER JOIN public.employees e
	on e.emp_no = de.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name ,sex
	FROM public.employees e
	WHERE first_name = 'Hercules' AND last_name like 'B%'
	
--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT de.emp_no, e.last_name ,e.first_name
	FROM public.dept_emp de
	INNER JOIN public.departments d
	on de.dept_no = d.dept_no
	INNER JOIN public.employees e
	on e.emp_no = de.emp_no
    WHERE d.dept_name = 'Sales';
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT de.emp_no, e.last_name ,e.first_name,d.dept_name
	FROM public.dept_emp de
	INNER JOIN public.departments d
	on de.dept_no = d.dept_no
	INNER JOIN public.employees e
	on e.emp_no = de.emp_no
    WHERE d.dept_name IN ('Sales','Development')
	ORDER BY de.emp_no;
	
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(*)
	FROM public.employees
	GROUP BY last_name 
	ORDER BY last_name DESC;
