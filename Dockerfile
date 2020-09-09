FROM php:7.4-alpine

COPY bin/docker-php-ext-get /usr/local/bin/

RUN apk add gmp gmp-dev && \
  docker-php-source extract && \
  docker-php-ext-enable opcache && \
  docker-php-ext-get igbinary 3.0.1 && \
  docker-php-ext-install igbinary && \
  docker-php-ext-get redis 5.3.1 && \
  docker-php-ext-configure redis --enable-redis-igbinary && \
  docker-php-ext-install redis && \
  docker-php-ext-install gmp && \
  docker-php-source delete && \
  apk del gmp-dev