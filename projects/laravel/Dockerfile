FROM php:8.2.3-apache

RUN apt-get update && apt-get install -y nano \
    libzip-dev

RUN apt-get upgrade -y

RUN apt-get install -y unzip \
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
    libpq-dev \
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
	pdo_mysql \
    xml

RUN docker-php-ext-configure pgsql \
    && docker-php-ext-install pgsql pdo_pgsql

RUN docker-php-ext-enable curl \
    intl \
    gd \
	mysqli \
	gettext \
	soap \
	zip \
	pdo_mysql \
	pdo_pgsql \
	pgsql \
	pcntl \
    xml

RUN apt-get update && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt \
    && docker-php-ext-enable mcrypt

# Install imagick
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick

# Install Psr
RUN git clone https://github.com/jbboehr/php-psr.git
RUN cd php-psr && phpize && ./configure && make && make test && make install

RUN curl -s https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN a2enmod rewrite headers

#INSTALL APCU
RUN pecl install apcu && docker-php-ext-enable apcu
RUN chmod 777 -R /tmp && chmod o+t -R /tmp
#APCU
