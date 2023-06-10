EXPLAIN(ANALYSE, BUFFERS)SELECT emp.employee_id,
       emp.first_name,
       (SELECT man.first_name
        FROM employees AS man
        WHERE emp.manager_id = man.employee_id) AS "manager name",
       (SELECT man.job_id
        FROM employees AS man
        WHERE emp.manager_id = man.employee_id) AS "manager job"
FROM employees AS emp;