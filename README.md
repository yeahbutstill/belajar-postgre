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

Menjalankan dengan Docker Compose
```shell
docker compose config ### map env
docker compose up ### run
docker compose exec postgres psql -U postgres -W ### login
```

Untuk meng-aktifikan container pgadmin4 tersebut, kita perlu menggunakan profile debug dengan perintah seperti berikut:

```shell
docker compose -f docker-compose.yaml --env-file .env --profile debug up
```