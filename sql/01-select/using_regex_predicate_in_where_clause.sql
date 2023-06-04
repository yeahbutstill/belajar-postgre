SELECT employee_id, first_name, last_name, phone_number, job_id
FROM employees
WHERE first_name SIMILAR TO 'Ste(v|ph)en';

SELECT employee_id, first_name, last_name, phone_number, job_id
FROM employees
WHERE first_name ~ '^S.*(a|v|ph)';