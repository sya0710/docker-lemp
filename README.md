# docker-lemp
Auto build LEMP Application with: nginx is proxy, apache run php and auto build angular, phalcon

## Version

*  PHP = 7.3
*  Phalcon = 4.0.6
*  Angular = 15.2.0
*  MySQL = 5.7
*  Redis = 6.0.6

## Installation

Build project and run project with steps:

### Copy environment file

```
cp .env.example .env
```

### Run docker compose build and deploy

```
docker-compose up -d
```

## How to access API, Backend in Docker

### Api

- [Link access api with port](http://domain:81/api/v1/path_api)

- [Link access api no port](http://domain/api/v1/path_api)

### Backend

- [Link access backend with port](http://domain:4201)

- [Link access backend no port](http://domain)

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