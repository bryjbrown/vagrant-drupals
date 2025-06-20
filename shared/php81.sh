echo "Installing PHP v8.1..." >> /root/build.log

apt update -y
apt -y install \
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

echo "PHP v8.1 installed." >> /root/build.log
