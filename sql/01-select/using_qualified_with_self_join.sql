SELECT emp.employee_id AS "employee id",
       emp.last_name AS "employee name",
       man.employee_id AS "manager id",
       man.last_name AS "manager name"
FROM employees AS emp
LEFT OUTER JOIN employees AS man ON emp.manager_id = man.employee_id;

SELECT emp.employee_id AS "employee id",
       emp.last_name AS "employee name",
       man.employee_id AS "manager id",
       man.last_name AS "manager name"
FROM employees AS emp
RIGHT OUTER JOIN employees AS man ON emp.manager_id = man.employee_id;

SELECT emp.employee_id AS "employee id",
       emp.last_name AS "employee name",
       man.employee_id AS "manager id",
       man.last_name AS "manager name"
FROM employees AS emp
FULL OUTER JOIN employees AS man ON emp.manager_id = man.department_id;