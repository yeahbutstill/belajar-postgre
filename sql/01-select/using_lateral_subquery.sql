SELECT emp.employee_id,
       emp.first_name,
       emp.department_id AS "current department",
       emp.job_id AS "current job",
       history.start_date,
       history.end_date,
       history.job_id AS "last job",
       history.department_id AS "last department"
FROM employees AS emp,
     LATERAL(SELECT job.job_id,
                    job.start_date::DATE,
                    job.end_date::DATE,
                    job.department_id
      FROM job_history AS job
      WHERE emp.employee_id = job.employee_id) AS history
ORDER BY employee_id DESC;