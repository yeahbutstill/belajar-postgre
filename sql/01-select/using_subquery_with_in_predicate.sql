-- using IN predicate to handle multiple value
SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees emp
WHERE emp.job_id IN (
    SELECT DISTINCT inq.job_id
    FROM employees inq
    WHERE inq.department_id = 80
    )
ORDER BY emp.salary DESC;


-- this same like we are using logical operator
SELECT job_id,
       employee_id,
       first_name,
       salary
FROM employees
WHERE job_id = 'SA_MAN' OR job_id = 'SA_REP'
ORDER BY salary DESC;


SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees emp
WHERE (emp.job_id, emp.salary) IN (
    SELECT DISTINCT inq.job_id,
                    (SELECT MAX(j.max_salary)
                     FROM jobs j
                     WHERE j.job_id = inq.job_id
                     ) AS max_salary
    FROM employees inq
    ORDER BY 2 DESC
    )
ORDER BY emp.salary DESC;