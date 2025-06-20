echo "Installing PHP v8.4..." >> /root/build.log

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

echo "PHP v8.4 installed." >> /root/build.log
