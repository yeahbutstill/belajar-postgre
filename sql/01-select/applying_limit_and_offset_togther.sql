SELECT * FROM employees;

-- PAGE 1
SELECT * FROM employees
ORDER by employee_id
LIMIT 8 OFFSET 0;

-- PAGE 2
SELECT * FROM employees
ORDER by employee_id
LIMIT 8 OFFSET 8;

-- PAGE 3
SELECT * FROM employees
ORDER by employee_id
LIMIT 8 OFFSET 16;