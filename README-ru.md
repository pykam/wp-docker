# WordPress + Docker (dev template)

Локальное окружение для разработки на WordPress: Apache+PHP (с Xdebug и WP-CLI), MySQL 8 и phpMyAdmin.

Встроенный WP-CLI делает шаблон удобным для фулстек-разработки с помощью AI-агентов, которым нужен CLI-доступ к WordPress (управление плагинами/темами, контентом, операции с БД) в дополнение к прямому редактированию файлов.

English version: [README.md](README.md)

## Состав

- `wordpress` — образ `wordpress:latest` + Xdebug + WP-CLI (см. `Dockerfile`), код монтируется из `src/`
- `db` — MySQL 8.0, данные хранятся в `db_data/`
- `phpmyadmin` — веб-интерфейс для БД

## Быстрый старт

1. Скопировать `.env.example` в `.env` и при необходимости поменять порты/пароли:
   ```bash
   cp .env.example .env
   ```
2. Запустить:
   ```bash
   docker compose up -d
   ```
3. Открыть:
   - WordPress: http://localhost:8080 (порт из `WORDPRESS_PORT`)
   - phpMyAdmin: http://localhost:8081 (порт из `PHPMYADMIN_PORT`)

## Структура

- `src/` — файлы WordPress (монтируется в контейнер, пусто до первого запуска/установки)
- `db_data/` — данные MySQL (не коммитится)
- `uploads.ini` — лимиты загрузки файлов PHP
- `xdebug.ini` — настройки Xdebug (порт 9003, host.docker.internal)

## WP-CLI

```bash
docker compose exec wordpress wp <command>
```

## Несколько проектов на одной машине

Чтобы поднять несколько копий этого шаблона одновременно, задайте разные `WORDPRESS_PORT`/`PHPMYADMIN_PORT` в `.env` каждой копии — имена контейнеров/сетей Docker Compose сам изолирует по имени папки проекта.
