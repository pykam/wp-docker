# WordPress + Docker (dev template)

A local development environment for WordPress: Apache+PHP (with Xdebug and WP-CLI), MySQL 8, and phpMyAdmin.

Русская версия: [README-ru.md](README-ru.md)

## Stack

- `wordpress` — `wordpress:latest` image plus Xdebug and WP-CLI (see `Dockerfile`), code is mounted from `src/`
- `db` — MySQL 8.0, data stored in `db_data/`
- `phpmyadmin` — web UI for the database

## Quick start

1. Copy `.env.example` to `.env` and adjust ports/credentials if needed:
   ```bash
   cp .env.example .env
   ```
2. Start the stack:
   ```bash
   docker compose up -d
   ```
3. Open:
   - WordPress: http://localhost:8080 (port from `WORDPRESS_PORT`)
   - phpMyAdmin: http://localhost:8081 (port from `PHPMYADMIN_PORT`)

## Structure

- `src/` — WordPress files (mounted into the container, empty until first run/install)
- `db_data/` — MySQL data (not committed)
- `uploads.ini` — PHP upload limits
- `xdebug.ini` — Xdebug settings (port 9003, host.docker.internal)

## WP-CLI

```bash
docker compose exec wordpress wp <command>
```

## Running multiple projects on one machine

To run several copies of this template at the same time, set different `WORDPRESS_PORT`/`PHPMYADMIN_PORT` values in each copy's `.env` — Docker Compose already isolates container/network names by project (folder) name.
