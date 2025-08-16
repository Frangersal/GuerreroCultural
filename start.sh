#!/bin/bash
set -e

echo "Esperando a que la base de datos esté lista..."

# Usa telnet para verificar la conexión al puerto
until telnet $DB_HOST $DB_PORT | grep -q 'Connected'; do
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