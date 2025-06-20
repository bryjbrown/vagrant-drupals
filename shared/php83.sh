echo "Installing PHP v8.3..." >> /root/build.log

add-apt-repository -y ppa:ondrej/php
apt update -y
apt -y install \
  php8.3 \
  php8.3-mysql \
  php8.3-curl \
  php8.3-dev \
  php8.3-fpm \
  php8.3-soap \
  php8.3-zip \
  php8.3-intl \
  php8.3-gd \
  php8.3-mbstring \
  php8.3-dom \
  libapache2-mod-php8.3

echo "PHP v8.3 installed." >> /root/build.log
