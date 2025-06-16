echo "Beginning Drupal 7 build" >> /root/build-drupal7.log

apt update -y
apt -y install \
  zip \
  unzip \
  jq \
  apache2 \
  mysql-server \
  mysql-client \
  php \
  php-mysql \
  php-cli \
  php-common \
  php-curl \
  php-dev \
  php-fpm \
  php-json \
  php-soap \
  php-zip \
  php-date \
  php-intl \
  php-xml \
  php-gd \
  php-curl \
  php-mbstring

echo "COMPOSER_ALLOW_SUPERUSER=1" >> /etc/environment
source /etc/environment
cd /root
curl -O https://getcomposer.org/download/2.6.6/composer.phar
cp composer.phar /usr/local/bin/composer
rm /root/composer.phar*
chown root:root /usr/local/bin/composer
chmod 0755 /usr/local/bin/composer
HOME=/root /usr/local/bin/composer global config --no-plugins allow-plugins.zaporylie/composer-drupal-optimizations true
HOME=/root /usr/local/bin/composer --no-interaction global require zaporylie/composer-drupal-optimizations
mkdir -p /root/.config/composer

cd /var/www/html
composer create-project drupal-composer/drupal-project:7.x-dev -n drupal7default

echo "Drupal 7 build complete." >> /root/build-drupal7.log
