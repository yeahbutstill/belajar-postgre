SELECT DISTINCT job_id
FROM employees;

SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job,
       MAX(salary) as max_salary_by_job
FROM employees
GROUP BY job_id;

SELECT department_id, job_id, COUNT(*) as employees_by_department_and_job
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id NULLS FIRST;

SELECT * FROM employees
WHERE job_id = 'SA_REP';