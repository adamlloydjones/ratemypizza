#!/bin/bash
set -e

# Look for manage.py in /app
MANAGE_PATH=$(find /app -maxdepth 1 -name manage.py)

if [ -z "$MANAGE_PATH" ]; then
  echo "❌ manage.py not found in /app. Exiting."
  exit 1
fi

cd /app

echo "📦 Running migrations..."
python manage.py migrate --noinput
python manage.py collectstatic --noinput

# Start Django's built-in dev server
python manage.py runserver 0.0.0.0:8000