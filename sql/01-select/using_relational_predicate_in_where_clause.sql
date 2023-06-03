SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE salary <= 20000 AND job_id = 'IT_PROG';