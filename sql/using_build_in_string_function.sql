select substring('Dani Setiawan' from 1 for 3) as substring_from,
    substr('Dani Setiawan', 1, 5) as "substr",
    lower('Ini Adalah Text BESAR dan Kecil') as "lower",
    upper('Ini Adalah Text BESAR dan Kecil') as "upper",
    initcap('Ini Adalah Text BESAR dan Kecil') as "initcap",
    trim(both ' ' from ' ini text ada spacenya ') as "trim both",
    trim(trailing ' ' from ' ini text ada spacenya ') as "trim trailing",
    reverse('dani') as "reverse",
    length('dani setiawan') as "length",
    concat('yeahbutstill', ' : ', 'Dani Setiawan') as "concat",
    ascii('D') as "ascii";

select concat(first_name, ' ', last_name) as fullname,
       lower(email) as lower_email,
       reverse(last_name) as last_name_reverse,
       length(concat(first_name, ' ', last_name)) as length_from_concat
from employees;