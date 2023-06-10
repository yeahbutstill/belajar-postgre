--- single column
SELECT emp.employee_id,
       emp.first_name,
       emp.salary
FROM employees AS emp
WHERE emp.salary >= (SELECT AVG(job.min_salary)FROM jobs AS job)
ORDER BY salary DESC;

-- multiple columns
SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       COALESCE(commission_pct, 0) AS commission,
       emp.job_id
FROM employees AS emp
WHERE (emp.salary, emp.salary, emp.job_id) >= (
    SELECT ROUND(STDDEV(job.max_salary), 0) AS max,
           ROUND(MAX(job.min_salary)) AS min,
           'IT_PROG' AS "job"
    FROM jobs AS job
) ORDER BY salary DESC
LIMIT 10;

-- sama aja kalau kita menggunakan logical operator
SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       COALESCE(commission_pct, 0) AS commission,
       emp.job_id
FROM employees AS emp
WHERE salary >= 8876 OR salary >= 20000 OR job_id = 'IT_PROG'
ORDER BY salary DESC
LIMIT 10;

SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees AS emp
WHERE (emp.salary, emp.job_id) >= (SELECT job.max_salary,
                                          job.job_id
                                   FROM jobs AS job
                                   ORDER BY job.job_id
                                   LIMIT 1);