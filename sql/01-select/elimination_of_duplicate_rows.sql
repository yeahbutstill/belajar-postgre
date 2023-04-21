select distinct (job_id, manager_id), job_id, manager_id from employees;
select distinct job_id from employees;

select distinct on (department_id, job_id) department_id, job_id from employees;
