SELECT UPPER (last_name) nama,
       TO_CHAR (salary, '$999,999.00') "gaji_sebulan",
       CONCAT (first_name, ' ', last_name) as NAMA_LENGKAP,
       COALESCE (commission_pct, 0) as commission
FROM employees
LIMIT 10;

SELECT UPPER (last_name) nama,
       TO_CHAR (salary, '$999,999.00') "gaji_sebulan",
       CONCAT (first_name, ' ', last_name) as NAMA_LENGKAP,
       COALESCE (commission_pct, 0) as commission
FROM employees
WHERE COALESCE (commission_pct, 0) > 0
LIMIT 10;