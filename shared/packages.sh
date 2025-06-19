echo "Installing OS packages..." >> /root/build.log

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

echo "OS package installation complete." >> /root/build.log
