SELECT employee_id, commission_pct, salary
FROM employees
ORDER BY commission_pct NULLS LAST, salary NULLS LAST;

SELECT employee_id, salary, manager_id, commission_pct
FROM employees
ORDER BY manager_id NULLS FIRST, commission_pct NULLS LAST;