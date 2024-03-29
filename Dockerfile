FROM php:7.4.11-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      git \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '795f976fe0ebd8b75f26a6dd68f78fd3453ce79f32ecb33e7fd087d39bfeb978342fb73ac986cd4f54edd0dc902601dc') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/sbin --filename=composer && \
    php -r "unlink('composer-setup.php');"

RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony/bin/symfony /usr/local/sbin/symfony

RUN docker-php-ext-install pdo_mysql

WORKDIR /work/app
