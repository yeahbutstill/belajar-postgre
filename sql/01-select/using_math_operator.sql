select 2+2 as tambah,
       2*2 as kali,
       2/2 as bagi,
       2^3 as pangkat,
       @ -5.3 as abs,
       10%2 as mod;

select first_name, salary + 1000 as gaji_plus from employees;

select first_name, salary, commission_pct, salary * commission_pct as bonus from employees;
