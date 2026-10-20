#!/bin/sh
set -e

# APP_KEY encrypts sessions and cookies. Set it in the app's environment
# variables in the Weblines console (php artisan key:generate --show prints one).
# Without it, a random key is made at each start and users get logged out.
if [ -z "$APP_KEY" ]; then
  echo "WARNING: APP_KEY is not set; using a temporary key. Set APP_KEY in the console." >&2
  export APP_KEY="base64:$(head -c 32 /dev/urandom | base64)"
fi

# Default SQLite lives inside the container and is reset on redeploy.
# For real data, link a Weblines database and set DB_CONNECTION and DB_URL.
if [ "${DB_CONNECTION:-sqlite}" = "sqlite" ]; then
  touch database/database.sqlite
fi
php artisan migrate --force

exec php artisan serve --host=0.0.0.0 --port="${PORT:-3000}"
