#!/bin/bash
set -e

echo "Esperando a que la base de datos esté lista..."

# Usa un ping simple para verificar la conexión al host
until ping -c 1 $DB_HOST > /dev/null 2>&1; do
    echo "La base de datos no está lista. Esperando 5 segundos..."
    sleep 5
done

echo "¡La base de datos está lista! Procediendo..."

# Ejecutar comandos que necesitan conexión a la base de datos
php artisan cache:clear
php artisan view:clear
php artisan config:clear
php artisan migrate --force

echo "Iniciando el servidor..."
php artisan serve --host=0.0.0.0 --port=$PORT