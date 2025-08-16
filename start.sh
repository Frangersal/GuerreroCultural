#!/bin/bash
set -e

echo "Esperando a que la base de datos esté lista..."

until php artisan migrate:status > /dev/null 2>&1; do
  echo "La base de datos no está lista. Esperando 5 segundos..."
  sleep 5
done

echo "¡La base de datos está lista! Procediendo..."
php artisan migrate --force

echo "Iniciando el servidor..."
php artisan serve --host=0.0.0.0 --port=$PORT