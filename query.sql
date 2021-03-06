-- drop table if exists departments;
-- drop table if exists dept_emp;
-- drop table if exists dept_manager;
-- drop table if exists employees;
-- drop table if exists salaries;
-- drop table if exists titles;

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(255)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- Data Analysis
-- List the following: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees as e
join salaries as s
on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date asc;

-- List the managers with the following information:
-- department number, department name, the manager's employee number,
-- last name, first name.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name from dept_manager as dm
join departments as d
on dm.dept_no = d.dept_no
join employees as e
on dm.emp_no = e.emp_no;

-- List the department of each employee with the:
-- employee number, last name, first name, and department name.

select e.emp_no, last_name, first_name, d.dept_name from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules"
-- and last names begin with "B."

select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

select * from departments
select * from dept_emp 

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
where d.dept_name in ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

select last_name, count(last_name) from employees
group by last_name
order by count(last_name) desc;
