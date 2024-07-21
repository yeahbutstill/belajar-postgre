# Belajar PostgreSQL Database
Menggunakan Relational database management system (RDBMS)

## Running PostgreSQL in Docker
Untuk menjalankan PostgreSQL di Docker ini sebetulnya sangatlah mudah, kita cukup jalankan perintah
```shell
docker run --rm \      
--name book_catalog-db \
-e POSTGRES_PASSWORD=belajaryuk \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v "$PWD/belajar-db-data:/var/lib/postgresql/data" \
-p 5432:5432 \
postgres:16.3-alpine3.20
```

## Menjalankan dengan Docker Compose
```shell
docker compose config ### map env
docker compose -f compose.yaml --env-file .env --profile debug up
docker compose exec postgres psql -U postgres -W ### login
```

## Create User
```shell
-- create user schema database
CREATE USER hr WITH SUPERUSER LOGIN PASSWORD 'hr';

-- create database
CREATE DATABASE hr WITH OWNER hr;
```

## Run migrationnya dengan perintah
```shell
docker compose \
-f compose.yaml \
--env-file .env \
--profile migrate up
```
Jika sudah sekarang kita bisa check dengan perintah berikut:
```shell
docker compose \
-f compose.yaml \
--env-file .env \
exec postgres psql -U hr -W -c "\dt"
```
coba kita hapus
```shell
docker compose down --volumes
#### lalu jalankan lagi
docker compose --profile migrate up
#### lalu login kembali menggunakan user hr
docker compose \
-f compose.yaml \
--env-file .env \
exec postgres psql -U hr -W
```

## Backup
```shell
docker compose \           
-f compose.yaml \
--env-file .env \
exec postgres pg_dump -U hr -W -d hr --no-privileges --insert --encoding utf8 -h localhost> backup/hr-09-04-23.sql
```

## Create database
```shell
docker compose \           
-f compose.yaml \
--env-file .env \
exec postgres createdb -U hr -W hr_temp 
```

## Restore
```shell
docker compose exec postgres psql -U hr -d hr -W -d hr_temp -f backup/hr-09-04-23.sql 
```

## Run PgAdmin4
```shell
docker compose \                                                                                                          
-f compose.yaml \
--env-file .env \
--profile debug up
```
# CDC dengan Debezium, Kafka, Postgres, Docker

## Ringkasan

Skrip Python ini dirancang untuk menghasilkan simulasi transaksi keuangan dan memasukkannya ke dalam database PostgreSQL. Ini sangat berguna untuk menyiapkan lingkungan pengujian untuk Change Data Capture (CDC) dengan Debezium. Skrip ini menggunakan pustaka `faker` untuk membuat data transaksi yang realistis namun fiktif dan memasukkannya ke dalam tabel PostgreSQL.

## Prasyarat

Sebelum menjalankan skrip ini, pastikan Anda telah menginstal yang berikut ini:
-Python 3.9+
- Perpustakaan `psycopg2` untuk Python
- Perpustakaan `faker` untuk Python
- Server PostgreSQL berjalan secara lokal atau dapat diakses dari jarak jauh
- Docker dan Docker Compose diinstal pada mesin Anda.
- Pemahaman dasar tentang Docker, Kafka, dan Postgres.

## Instalasi

1. **Instal Library Python yang Diperlukan:**

Anda dapat menginstal perpustakaan yang diperlukan menggunakan pip:

 ```bash
 pip install psycopg2-binary faker
 ```

## Layanan di File Tulis

- **Zookeeper:** Layanan terpusat untuk memelihara informasi konfigurasi, memberi nama, menyediakan sinkronisasi terdistribusi, dan menyediakan layanan grup.
- **Kafka Broker:** Platform streaming terdistribusi yang digunakan di sini untuk menangani umpan data waktu nyata.
- **Confluent Control Center:** Alat berbasis web untuk mengelola dan memantau Apache Kafka.
- **Debezium:** Platform terdistribusi sumber terbuka untuk pengambilan data perubahan.
- **Debezium UI:** Antarmuka pengguna untuk mengelola dan memantau konektor Debezium.
- **Postgres:** Database relasional sumber terbuka.

## Getting Started

1. **Kloning Repositori:**
   Pastikan Anda memiliki file Docker Compose ini di sistem lokal Anda. Jika itu bagian dari repositori, kloning repositori tersebut ke mesin lokal Anda.

2. **Navigasi ke Direktori:**
   Buka terminal dan navigasikan ke direktori yang berisi file Docker Compose.

3. **Jalankan Docker Compose:**
   Jalankan perintah berikut untuk memulai semua layanan yang ditentukan dalam file Docker Compose:

 ```bash
 docker compose up -d
 ```

Perintah ini akan mengunduh image Docker yang diperlukan, membuat container, dan memulai layanan dalam mode terpisah.

4. **Verifikasi Layanan:**
   Periksa apakah semua layanan aktif dan berjalan:

 ```bash
 docker compose ps
 ```

Anda akan melihat semua layanan terdaftar sebagai 'running'.

5. **Mengakses Layanan:**
- Pusat Kontrol Kafka dapat diakses di `http://localhost:9021`.
- Debezium UI dapat diakses di `http://localhost:8080`.
- Postgres dapat diakses pada port default `5432`.

6. **Shutting Down:**
   Untuk menghentikan dan menghapus kontainer, jaringan, dan volume, jalankan:

 ```bash
 docker compose down
 ```

## Kustomisasi
Anda dapat memodifikasi file Docker Compose sesuai kebutuhan Anda. Misalnya, Anda mungkin ingin mempertahankan data di Postgres dengan menambahkan volume untuk layanan Postgres.

## Catatan
Pengaturan ini dimaksudkan untuk tujuan pengembangan dan pengujian. Untuk lingkungan produksi, pertimbangkan faktor tambahan seperti keamanan, skalabilitas, dan persistensi data.

## Soal
### Questions for this assignment
- Buatlah query untuk menampilkan seluruh data karyawan dari table employees yang diurutkan berdasarkan email paling terakhir.
  ```sql
  SELECT *
  FROM employees
  ORDER BY email DESC;
  ```
  
- Buatlah query untuk menampilkan data karyawan yang gajinya lebih besar 3200.00 sampai dengan 12000.00
  ```sql
  SELECT *
  FROM employees
  WHERE salary BETWEEN 3200 AND 12000;
  ```
  
- Buatlah query untuk menampilkan data karyawan yang memiliki huruf A diawal nama depannya.
  1. Menggunakan substring function
  ```sql
  SELECT *
  FROM employees
  WHERE substr(first_name, 1, 1) ='A';
  ```
  2. Menggunakan like operators
  ```sql
  SELECT *
  FROM employees
  WHERE first_name LIKE 'A%';
  ```

- Buatlah query untuk menampilkan data karyawan yang memiliki kode karyawan diantaranya 103, 115, 196, 187, 102 dan 100
  ```sql
  SELECT * FROM employees
  WHERE employee_id IN (103, 115, 196, 187, 102, 100);
  ```
- Buatlah query untuk menampilkan data karyawan yang nama belakangnya memiliki huruf kedua u.
  1. Menggunakan substring function
  ```sql
  SELECT *
  FROM employees
  WHERE substr(last_name, 2, 1) = 'u';
  ```
  2. Menggunakan like operators
  ```sql
  SELECT *
  FROM employees
  WHERE last_name LIKE'_u%';
  ```
  
- Buatlah query untuk menampilkan kode department apa saja yang ada di tabel employees secara unique
  ```sql
  SELECT DISTINCT department_id FROM employees;
  ```
  
- Buatlah query untuk menampilkan nama lengkap karyawan, kode jabatan, gaji setahun dari table employees yang kode manager sama dengan 100.
  ```sql
  SELECT concat(first_name, ' ', last_name) AS "NAMA LENGKAP",
       job_id AS "KODE JABATAN",
       salary * 12 AS "GAJI SETAHUN"
  FROM employees
  WHERE manager_id = 100;
  ```
  
- Buatlah query untuk menampilkan nama belakang, gaji perbulan, kode jabatan dari table employees yang tidak memiliki komisi
  ```sql
  SELECT last_name "NAMA BELAKANG",
       salary "GAJI SEBULAN",
       job_id "KODE JABATAN"
  FROM employees
  WHERE commission_pct IS NULL;
  ```
  
- Buatlah query untuk menampilkan data karyawan yang bukan dari jabatan IT_PROG dan SH_CLERK.
  ```sql
  SELECT *
  FROM employees
  WHERE job_id NOT IN ('IT_PROG', 'SH_CLERK');
  ```