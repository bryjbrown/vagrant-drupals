echo "Beginning Drupal 11 build" >> /root/build-drupal11.log

apt update -y
apt -y install \
  zip \
  unzip \
  jq \
  curl \
  gpg \
  gnupg2 \
  software-properties-common \
  ca-certificates \
  apt-transport-https \
  lsb-release \
  apache2 \
  mysql-server \
  mysql-client \

add-apt-repository -y ppa:ondrej/php
apt update -y
apt -y install \
  php8.4 \
  php8.4-mysql \
  php8.4-curl \
  php8.4-dev \
  php8.4-fpm \
  php8.4-soap \
  php8.4-zip \
  php8.4-intl \
  php8.4-gd \
  php8.4-mbstring \
  libapache2-mod-php8.4

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
composer create-project drupal-composer/drupal-project:11.x-dev -n drupal11default

echo "Drupal 11 build complete." >> /root/build-drupal11.log
