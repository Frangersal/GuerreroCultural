#!/bin/bash
set -e

# Esperar a que la base de datos esté lista
until curl -s $DB_URL >/dev/null; do
    echo "La base de datos no está lista. Esperando 5 segundos..."
    sleep 5
done

echo "¡La base de datos está lista! Ejecutando migraciones..."
php artisan migrate --force

echo "Iniciando el servidor..."
php artisan serve --host=0.0.0.0 --port=$PORT