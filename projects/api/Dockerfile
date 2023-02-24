FROM php:7.3-apache

RUN apt-get update && apt-get install -y \
    libzip-dev
RUN apt-get upgrade -y

RUN apt-get install -y unzip \
#    php7.3.xdebug \
    openssl \
    zip \
    curl \
    git \
    apt-utils \
    libcurl4-gnutls-dev \
    autoconf \
    build-essential \
    gcc \
    libjansson-dev \
    make \
    software-properties-common \
    wget \
    zlib1g-dev \
    libicu-dev \
    libpng-dev \
    libxml2-dev \
    g++

# install base packages, supervisor, cron, logrotate
RUN docker-php-ext-configure intl
RUN docker-php-ext-install curl \
    intl \
    gd \
	mysqli \
	gettext \
	soap \
	zip \
	pcntl \
    xml

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-enable curl \
    intl \
    gd \
	mysqli \
	gettext \
	soap \
	zip \
	pdo_mysql \
	pcntl \
    xml

RUN apt-get update && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

# Install imagick
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

# Install Psr
RUN git clone https://github.com/jbboehr/php-psr.git
RUN cd php-psr && phpize && ./configure && make && make test && make install

# Configure Phalcon
RUN git clone https://github.com/phalcon/cphalcon
RUN cd cphalcon && git checkout tags/v4.0.6 ./ && cd build && ./install

RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN a2enmod rewrite headers

ARG APCU_VERSION=5.1.11

#INSTALL APCU
RUN pecl install apcu-${APCU_VERSION} && docker-php-ext-enable apcu
RUN chmod 777 -R /tmp && chmod o+t -R /tmp
#APCU

#Install Redis
RUN pecl install redis \
    && docker-php-ext-enable redis
