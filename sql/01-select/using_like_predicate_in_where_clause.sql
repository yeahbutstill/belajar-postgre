-- _ skip
-- % bebas
SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE last_name like 'A%';

SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE last_name like '_t%';

SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE last_name like '__t%';

SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary
FROM employees
WHERE last_name ilike 's%';