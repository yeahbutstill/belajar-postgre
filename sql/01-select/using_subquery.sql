---subquery
--- dont forget this rules only one column and one row
SELECT emp.first_name,
       j.job_id,
       j.job_title,
       (SELECT MIN(h.start_date)::DATE FROM job_history AS h WHERE h.job_id = j.job_id) AS start_date,
       (SELECT MAX(h.end_date)::DATE FROM job_history AS h WHERE h.job_id = j.job_id) AS end_date
FROM jobs AS j,
     employees AS emp
WHERE j.job_id = emp.job_id
LIMIT 10;