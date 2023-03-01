CREATE TABLE departments(
dept_no varchar(10) PRIMARY KEY,
dept_name varchar(50) NOT NULL
)

--
CREATE TABLE titles(
title_id varchar(10) PRIMARY KEY,
title varchar(50) NOT NULL
)

---
CREATE TABLE employees(
emp_no INT PRIMARY KEY,
emp_title_id varchar(10),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
birthdate DATE,
first_name varchar(50),
last_name varchar(50),
sex varchar(1),
hire_date DATE
)
---

CREATE TABLE dept_manager(
id SERIAL PRIMARY KEY,
dept_no varchar(10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

----

CREATE TABLE salaries(
id SERIAL PRIMARY KEY,
salary INT,
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)
----

CREATE TABLE dept_emp(
id SERIAL PRIMARY KEY,
emp_no integer,
dept_no varchar(10),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

