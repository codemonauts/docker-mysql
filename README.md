# codemonauts/mysql

Simple MySQL 5.7 container with a few handy tools for local development:
  * Import/Export script
  * [mycli](mycli.net), as an alternative MySQL-client with nicer colors and better tab completion
  * [sqlstrip](https://github.com/codemonauts/sqlstrip) to reduce loading time of databas dumps

## Usage with docker-compose

```
services:
  db:
    image: codemonauts/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: topsecret
      MYSQL_DATABASE: foo
      MYSQL_USER: bar
      MYSQL_PASSWORD: baz
    volumes:
      - .:/data:delegated
      - db-data:/var/lib/mysql:delegated

volumes:
  db-data:
```

## Import
Place the dump into the same folder where your docker-compose.yml file is located, so the file is visible inside the
container.
```
docker-compose exec db import databasedump.sql.gz
```
The dump can either be plain sql, or an compressed sql file (supported extensions are sql.gz, sql.zst and zip)

## Export
This will dump the database defined by '$MYSQL_DATABASE' into a gzipped file.
```
docker-compose exec db dump
```
