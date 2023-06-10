-- exists
SELECT employee_id, first_name, job_id, salary
FROM employees emp
WHERE EXISTS(
    SELECT TRUE FROM job_history history
             WHERE emp.employee_id = history.employee_id
);