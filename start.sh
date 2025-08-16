#!/bin/bash

# Esperar a que la base de datos esté lista usando el puerto.
until nc -z $DB_HOST $DB_PORT; do
    echo "La base de datos no está lista. Esperando 5 segundos..."
    sleep 5
done

echo "¡La base de datos está lista! Procediendo..."

# Ejecutar las migraciones.
php artisan migrate --force

# Iniciar el servidor web de PHP para la aplicación.
php artisan serve --host=0.0.0.0 --port=8000