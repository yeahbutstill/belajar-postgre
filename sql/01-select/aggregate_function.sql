SELECT COUNT(*)
FROM jobs

SELECT max(salary) as max_salary
FROM employees
WHERE department_id = 80;

SELECT MIN (COALESCE(commission_pct, 0)) as min_commission
FROM employees;

SELECT MAX (COALESCE(commission_pct, 0)) as max_commission
FROM employees;

SELECT AVG(salary) as avg_salary
FROM employees
WHERE job_id = 'IT_PROG';