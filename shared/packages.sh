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

echo "OS package installation complete." >> /root/build.log
