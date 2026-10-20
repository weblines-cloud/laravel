# Laravel starter

[![Deploy on Weblines](https://img.shields.io/badge/Deploy%20on-Weblines-25e07a?style=for-the-badge)](https://console.weblines.ir/deploy?repo=https://github.com/weblines-cloud/laravel)

A minimal Laravel (PHP 8.4) starter, ready to deploy on [Weblines Cloud](https://weblines.ir).

- Listens on `0.0.0.0` and the `PORT` env var (default `3000`), which is what Weblines expects.
- `GET /health` answers `200` for health checks.
- Builds from the `Dockerfile` in this repo.
- **Set `APP_KEY`** in the app's environment variables (`php artisan key:generate --show`). Without it a temporary key is used and sessions reset on every restart.
- The default SQLite database lives in the container and is reset on redeploy. For real data, link a Weblines database (PostgreSQL or MySQL) and set `DB_CONNECTION` / `DB_URL`.
- Runs with `php artisan serve` (4 workers), fine for small apps.
## Deploy

Click **Deploy on Weblines** above, or in the console: **New service → Custom app → Git repo**, paste `https://github.com/weblines-cloud/laravel`, keep port `3000`.

## Run locally

```bash
composer install
cp .env.example .env && php artisan key:generate
php artisan serve --port=3000
```

---

<div dir="rtl">

## قالبِ Laravel

قالبِ آماده‌ی Laravel (PHP 8.4) برای دیپلوی روی [ابر وب‌لاینز](https://weblines.ir).

- روی `0.0.0.0` و پورتِ متغیرِ `PORT` گوش می‌دهد (پیش‌فرض `3000`)؛ همان چیزی که وب‌لاینز انتظار دارد.
- مسیرِ `/health` برای بررسیِ سلامت جوابِ `200` می‌دهد.
- با `Dockerfile` ِ همین ریپو build می‌شود.
- **متغیرِ `APP_KEY` را حتماً در تنظیماتِ اپ بگذارید** (با `php artisan key:generate --show`). بدونِ آن کلیدِ موقت ساخته می‌شود و با هر ری‌استارت، کاربرها خارج می‌شوند.
- دیتابیسِ پیش‌فرضِ SQLite داخلِ کانتینر است و با هر دیپلوی پاک می‌شود. برای دادهٔ واقعی یک دیتابیسِ وب‌لاینز (PostgreSQL یا MySQL) وصل کنید و `DB_CONNECTION` و `DB_URL` را بگذارید.
### دیپلوی

روی دکمه‌ی **Deploy on Weblines** بزنید، یا در کنسول: **سرویس جدید ← اپلیکیشن ← گیت**، آدرسِ `https://github.com/weblines-cloud/laravel` را بدهید و پورت را `3000` بگذارید.

</div>

