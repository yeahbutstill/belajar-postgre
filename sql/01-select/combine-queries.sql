-- ingat jumlah kolom harus sama persis dari query 1 dan query 2, posisi, type data dan nama kolom harus sama persis juga.
select
* from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
              (2, 'naruto', 'Naruto Maki', false),
              (3, 'sasuke', 'Sasasusuke', null)
        ) as data1
union distinct
select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (4, 'triyanti', 'Maoy', false),
                  (5, 'lestari', 'Winda', null)
           ) as data2
order by column1 desc;

select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (2, 'naruto', 'Naruto Maki', false),
                  (3, 'sasuke', 'Sasasusuke', null)
           ) as data1
union all
select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (4, 'triyanti', 'Maoy', false),
                  (5, 'lestari', 'Winda', null)
           ) as data2
order by column1 desc;


select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (2, 'naruto', 'Naruto Maki', false),
                  (3, 'sasuke', 'Sasasusuke', null),
                  (4, 'triyanti', 'Maoy', false)
           ) as data1
intersect distinct
select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (4, 'triyanti', 'Maoy', false),
                  (5, 'lestari', 'Winda', null)
           ) as data2
order by column1 desc;

select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (2, 'naruto', 'Naruto Maki', false),
                  (3, 'sasuke', 'Sasasusuke', null),
                  (4, 'triyanti', 'Maoy', false)
           ) as data1
intersect all
select
    * from (values(1, 'yeahbutstill', 'Dani Setiawan', true),
                  (4, 'triyanti', 'Maoy', false),
                  (5, 'lestari', 'Winda', null)
           ) as data2
order by column1 desc;

