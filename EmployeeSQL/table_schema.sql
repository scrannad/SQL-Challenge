-- Create table schema

--Create titles table
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY(title_id)
);

--Create employees table
DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no), 
 FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
	);

SELECT * FROM employees;

--Create departments table

DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments(
	dept_no VARCHAR(5),
	dept_name VARCHAR(30),
	PRIMARY KEY(dept_no)
);

SELECT * FROM departments;

Create dept_emp table

DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no,dept_no)
	);

SELECT * from dept_emp;

-- Create dept_manager table

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

SELECT * from dept_manager;

--Create salaries table

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

SELECT * from salaries;