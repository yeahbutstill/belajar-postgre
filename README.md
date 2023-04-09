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
postgres:15
```

## Menjalankan dengan Docker Compose
```shell
docker compose config ### map env
docker compose -f docker-compose.yml --env-file .env --profile debug up
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
-f docker-compose.yml \
--env-file .env \
--profile migrate up
```
Jika sudah sekarang kita bisa check dengan perintah berikut:
```shell
docker compose \
-f docker-compose.yml \
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
-f docker-compose.yml \
--env-file .env \
exec postgres psql -U hr -W
```

## Backup
```shell
docker compose \           
-f docker-compose.yml \
--env-file .env \
exec postgres pg_dump -U hr -W -d hr --no-privileges --insert --encoding utf8 -h localhost> backup/hr-09-04-23.sql
```

## Create database
```shell
docker compose \           
-f docker-compose.yml \
--env-file .env \
exec postgres createdb -U hr -W hr_temp 
```

## Restore
```shell
docker compose exec postgres psql -U hr -d hr -W -d hr_temp -f backup/hr-09-04-23.sql 
```