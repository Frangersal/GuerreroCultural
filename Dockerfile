# Usa la imagen oficial de PHP para Laravel en Alpine Linux, que es ligera.
FROM php:8.3-fpm-alpine

# Instala Composer y las dependencias del sistema
RUN apk add --no-cache \
    nginx \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    mariadb-client \
    npm \
    bash \
    curl \
    git \
    netcat-openbsd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo_mysql opcache exif pcntl \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd \
    && chown -R www-data:www-data /var/www/html \
    && rm -rf /var/cache/apk/*

# Copia los archivos de tu proyecto al contenedor.
COPY . /var/www/html/

# Establece el directorio de trabajo.
WORKDIR /var/www/html

# Configura los permisos correctos.
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Establece las variables de entorno para que Laravel use MySQL
ENV DB_CONNECTION=mysql

# Instala las dependencias de Laravel y construye los assets.
# (Estos comandos no necesitan la base de datos)
RUN composer install --no-dev --optimize-autoloader --no-scripts \
    && npm install \
    && npm run build
    
# Exponer el puerto para Nginx.
EXPOSE 8000

# Comando de inicio del contenedor.
CMD ["bash", "start.sh"]