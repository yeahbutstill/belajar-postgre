toc.dat                                                                                             0000600 0004000 0002000 00000044007 14416220615 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           1                {            hr    15.2 (Debian 15.2-1.pgdg110+1)    15.2 (Debian 15.2-2) >    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         W           1262    16384    hr    DATABASE     m   CREATE DATABASE hr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE hr;
                hr    false                     2615    16486 
   accounting    SCHEMA        CREATE SCHEMA accounting;
    DROP SCHEMA accounting;
                hr    false         �            1259    16487 	   mata_uang    TABLE     �   CREATE TABLE accounting.mata_uang (
    id character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    symbol character varying(5),
    create_date date NOT NULL
);
 !   DROP TABLE accounting.mata_uang;
    
   accounting         heap    hr    false    6         �            1259    16401 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_id character varying(2) NOT NULL,
    country_name character varying(40),
    region_id integer NOT NULL
);
    DROP TABLE public.countries;
       public         heap    hr    false         �            1259    16414    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30),
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    hr    false         �            1259    16413    departments_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.departments_department_id_seq;
       public          hr    false    222         X           0    0    departments_department_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;
          public          hr    false    221         �            1259    16421 	   employees    TABLE     y  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    job_id character varying(10),
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap    hr    false         �            1259    16420    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public          hr    false    224         Y           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public          hr    false    223         �            1259    16385    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);
 )   DROP TABLE public.flyway_schema_history;
       public         heap    hr    false         �            1259    16434    job_history    TABLE     �   CREATE TABLE public.job_history (
    employee_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    job_id character varying(10),
    department_id integer
);
    DROP TABLE public.job_history;
       public         heap    hr    false         �            1259    16429    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35),
    min_salary numeric(6,0),
    max_salary numeric(6,0)
);
    DROP TABLE public.jobs;
       public         heap    hr    false         �            1259    16407 	   locations    TABLE       CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30),
    state_province character varying(25),
    country_id character varying(2)
);
    DROP TABLE public.locations;
       public         heap    hr    false         �            1259    16406    locations_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.locations_location_id_seq;
       public          hr    false    220         Z           0    0    locations_location_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;
          public          hr    false    219         �            1259    16493 	   mata_uang    TABLE     �   CREATE TABLE public.mata_uang (
    id character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    last_updated timestamp without time zone DEFAULT now(),
    created_by character varying(100) DEFAULT now()
);
    DROP TABLE public.mata_uang;
       public         heap    hr    false         �            1259    16395    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    hr    false         �            1259    16394    regions_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.regions_region_id_seq;
       public          hr    false    217         [           0    0    regions_region_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;
          public          hr    false    216         �           2604    16417    departments department_id    DEFAULT     �   ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);
 H   ALTER TABLE public.departments ALTER COLUMN department_id DROP DEFAULT;
       public          hr    false    222    221    222         �           2604    16424    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public          hr    false    223    224    224         �           2604    16410    locations location_id    DEFAULT     ~   ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);
 D   ALTER TABLE public.locations ALTER COLUMN location_id DROP DEFAULT;
       public          hr    false    219    220    220         �           2604    16398    regions region_id    DEFAULT     v   ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);
 @   ALTER TABLE public.regions ALTER COLUMN region_id DROP DEFAULT;
       public          hr    false    217    216    217         P          0    16487 	   mata_uang 
   TABLE DATA              
   accounting          hr    false    227       3408.dat G          0    16401 	   countries 
   TABLE DATA                 public          hr    false    218       3399.dat K          0    16414    departments 
   TABLE DATA                 public          hr    false    222       3403.dat M          0    16421 	   employees 
   TABLE DATA                 public          hr    false    224       3405.dat D          0    16385    flyway_schema_history 
   TABLE DATA                 public          hr    false    215       3396.dat O          0    16434    job_history 
   TABLE DATA                 public          hr    false    226       3407.dat N          0    16429    jobs 
   TABLE DATA                 public          hr    false    225       3406.dat I          0    16407 	   locations 
   TABLE DATA                 public          hr    false    220       3401.dat Q          0    16493 	   mata_uang 
   TABLE DATA                 public          hr    false    228       3409.dat F          0    16395    regions 
   TABLE DATA                 public          hr    false    217       3398.dat \           0    0    departments_department_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);
          public          hr    false    221         ]           0    0    employees_employee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);
          public          hr    false    223         ^           0    0    locations_location_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);
          public          hr    false    219         _           0    0    regions_region_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);
          public          hr    false    216         �           2606    16491    mata_uang mata_uang_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY accounting.mata_uang
    ADD CONSTRAINT mata_uang_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY accounting.mata_uang DROP CONSTRAINT mata_uang_pkey;
    
   accounting            hr    false    227         �           2606    16405    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            hr    false    218         �           2606    16419    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            hr    false    222         �           2606    16428    employees employees_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_email_key;
       public            hr    false    224         �           2606    16426    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            hr    false    224         �           2606    16392 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public            hr    false    215         �           2606    16433    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            hr    false    225         �           2606    16412    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            hr    false    220         �           2606    16498    mata_uang mata_uang_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.mata_uang
    ADD CONSTRAINT mata_uang_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.mata_uang DROP CONSTRAINT mata_uang_pk;
       public            hr    false    228         �           2606    16400    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            hr    false    217         �           1259    16393    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public            hr    false    215         �           1259    16499    mata_uang_name_index    INDEX     J   CREATE INDEX mata_uang_name_index ON public.mata_uang USING btree (name);
 (   DROP INDEX public.mata_uang_name_index;
       public            hr    false    228         �           2606    16457    countries fk_contries_region_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT fk_contries_region_id FOREIGN KEY (region_id) REFERENCES public.regions(region_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.countries DROP CONSTRAINT fk_contries_region_id;
       public          hr    false    3227    217    218         �           2606    16477 &   departments fk_departments_location_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_location_id FOREIGN KEY (location_id) REFERENCES public.locations(location_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.departments DROP CONSTRAINT fk_departments_location_id;
       public          hr    false    220    222    3231         �           2606    16462 %   departments fk_departments_manager_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_manager_id FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.departments DROP CONSTRAINT fk_departments_manager_id;
       public          hr    false    224    222    3237         �           2606    16467 $   employees fk_employees_department_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employees_department_id;
       public          hr    false    224    3233    222         �           2606    16442    employees fk_employees_job_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employees_job_id;
       public          hr    false    3239    225    224         �           2606    16472 !   employees fk_employees_manager_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_manager_id FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employees_manager_id;
       public          hr    false    224    224    3237         �           2606    16447 (   job_history fk_job_history_department_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_job_history_department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_job_history_department_id;
       public          hr    false    3233    222    226         �           2606    16452 !   job_history fk_job_history_job_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_job_history_job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.job_history DROP CONSTRAINT fk_job_history_job_id;
       public          hr    false    226    3239    225         �           2606    16437     locations fk_locations_contry_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_locations_contry_id FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.locations DROP CONSTRAINT fk_locations_contry_id;
       public          hr    false    3229    218    220                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 3408.dat                                                                                            0000600 0004000 0002000 00000000002 14416220615 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              3399.dat                                                                                            0000600 0004000 0002000 00000004571 14416220615 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('AR', 'Argentina', 2);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('AU', 'Australia', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('BE', 'Belgium', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('BR', 'Brazil', 2);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('CA', 'Canada', 2);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('CH', 'Switzerland', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('CN', 'China', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('DE', 'Germany', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('DK', 'Denmark', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('EG', 'Egypt', 4);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('FR', 'France', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('HK', 'HongKong', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('IL', 'Israel', 4);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('IN', 'India', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('IT', 'Italy', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('JP', 'Japan', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('KW', 'Kuwait', 4);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('MX', 'Mexico', 2);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('NG', 'Nigeria', 4);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('NL', 'Netherlands', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('SG', 'Singapore', 3);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('UK', 'United Kingdom', 1);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('US', 'United States of America', 2);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('ZM', 'Zambia', 4);
INSERT INTO public.countries (country_id, country_name, region_id) VALUES ('ZW', 'Zimbabwe', 4);


                                                                                                                                       3403.dat                                                                                            0000600 0004000 0002000 00000007036 14416220615 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (300, 'System Analis', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (10, 'Administration', 200, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (20, 'Marketing', 201, 1800);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (50, 'Shipping', 121, 1500);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (60, 'IT', 103, 1400);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (70, 'Public Relations', 204, 2700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (80, 'Sales', 145, 2500);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (90, 'Executive', 100, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (100, 'Finance', 108, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (110, 'Accounting', 205, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (120, 'Treasury', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (130, 'Corporate Tax', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (140, 'Control And Credit', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (150, 'Shareholder Services', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (160, 'Benefits', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (170, 'Manufacturing', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (180, 'Construction', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (190, 'Contracting', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (200, 'Operations', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (210, 'IT Support', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (220, 'NOC', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (230, 'IT Helpdesk', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (240, 'Government Sales', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (250, 'Retail Sales', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (260, 'Recruiting', NULL, 1700);
INSERT INTO public.departments (department_id, department_name, manager_id, location_id) VALUES (270, 'Payroll', NULL, 1700);


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3405.dat                                                                                            0000600 0004000 0002000 00000062762 14416220615 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', 'AD_PRES', 24000.00, NULL, NULL, 90);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', 'AD_VP', 17000.00, NULL, 100, 90);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', 'AD_VP', 17000.00, NULL, 100, 90);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', 'IT_PROG', 9000.00, NULL, 102, 60);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', 'IT_PROG', 6000.00, NULL, 103, 60);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', 'IT_PROG', 4800.00, NULL, 103, 60);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', 'IT_PROG', 4800.00, NULL, 103, 60);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', 'IT_PROG', 4200.00, NULL, 103, 60);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', 'FI_MGR', 12000.00, NULL, 101, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', 'FI_ACCOUNT', 9000.00, NULL, 108, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (110, 'John', 'Chen', 'JCHEN', '515.124.4269', 'FI_ACCOUNT', 8200.00, NULL, 108, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', 'FI_ACCOUNT', 7700.00, NULL, 108, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', 'FI_ACCOUNT', 7800.00, NULL, 108, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', 'FI_ACCOUNT', 6900.00, NULL, 108, 100);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', 'PU_MAN', 11000.00, NULL, 100, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', 'PU_CLERK', 3100.00, NULL, 114, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', 'PU_CLERK', 2900.00, NULL, 114, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', 'PU_CLERK', 2800.00, NULL, 114, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', 'PU_CLERK', 2600.00, NULL, 114, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', 'PU_CLERK', 2500.00, NULL, 114, 30);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', 'ST_MAN', 8000.00, NULL, 100, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', 'ST_MAN', 8200.00, NULL, 100, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', 'ST_MAN', 7900.00, NULL, 100, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', 'ST_MAN', 6500.00, NULL, 100, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', 'ST_MAN', 5800.00, NULL, 100, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', 'ST_CLERK', 3200.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', 'ST_CLERK', 2700.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (127, 'James', 'Landry', 'JLANDRY', '650.124.1334', 'ST_CLERK', 2400.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', 'ST_CLERK', 2200.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', 'ST_CLERK', 3300.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', 'ST_CLERK', 2800.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', 'ST_CLERK', 2500.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', 'ST_CLERK', 2100.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', 'ST_CLERK', 3300.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', 'ST_CLERK', 2900.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (135, 'Ki', 'Gee', 'KGEE', '650.127.1734', 'ST_CLERK', 2400.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', 'ST_CLERK', 2200.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', 'ST_CLERK', 3600.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', 'ST_CLERK', 3200.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (139, 'John', 'Seo', 'JSEO', '650.121.2019', 'ST_CLERK', 2700.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', 'ST_CLERK', 2500.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', 'ST_CLERK', 3500.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', 'ST_CLERK', 3100.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', 'ST_CLERK', 2600.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', 'ST_CLERK', 2500.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', 'SA_MAN', 14000.00, 0.40, 100, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', 'SA_MAN', 13500.00, 0.30, 100, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', 'SA_MAN', 12000.00, 0.30, 100, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', 'SA_MAN', 11000.00, 0.30, 100, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', 'SA_MAN', 10500.00, 0.20, 100, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', 'SA_REP', 10000.00, 0.30, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', 'SA_REP', 9500.00, 0.25, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', 'SA_REP', 9000.00, 0.25, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', 'SA_REP', 8000.00, 0.20, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', 'SA_REP', 7500.00, 0.20, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', 'SA_REP', 7000.00, 0.15, 145, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (156, 'Janette', 'King', 'JKING', '011.44.1345.429268', 'SA_REP', 10000.00, 0.35, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', 'SA_REP', 9500.00, 0.35, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', 'SA_REP', 9000.00, 0.35, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', 'SA_REP', 8000.00, 0.30, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', 'SA_REP', 7500.00, 0.30, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', 'SA_REP', 7000.00, 0.25, 146, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', 'SA_REP', 10500.00, 0.25, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', 'SA_REP', 9500.00, 0.15, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', 'SA_REP', 7200.00, 0.10, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', 'SA_REP', 6800.00, 0.10, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', 'SA_REP', 6400.00, 0.10, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', 'SA_REP', 6200.00, 0.10, 147, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', 'SA_REP', 11500.00, 0.25, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', 'SA_REP', 10000.00, 0.20, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', 'SA_REP', 9600.00, 0.20, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', 'SA_REP', 7400.00, 0.15, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', 'SA_REP', 7300.00, 0.15, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', 'SA_REP', 6100.00, 0.10, 148, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', 'SA_REP', 11000.00, 0.30, 149, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', 'SA_REP', 8800.00, 0.25, 149, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', 'SA_REP', 8600.00, 0.20, 149, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', 'SA_REP', 8400.00, 0.20, 149, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', 'SA_REP', 7000.00, 0.15, 149, NULL);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', 'SA_REP', 6200.00, 0.10, 149, 80);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', 'SH_CLERK', 3200.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', 'SH_CLERK', 3100.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', 'SH_CLERK', 2500.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', 'SH_CLERK', 2800.00, NULL, 120, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', 'SH_CLERK', 4200.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', 'SH_CLERK', 4100.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', 'SH_CLERK', 3400.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', 'SH_CLERK', 3000.00, NULL, 121, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', 'SH_CLERK', 3800.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', 'SH_CLERK', 3600.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', 'SH_CLERK', 2900.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', 'SH_CLERK', 2500.00, NULL, 122, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', 'SH_CLERK', 4000.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', 'SH_CLERK', 3900.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', 'SH_CLERK', 3200.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (195, 'Vance', 'Jones', 'VJONES', '650.501.4876', 'SH_CLERK', 2800.00, NULL, 123, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', 'SH_CLERK', 3100.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', 'SH_CLERK', 3000.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', 'SH_CLERK', 2600.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', 'SH_CLERK', 2600.00, NULL, 124, 50);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', 'AD_ASST', 4400.00, NULL, 101, 10);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', 'MK_MAN', 13000.00, NULL, 100, 20);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', 'MK_REP', 6000.00, NULL, 201, 20);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', 'HR_REP', 6500.00, NULL, 101, 40);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', 'PR_REP', 10000.00, NULL, 101, 70);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', 'AC_MGR', 12000.00, NULL, 101, 110);
INSERT INTO public.employees (employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id) VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', 'AC_ACCOUNT', 8300.00, NULL, 205, 110);


              3396.dat                                                                                            0000600 0004000 0002000 00000000427 14416220615 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1.1', 'schema-hr', 'SQL', 'V1.1__schema-hr.sql', -517226740, 'hr', '2023-04-09 15:28:45.641959', 92, true);


                                                                                                                                                                                                                                         3407.dat                                                                                            0000600 0004000 0002000 00000003172 14416220615 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (102, '1993-01-13 00:00:00', '1998-07-24 00:00:00', 'IT_PROG', 60);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (101, '1989-09-21 00:00:00', '1993-10-27 00:00:00', 'AC_ACCOUNT', 110);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (101, '1993-10-28 00:00:00', '1997-03-15 00:00:00', 'AC_MGR', 110);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (201, '1996-02-17 00:00:00', '1999-12-19 00:00:00', 'MK_REP', 20);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (114, '1998-03-24 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (122, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'ST_CLERK', 50);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (200, '1987-09-17 00:00:00', '1993-06-17 00:00:00', 'AD_ASST', 90);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (176, '1998-03-24 00:00:00', '1998-12-31 00:00:00', 'SA_REP', 80);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (176, '1999-01-01 00:00:00', '1999-12-31 00:00:00', 'SA_MAN', 80);
INSERT INTO public.job_history (employee_id, start_date, end_date, job_id, department_id) VALUES (200, '1994-07-01 00:00:00', '1998-12-31 00:00:00', 'AC_ACCOUNT', 90);


                                                                                                                                                                                                                                                                                                                                                                                                      3406.dat                                                                                            0000600 0004000 0002000 00000004427 14416220615 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_PRES', 'President', 20000, 40000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_VP', 'Administration Vice President', 15000, 30000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('FI_MGR', 'Finance Manager', 8200, 16000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('FI_ACCOUNT', 'Accountant', 4200, 9000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_MGR', 'Accounting Manager', 8200, 16000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_MAN', 'Sales Manager', 10000, 20000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('SA_REP', 'Sales Representative', 6000, 12000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('PU_MAN', 'Purchasing Manager', 8000, 15000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('ST_CLERK', 'Stock Clerk', 2000, 5000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('SH_CLERK', 'Shipping Clerk', 2500, 5500);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('MK_REP', 'Marketing Representative', 4000, 9000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('HR_REP', 'Human Resources Representative', 4000, 9000);
INSERT INTO public.jobs (job_id, job_title, min_salary, max_salary) VALUES ('PR_REP', 'Public Relations Representative', 4500, 10500);


                                                                                                                                                                                                                                         3401.dat                                                                                            0000600 0004000 0002000 00000010146 14416220615 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1000, '1297 Via Cola di Rie', '00989', 'Roma', '', 'IT');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1100, '93091 Calle della Testa', '10934', 'Venice', '', 'IT');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2000, '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2300, '198 Clementi North', '540198', 'Singapore', '', 'SG');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2400, '8204 Arthur St', '', 'London', '', 'UK');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2600, '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2800, 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');


                                                                                                                                                                                                                                                                                                                                                                                                                          3409.dat                                                                                            0000600 0004000 0002000 00000000233 14416220615 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.mata_uang (id, name, last_updated, created_by) VALUES ('1', 'Rupiah', '2023-04-14 09:26:10.245056', '2023-04-14 09:27:37.669842+00');


                                                                                                                                                                                                                                                                                                                                                                     3398.dat                                                                                            0000600 0004000 0002000 00000000472 14416220615 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.regions (region_id, region_name) VALUES (1, 'Europe');
INSERT INTO public.regions (region_id, region_name) VALUES (2, 'Americas');
INSERT INTO public.regions (region_id, region_name) VALUES (3, 'Asia');
INSERT INTO public.regions (region_id, region_name) VALUES (4, 'Middle East and Africa');


                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000033270 14416220615 0015372 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE hr;
--
-- Name: hr; Type: DATABASE; Schema: -; Owner: hr
--

CREATE DATABASE hr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hr OWNER TO hr;

\connect hr

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: accounting; Type: SCHEMA; Schema: -; Owner: hr
--

CREATE SCHEMA accounting;


ALTER SCHEMA accounting OWNER TO hr;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mata_uang; Type: TABLE; Schema: accounting; Owner: hr
--

CREATE TABLE accounting.mata_uang (
    id character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    symbol character varying(5),
    create_date date NOT NULL
);


ALTER TABLE accounting.mata_uang OWNER TO hr;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.countries (
    country_id character varying(2) NOT NULL,
    country_name character varying(40),
    region_id integer NOT NULL
);


ALTER TABLE public.countries OWNER TO hr;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30),
    manager_id integer,
    location_id integer
);


ALTER TABLE public.departments OWNER TO hr;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: hr
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO hr;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hr
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    job_id character varying(10),
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer
);


ALTER TABLE public.employees OWNER TO hr;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: hr
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employee_id_seq OWNER TO hr;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hr
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO hr;

--
-- Name: job_history; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.job_history (
    employee_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    job_id character varying(10),
    department_id integer
);


ALTER TABLE public.job_history OWNER TO hr;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35),
    min_salary numeric(6,0),
    max_salary numeric(6,0)
);


ALTER TABLE public.jobs OWNER TO hr;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30),
    state_province character varying(25),
    country_id character varying(2)
);


ALTER TABLE public.locations OWNER TO hr;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: hr
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO hr;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hr
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: mata_uang; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.mata_uang (
    id character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    last_updated timestamp without time zone DEFAULT now(),
    created_by character varying(100) DEFAULT now()
);


ALTER TABLE public.mata_uang OWNER TO hr;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: hr
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);


ALTER TABLE public.regions OWNER TO hr;

--
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: hr
--

CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_region_id_seq OWNER TO hr;

--
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hr
--

ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);


--
-- Data for Name: mata_uang; Type: TABLE DATA; Schema: accounting; Owner: hr
--

\i $$PATH$$/3408.dat

--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3399.dat

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3403.dat

--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3405.dat

--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3396.dat

--
-- Data for Name: job_history; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3407.dat

--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3406.dat

--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3401.dat

--
-- Data for Name: mata_uang; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3409.dat

--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: hr
--

\i $$PATH$$/3398.dat

--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hr
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);


--
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hr
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hr
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);


--
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hr
--

SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);


--
-- Name: mata_uang mata_uang_pkey; Type: CONSTRAINT; Schema: accounting; Owner: hr
--

ALTER TABLE ONLY accounting.mata_uang
    ADD CONSTRAINT mata_uang_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: mata_uang mata_uang_pk; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.mata_uang
    ADD CONSTRAINT mata_uang_pk PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: hr
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: mata_uang_name_index; Type: INDEX; Schema: public; Owner: hr
--

CREATE INDEX mata_uang_name_index ON public.mata_uang USING btree (name);


--
-- Name: countries fk_contries_region_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT fk_contries_region_id FOREIGN KEY (region_id) REFERENCES public.regions(region_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departments fk_departments_location_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_location_id FOREIGN KEY (location_id) REFERENCES public.locations(location_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departments fk_departments_manager_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_manager_id FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees fk_employees_department_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees fk_employees_job_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees fk_employees_manager_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_manager_id FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: job_history fk_job_history_department_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_job_history_department_id FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: job_history fk_job_history_job_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT fk_job_history_job_id FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: locations fk_locations_contry_id; Type: FK CONSTRAINT; Schema: public; Owner: hr
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT fk_locations_contry_id FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        