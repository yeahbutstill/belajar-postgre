select current_date as tanggal_sekarang,
    now() as date_time_sekarang_func,
    current_timestamp as datetime_tz,
    age(timestamp '1993-09-22') as years_old,
    extract(year from current_timestamp) as get_current_year,
    extract(month from current_timestamp) as get_current_month;