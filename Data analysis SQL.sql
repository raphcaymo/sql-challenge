/* DATA ANALYSIS PART */

/* FOR QUESTION NUMBER 1
	List the employee number, last name, first name, sex, and salary of each employee.
	*/
SELECT e.emp_no as "Employee Number", 
	e.last_name as "Last Name", 
	e.first_name as "First Name", 
	e.sex as "Sex",
	s.salary as "Salary"
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no)
WHERE s.emp_no = e.emp_no
;

/* FOR QUESTION NUMBER 2
	List the first name, last name, and hire date for the employees who were hired in 1986.
	*/
SELECT 	first_name as "First Name", 
		last_name as "Last Name", 
		hire_date as "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986'
;

/* FOR QUESTION NUMBER 3
	List the manager of each department along with their department number, 
	department name, employee number, last name, and first name.
	*/
SELECT 	dm.dept_no AS "Department Number",
		dept_name AS "Department Name",
		dm.emp_no AS "Employee Number",
		e.last_name AS "Last Name", 
		e.first_name AS "First Name"
FROM dept_manager dm
JOIN employees e
ON (dm.emp_no = e.emp_no)
JOIN departments d
ON (dm.dept_no = d.dept_no)
WHERE (dm.emp_no = e.emp_no)
;
/* FOR QUESTION NUMBER 4 
	List the department number for each employee along with that 
	employee’s employee number, last name, first name, and department name.
	*/
SELECT 	de.dept_no AS "Department Number",
		de.emp_no AS "Employee Number",
		last_name AS "Last Name", 
		first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM dept_emp de
JOIN employees e
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE (de.emp_no = e.emp_no)
;

/* FOR QUESTION NUMBER 5
	List first name, last name, and sex of each employee 
	whose first name is Hercules and whose last name begins with the letter B.
	*/
SELECT 	first_name as "First Name", 
		last_name as "Last Name", 
		sex as "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;


/* FOR QUESTION NUMBER 6
	List each employee in the Sales department, 
	including their employee number, last name, and first name.
	*/
SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name", 
		e.first_name AS "First Name"
FROM dept_emp de
JOIN employees e
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales')
;

/* FOR QUESTION NUMBER 7
	List each employee in the Sales and Development departments, 
	including their employee number, last name, first name, and department name.
	*/

SELECT 	e.emp_no AS "Employee Number",
		e.last_name AS "Last Name", 
		e.first_name AS "First Name",
		d.dept_name AS "Department Name"
FROM dept_emp de
JOIN employees e
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development')
;


/*FOR QUESTION NUMBER 8
	List the frequency counts, in descending order, 
	of all the employee last names (that is, how many employees share each last name).
	*/
SELECT last_name as "Last Name",
		COUNT(last_name) as "Last Name Count"
FROM employees
GROUP BY "Last Name"
ORDER BY "Last Name Count" DESC
