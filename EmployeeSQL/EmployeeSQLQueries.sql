-- Query 1, employee information + salary
SELECT empl.emp_no AS "Employee ID", 
		empl.last_name AS "Last Name", 
		empl.first_name AS "First Name", 
		empl.gender AS "Gender", 
		sal.salary AS "Salary"
FROM employees AS empl
JOIN salaries AS sal
ON empl.emp_no = sal.emp_no;


-- Query 2, all employees hired in 1984
-- There are no employees hired in 1984
-- Other dates (1999. 1986) return results.
SELECT last_name AS "Last Name", 
		first_name AS "Last Name", 
		(EXTRACT (YEAR FROM hire_date)) AS "Hire Date"
FROM employees  AS empl
WHERE CAST (EXTRACT (YEAR FROM empl.hire_date) AS INTEGER)  = 1984;


-- QUERY 3  List manager information
-- Ordered by department number to make the resuls less random.
SELECT dm.dept_no AS "Dept Number", 
		deps.dept_name AS "Department Name",
		dm.emp_no AS "Employee Number", 
		empl.last_name AS "Last Name",
		empl.first_name AS "First Name",
		dm.from_date AS "From Date",
		dm.to_date AS "To Date"
FROM dept_manager AS dm
		JOIN departments AS deps
		ON dm.dept_no = deps.dept_no
			JOIN employees AS empl
			ON empl.emp_no = dm.emp_no
ORDER BY dm.dept_no;

-- Query 4 List department name with employee information
SELECT empl.emp_no AS "Employee ID", 
		empl.last_name AS "Last Name", 
		empl.first_name AS "First Name",
		deps.dept_name AS "Department"
FROM employees AS empl
	JOIN dept_emp AS de
	ON empl.emp_no = de.emp_no
		JOIN departments AS deps
		ON deps.dept_no = de.dept_no;

-- Query 5 List employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees AS empl
WHERE empl.first_name = 'Hercules' 
	AND empl.last_name LIKE 'B%';
	
-- QUERY 6 List employees in the Sales department,
SELECT empl.emp_no AS "Employee ID", 
		empl.last_name AS "Last Name", 
		empl.first_name AS "First Name",
		deps.dept_name AS "Department"
FROM employees AS empl
	JOIN dept_emp AS de
	ON empl.emp_no = de.emp_no
		JOIN departments AS deps
		ON deps.dept_no = de.dept_no
WHERE deps.dept_name = 'Sales';

-- Query 7 
SELECT empl.emp_no AS "Employee ID", 
		empl.last_name AS "Last Name", 
		empl.first_name AS "First Name",
		deps.dept_name AS "Department"
FROM employees AS empl
	JOIN dept_emp AS de
	ON empl.emp_no = de.emp_no
		JOIN departments AS deps
		ON deps.dept_no = de.dept_no
WHERE deps.dept_name = 'Sales'
	OR deps.dept_name = 'Development';

-- Query 8 Get counts of each last name
SELECT empl.last_name AS "Last Name",
	COUNT(empl.last_name) AS "Count"
FROM employees as empl	
GROUP BY empl.last_name
ORDER BY "Count" DESC;
