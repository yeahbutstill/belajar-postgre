--natural join
SELECT *
FROM employees
    NATURAL JOIN jobs
    NATURAL JOIN locations
    NATURAL JOIN departments;

SELECT emp.first_name,
       emp.last_name,
       emp.employee_id,
       emp.phone_number,
       dep.department_name,
       job.job_title,
       loc.city
FROM employees AS emp
    NATURAL JOIN jobs AS job
    NATURAL JOIN locations AS loc
    NATURAL JOIN departments AS dep;

--cross join
SELECT emp.employee_id,
       emp.department_id,
       dep.department_name,
       emp.job_id,
       job.job_title,
       loc.location_id,
       loc.city
FROM employees AS emp
    CROSS JOIN departments AS dep
    CROSS JOIN jobs AS job
    CROSS JOIN locations AS loc;