-- EmmployeeSQL Database
-- Gary Schulke

-- Create tables and import data
-- Drop table if exists
DROP TABLE IF EXISTS departments CASCADE ;
-- Create new table  
-- departments.csv
-- comma separated, strings, dates enclosed in ""
-- "dept_no","dept_name"
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
  PRIMARY KEY (dept_no)
);

DROP TABLE IF EXISTS employees CASCADE;
-- employees.csv
-- comma separated, strings, dates enclosed in ""
-- emp_no,"birth_date","first_name","last_name","gender","hire_date"
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

DROP TABLE IF EXISTS dept_emp;
-- dept_emp.csv
-- comma separated, strings, dates enclosed in ""
-- emp_no,"dept_no","from_date","to_date"
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

DROP TABLE IF EXISTS dept_manager;
-- dept_manager.csv
-- comma separated, strings, dates enclosed in ""
-- "dept_no",emp_no,"from_date","to_date"
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

DROP TABLE IF EXISTS salaries;
-- salaries.csv
-- comma separated, strings, dates NOT enclosed in ""
-- emp_no,salary,from_date,to_date
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);	

DROP TABLE IF EXISTS titles;
-- titles.csv
-- comma separated, strings, dates enclosed in ""
-- emp_no,"title","from_date","to_date"
CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);