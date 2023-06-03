SELECT employee_id, first_name, last_name, job_id, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT employee_id, first_name, last_name, job_id, manager_id
FROM employees
WHERE manager_id IS NOT NULL;