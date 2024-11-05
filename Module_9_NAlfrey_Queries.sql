-- Data Analysis Queries
-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no
,e.last_name
,e.first_name
    , e.sex
    , s.salary
FROM public."Employees" as e
INNER JOIN public."Salaries" as s ON
    e.emp_no = s.emp_no;

-- 2. List the first namr, last name, and hire date for employees hired in 1986
SELECT first_name
    , last_name
    , hire_date
FROM public."Employees"
WHERE date_part('year', hire_date) = 1986;

-- 3. List the manager of each dept, corresponding dept number, dept name, employee number, last name, and first name.
SELECT public."Dept_Manager".dept_no
    , public."Depts".dept_name
    , public."Dept_Manager".emp_no
    , public."Employees".first_name
    , public."Employees".last_name
FROM public."Dept_Manager"
INNER JOIN public."Depts" ON
    public."Dept_Manager".dept_no = public."Depts".dept_no
INNER JOIN public."Employees" ON
    public."Dept_Manager".emp_no = public."Employees".emp_no;

-- 4. List the dept number for each employee along with employee number, last name, first name, and department name
SELECT public."Dept_Emp".dept_no
    , public."Dept_Emp".emp_no
    , public."Employees".last_name
    , public."Employees".first_name
    , public."Depts".dept_name
FROM public."Dept_Emp"
INNER JOIN public."Employees" ON
    public."Dept_Emp".emp_no = public."Employees".emp_no
INNER JOIN public."Depts" ON
    public."Dept_Emp".dept_no = public."Depts".dept_no;

-- 5. List the first name, last name, sex for each employee whose first name is Hercules and last name starts with 'B'
SELECT first_name
    , last_name
    , sex
FROM public."Employees"
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. List each employee in the sales department, including their employee number, last name, and first name
SELECT public."Employees".emp_no
    , public."Employees".last_name
    , public."Employees".first_name
FROM public."Employees"
INNER JOIN public."Dept_Emp" ON
    public."Employees".emp_no = public."Dept_Emp".emp_no
INNER JOIN public."Depts" ON
    public."Depts".dept_no = public."Dept_Emp".dept_no
WHERE public."Depts".dept_name = 'Sales';

-- 7. List each employee in the sales and development depts, including employee number, last name, first name, and department name
SELECT public."Employees".emp_no
    , public."Employees".last_name
    , public."Employees".first_name
    , public."Depts".dept_name
FROM public."Employees"
INNER JOIN public."Dept_Emp" ON
    public."Employees".emp_no = public."Dept_Emp".emp_no
INNER JOIN public."Depts" ON
    public."Depts".dept_no = public."Dept_Emp".dept_no
WHERE public."Depts".dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts in descending order of all the employee last names
SELECT last_name
    , count(last_name)
FROM public."Employees"
GROUP BY last_name
ORDER BY count(last_name) DESC;
