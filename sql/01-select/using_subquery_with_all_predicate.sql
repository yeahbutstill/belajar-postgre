select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary != ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
    )
order by outq.salary;


select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary = ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
)
order by outq.salary;


select outq.employee_id, outq.first_name, outq.salary, outq.job_id
from employees outq
where outq.salary >= ALL (
    select max(salary) max_salary
    from employees
    where department_id in (10, 20, 30, 40)
    group by job_id
    order by max_salary
)
order by outq.salary;