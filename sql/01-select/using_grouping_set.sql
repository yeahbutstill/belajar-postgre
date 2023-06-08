SELECT department_id,
       job_id,
       COUNT(*) as count_employees_by_job,
       SUM(salary) as salary_group_by_job
FROM employees
GROUP BY GROUPING SETS(job_id, department_id, (job_id, department_id))
ORDER BY COUNT(*) DESC;

SELECT manager_id,
       department_id,
       COUNT(*) as count_employees_by_department,
       SUM(salary) as salary_group_by_department
FROM employees
GROUP BY GROUPING SETS(manager_id, department_id)
ORDER BY COUNT(*) DESC;

-- tanpa menggunakan grouping sets
SELECT manager_id,
       COUNT(*),
       SUM(salary)
FROM employees
GROUP BY manager_id
ORDER BY count(*) DESC;

SELECT department_id,
       COUNT(*),
       SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY count(*) DESC;