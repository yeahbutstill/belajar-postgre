SELECT dep.department_id,
    dep.department_name,
    emp.employee_id,
    emp.last_name
FROM departments AS dep
LEFT JOIN employees emp ON dep.department_id = emp.department_id;

SELECT dep.department_id,
       dep.department_name,
       emp.employee_id,
       emp.last_name
FROM departments AS dep
RIGHT JOIN employees emp ON dep.department_id = emp.department_id;