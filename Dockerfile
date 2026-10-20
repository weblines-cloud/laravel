FROM composer:2 AS vendor
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --no-scripts --prefer-dist --no-autoloader
COPY . .
RUN composer dump-autoload --optimize --no-dev --classmap-authoritative

FROM php:8.4-cli-alpine
WORKDIR /app
ENV APP_ENV=production APP_DEBUG=false LOG_CHANNEL=stderr \
    SESSION_DRIVER=file CACHE_STORE=file QUEUE_CONNECTION=sync \
    PHP_CLI_SERVER_WORKERS=4 PORT=3000
COPY --from=vendor /app /app
RUN mkdir -p storage/framework/cache storage/framework/sessions storage/framework/views storage/logs bootstrap/cache \
 && chown -R www-data:www-data storage bootstrap/cache database
USER www-data
EXPOSE 3000
CMD ["sh", "docker/start.sh"]
