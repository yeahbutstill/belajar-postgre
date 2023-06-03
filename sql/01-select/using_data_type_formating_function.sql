SELECT to_char(14000, 'RP999,999,999.00'),
       to_char(2023, 'RN') AS romawi,
       to_char(current_timestamp, 'DD/MON/yyyy HH24:MI:SS') AS "current_time",
       to_number('10,000,000', '999,999,999');

SELECT employee_id,
       to_char(salary, '$99,999,999.00') as salary,
       to_char(coalesce(commission_pct, 0) * 100, '99%') as commission
       FROM employees;

SHOW timezone;
SET timezone = 'Asia/Jakarta';