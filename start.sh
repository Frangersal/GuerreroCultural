#!/bin/bash
set -e

# Esperar a que la base de datos esté lista usando las variables de entorno
until nc -z $DB_HOST $DB_PORT; do
    echo "La base de datos no está lista. Esperando 5 segundos..."
    sleep 5
done

echo "¡La base de datos está lista! Ejecutando migraciones..."
php artisan migrate --force

echo "Iniciando el servidor..."
php artisan serve --host=0.0.0.0 --port=$PORT