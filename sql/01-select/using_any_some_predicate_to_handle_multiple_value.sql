SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees emp
WHERE emp.salary = ANY (
    SELECT MAX(inq.salary) max_salary
    FROM employees inq
    GROUP BY inq.job_id
    ORDER BY max_salary
    )
ORDER BY emp.salary DESC;

SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.job_id
FROM employees emp
WHERE emp.salary > ANY (
    SELECT MAX(inq.salary) max_salary
    FROM employees inq
    GROUP BY inq.job_id
    ORDER BY max_salary
    );