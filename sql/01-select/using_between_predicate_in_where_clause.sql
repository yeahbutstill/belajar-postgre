SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE salary BETWEEN 17000 AND 25000;

SELECT employee_id, first_name, last_name
FROM employees
WHERE substring(first_name FROM 1 FOR 1) BETWEEN 'h' AND 'j';

SELECT * FROM job_history
WHERE start_date BETWEEN '1993-01-01' AND '1993-12-31';