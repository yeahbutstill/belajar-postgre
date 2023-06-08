SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

SELECT employee_id,
       CONCAT(first_name, ' ', last_name) as full_name,
       job_id,
       salary
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT employee_id,
       CONCAT(first_name, ' ', last_name) as full_name,
       job_id,
       SUM(salary) as salary
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY employee_id, CONCAT(first_name, ' ', last_name), job_id;

SELECT employee_id,
       CONCAT(first_name, ' ', last_name) as full_name,
       job_id,
       SUM(salary) as salary
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY employee_id, CONCAT(first_name, ' ', last_name), job_id
HAVING SUM(salary) >= 7500;

SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'SA_MAN', 'IT_PROG', 'HR_REP', 'MK_MAN')
GROUP BY job_id
HAVING SUM(salary) >= 10000
ORDER BY COUNT(*);

SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'SA_MAN', 'IT_PROG', 'HR_REP', 'MK_MAN')
GROUP BY job_id
HAVING COUNT(*) >= 5 AND SUM(salary) >= 10000
ORDER BY COUNT(*);