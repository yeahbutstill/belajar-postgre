select employee_id,
       salary,
       commission_pct,
       case
           when commission_pct is null
               then 'Tidak memiliki komisi!'
           end AS keterangan
from employees;



select employee_id as kode_karyawan,
       first_name as nama_karyawan,
       salary as gaji_sebulan,
       commission_pct as komisi,
       case
           when commission_pct is null then 'Tidak memiliki komisi!'
           when commission_pct = 0.2 then 'Komisi sama dengan 20%'
           when commission_pct >= 0.2 then 'Komisi lebih besar dari 20%'
           else 'Komisi lebih kecil dari 20%'
           end as keterangan
from employees;

select employee_id as kode_karyawan,
       first_name as nama_karyawan,
       salary as gaji_sebulan,
       commission_pct as komisi,
       case
           when commission_pct is not null
               then
                case
                    when commission_pct <= 0.1 then 'Memiliki komisi lebih kecil dari 10%'
                    when commission_pct <= 0.2 then 'Memiliki komisi lebih kecil dari 20%'
                    when commission_pct <= 0.3 then 'Memiliki komisi lebih kecil dari 30%'
                    else 'Memiliki komisi lebih besar dari 30%'
                    end
            else 'Tidak memiliki komisi!'
            end as keterangan
from employees;


select employee_id as kode_karyawan,
       first_name as nama_karyawan,
       salary as gaji_sebulan,
       commission_pct as komisi
from employees
where
    case
        when
            commission_pct is null
                and salary <= 2200
            then true
        when
            commission_pct is null
            then false
        when
            commission_pct is not null
                and salary <= 8000
            then salary in (7000, 7200, 7500)
        when
            commission_pct is not null
                and salary < 12000
            then salary = 11000
        end