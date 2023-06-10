SELECT emp.employee_id,
       emp.first_name,
       emp.salary,
       func.rata_rata,
       func.min,
       func.max
FROM employees AS emp,
     (SELECT ROUND(AVG(j.max_salary), 0) AS rata_rata,
             MIN(j.max_salary) AS min,
             MAX(j.max_salary) AS max
             FROM jobs AS j) AS func
WHERE emp.salary >= func.rata_rata;

