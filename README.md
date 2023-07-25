# docker-lamp
Auto build LAMP Application with: apache run php and laravel, redis

## Version

*  PHP = 8.2.3
*  Laravel
*  Postgresql = 15.2.0
*  Mailcatcher = 0.8.2
*  Redis = 6.0.6

## Installation

Build project and run project with steps:

### Copy environment file and vendor backup if exists

```
cp .env.example .env
cp -a /source/. /dest/
```

### Run docker compose build and deploy

```
docker-compose up -d
```

### Automatic installation

```
./installation.sh Or docker-compose run --rm laravel ./installation.sh
```

### Or Installation project with step
```
docker exec -it laravel bash
composer dump
chown www-data:www-data -R storage/
php artisan clear-compiled
php artisan route:clear
php artisan view:clear
php artisan cache:clear
php artisan config:clear
```

### Run restore Postgresql

```
docker exec -it postgresql-15.2 bash
pg_restore -U docker -d docker staging_local_2507.sql
```

## Guide help build docker

### Remove docker temp

If docker print the error shows that "No space left on device" then use command:

```
docker system prune
```

### Volume is error

ERROR: for node  Cannot create container for service node: no space left on device then use command:

```
docker volume rm $(docker volume ls -q)
```