FROM registry.sikapp.ir/shevi/php:8-fpm

# Install Xdebug 3 with Pecl
# Enable it using docker-php-ext-enable. This command saves us the hassle of writing a custom shell script.
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

RUN apt-get update \
  && apt-get install -y git 

COPY ./conf.d/*.ini /usr/local/etc/php/conf.d/

CMD [ "php-fpm" ]