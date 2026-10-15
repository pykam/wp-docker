FROM wordpress:latest

RUN echo "Timeout 300" >> /etc/apache2/apache2.conf
# Install and enable Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug
# Install WP-CLI
RUN curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp
