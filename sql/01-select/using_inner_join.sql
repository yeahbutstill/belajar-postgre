SELECT emp.employee_id,
       CONCAT(emp.first_name, ' ', emp.last_name) as full_name,
       job.job_id,
       job.job_title,
       emp.salary AS current_salary,
       job.max_salary
FROM employees AS emp
    INNER JOIN jobs AS job ON (emp.job_id = job.job_id)

SELECT emp.employee_id,
       CONCAT(emp.first_name, ' ', emp.last_name) as full_name,
       job.job_id,
       job.job_title,
       emp.salary AS current_salary,
       job.max_salary,
       dep.department_name AS dep_name
FROM employees AS emp
    INNER JOIN jobs AS job ON (emp.job_id = job.job_id)
    INNER JOIN departments AS dep ON dep.department_id = emp.department_id