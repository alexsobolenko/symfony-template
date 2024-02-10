FROM php:8.2-fpm

RUN apt-get update
RUN apt-get install -y zlib1g-dev g++ libicu-dev zip libzip-dev curl
RUN apt-get install -y wget mc libsqlite3-dev build-essential checkinstall libssl-dev

RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_sqlite

RUN pecl install apcu

RUN docker-php-ext-enable apcu
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

SHELL ["/bin/bash", "--login", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN nvm install 18
RUN nvm use 18
RUN npm i -g yarn

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_mod

WORKDIR /var/www/html
