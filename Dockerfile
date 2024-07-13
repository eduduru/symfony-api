FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    zip \
    libonig-dev \
    libpng-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy existing application directory contents
COPY . /var/www/html

# Install application dependencies
RUN composer install --no-scripts --no-autoloader

# Generate JWT keys
RUN mkdir -p config/jwt && \
    openssl genrsa -out config/jwt/private.pem -aes256 4096 && \
    openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem

RUN composer dump-autoload --optimize
