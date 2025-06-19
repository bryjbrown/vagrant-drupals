echo "Beginning installation of composer..." >> /root/build.log

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

echo "Composer installation complete." >> /root/build.log
