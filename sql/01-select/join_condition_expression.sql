--with on
SELECT dep.department_id,
       dep.department_name,
       emp.employee_id,
       emp.last_name
FROM departments AS dep
LEFT OUTER JOIN employees AS emp on dep.manager_id = emp.employee_id

--with using
SELECT emp.employee_id,
       emp.last_name,
       job.job_id,
       job.job_title
FROM employees AS emp
INNER JOIN jobs AS job USING (job_id)
LIMIT 10;

--with where
SELECT emp.employee_id,
       emp.last_name,
       job.job_id,
       job.job_title
FROM employees AS emp,
     jobs AS job
WHERE emp.job_id = job.job_id
LIMIT 10;