SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5 AND MAX(salary) >= 10000
ORDER BY job_id NULLS FIRST;

SELECT job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job,
       MAX(salary) as max_salary_by_job
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5 AND MAX(salary) >= 10000;