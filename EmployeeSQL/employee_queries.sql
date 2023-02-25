--List the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no=s.emp_no
ORDER BY emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name,
	e.last_name,
	e.hire_date
FROM employees e
WHERE DATE_PART('year',hire_date)=1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT m.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager m
LEFT JOIN departments d
ON m.dept_no=d.dept_no
LEFT JOIN employees e
ON m.emp_no=e.emp_no
ORDER BY emp_no;
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp
INNER JOIN employees e
ON dept_emp.emp_no=e.emp_no
INNER JOIN departments d
ON d.dept_no=dept_emp.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE e.first_name='Hercules' AND e.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no,
	e.last_name,
	e.first_name
FROM employees e
LEFT JOIN dept_emp 
ON e.emp_no=dept_emp.emp_no
INNER JOIN departments d
ON d.dept_no=dept_emp.dept_no
WHERE d.dept_name='Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
LEFT JOIN dept_emp 
ON e.emp_no=dept_emp.emp_no
INNER JOIN departments d
ON d.dept_no=dept_emp.dept_no
WHERE d.dept_name in('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;