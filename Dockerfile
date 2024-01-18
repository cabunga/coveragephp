# Imagen base con PHP y Composer
FROM php:8.0

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de la aplicación
COPY . .

# Instalar dependencias utilizando Composer (sin dev)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --optimize-autoloader

# Comando predeterminado al ejecutar el contenedor
CMD ["./vendor/bin/phpunit"]
