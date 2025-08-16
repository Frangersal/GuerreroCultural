#!/bin/bash
set -e

echo "Esperando a que la base de datos esté lista..."

# Bucle de espera usando un script de PHP para verificar la conexión
until php -r "try { new PDO('mysql:host=$DB_HOST;port=$DB_PORT;dbname=$DB_DATABASE', '$DB_USERNAME', '$DB_PASSWORD'); } catch (PDOException \$e) { exit(1); }"; do
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