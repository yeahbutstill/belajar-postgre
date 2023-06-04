SELECT * FROM employees;

SELECT employee_id, first_name, salary,
       COALESCE(commission_pct, 0) as commission,
       salary * COALESCE(commission_pct, 0) as total_salary
FROM employees
ORDER BY salary * COALESCE(commission_pct, 0);

SELECT employee_id, first_name, salary,
       COALESCE(commission_pct, 0) as commission,
       salary * COALESCE(commission_pct, 0) as total_salary
FROM employees
ORDER BY 2;