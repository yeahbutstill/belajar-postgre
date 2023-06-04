SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AC_ACCOUNT', 'PU_CLERK');

SELECT * FROM employees
WHERE salary IN (3100, 7500, 4800, 600);

SELECT * FROM employees
WHERE salary NOT IN (3100, 7500, 4800, 600);

SELECT * FROM employees
WHERE job_id = ANY (ARRAY ['IT_PROG', 'AC_ACCOUNT', 'PU_CLERK']);

SELECT * FROM employees
WHERE salary > ANY (ARRAY [3100, 7500, 4800, 600]);