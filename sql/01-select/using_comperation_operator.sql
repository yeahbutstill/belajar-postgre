select 3 > 4 as compera_less_than,
       3 > 4 and 3 > 3 as less_than,
       3 = 3 and 10 < 1 or 1 = 1 as less_then_eq_same,
       1 >= 3 and (0 < 1 or 1 = 1) as piority_less_then_eq_same,
       3 <> 3 as not_eq,
       'nilai tidak sama' <> 'nilai sama' as compare_string_no_equal,
       '28-FEB-2023'::DATE = '28-FEB-2022'::DATE as compare_date_equal, --- '28-FEB-2023'::DATE sama seperti CAST('28-FEB-2022' as date)
       2800000 IS NOT NULL as compare_not_null,
       'off'::boolean IS NOT TRUE as compare_not_true;