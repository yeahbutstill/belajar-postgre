select cast ('100' as int) as string_to_int,
       cast ('10.3' as double precision) as string_to_double,
       cast ('28-FEB-2023' as date) as string_to_date,
       'dani' || cast (93 as varchar) as int_to_string,
       cast (0 as boolean) as int_to_boolean,
       '100'::int as string_to_int_short;

