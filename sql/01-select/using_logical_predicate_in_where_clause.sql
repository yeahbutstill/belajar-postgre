SELECT employee_id, first_name, last_name, job_id, manager_id, department_id
FROM employees
WHERE department_id = 90 AND manager_id = 100;

SELECT employee_id, first_name, last_name, job_id, manager_id, department_id
FROM employees
WHERE department_id = 90 OR manager_id = 100;

SELECT employee_id, first_name, last_name, job_id, manager_id, department_id, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 20000;

SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE job_id NOT LIKE '%FI%'
  AND job_id NOT LIKE '%PU%'
  AND job_id NOT LIKE '%AD%'
  AND job_id NOT LIKE '%_MAN%';

SELECT employee_id, first_name, last_name, job_id, manager_id, department_id, salary, commission_pct
FROM employees
WHERE manager_id = 100
  AND (department_id = 90 OR salary >= 10000)
  AND manager_id IS NOT NULL
  AND commission_pct IS NOT NULL;