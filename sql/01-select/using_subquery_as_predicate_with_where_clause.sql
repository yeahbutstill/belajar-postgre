SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       COALESCE(emp.commission_pct, 0) AS commission,
       emp.job_id
FROM employees AS emp
WHERE emp.salary >= (SELECT MIN(job.max_salary)
                    FROM jobs AS job
                    WHERE job_id = 'IT_PROG');

--- sama kaya gini
SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees AS emp
WHERE emp.salary >= 10000;


SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       COALESCE(emp.commission_pct, 0) AS commission,
       emp.job_id
FROM employees AS emp
WHERE emp.salary >= (SELECT AVG(job.min_salary)
                     FROM jobs AS job
                     WHERE job.job_id = emp.job_id);