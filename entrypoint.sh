#!/bin/sh

# Exportar variables de entorno de MySQL con la sintaxis de Laravel
export DB_HOST="${{MySQL.HOST}}"
export DB_PORT="${{MySQL.PORT}}"
export DB_DATABASE="${{MySQL.DATABASE}}"
export DB_USERNAME="${{MySQL.USER}}"
export DB_PASSWORD="${{MySQL.PASSWORD}}"

# Ejecutar el comando de inicio principal (start.sh)
exec "$@"