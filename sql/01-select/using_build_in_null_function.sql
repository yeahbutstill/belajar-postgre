SELECT COALESCE (null, 'data1', 'data2') return_data_1,
       COALESCE (null, null, 'data2') return_data_2,
       COALESCE (null, null, null) return_null,
       NULLIF(null, 'data1') return_nullif1,
       NULLIF('data1', 'data1') return_nullif2,
       NULLIF('data1', 'data2') return_nullif3;

SELECT employee_id,
       commission_pct,
       COALESCE(commission_pct, 0),
       salary * COALESCE(commission_pct, 0) as total_salary
FROM employees;