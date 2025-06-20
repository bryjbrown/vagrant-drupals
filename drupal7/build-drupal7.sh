echo "Beginning Drupal 7 build..." >> /root/build.log

/vagrant/shared/packages.sh
/vagrant/shared/php81.sh
/vagrant/shared/composer.sh
/vagrant/shared/mysql.sh

cd /var/www/html
composer create-project drupal-composer/drupal-project:7.x-dev -n drupal7default

a2enmod rewrite
cd /etc/apache2
rm apache2.conf
cp /vagrant/drupal7/drupal7.apache2.conf /etc/apache2/apache2.conf
sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/drupal7default\/web/" /etc/apache2/sites-available/000-default.conf
service apache2 restart

rm /var/www/html/drupal7default/web/sites/default/settings.php
cp /vagrant/drupal7/drupal7.settings.php /var/www/html/drupal7default/web/sites/default/settings.php

composer global require drush/drush:8.x
cd /var/www/html/drupal7default/
/root/.config/composer/vendor/bin/drush -y site-install \
  --account-pass="admin" \
  --site-name="Drupal 7 Default"

echo "Drupal 7 build complete." >> /root/build.log
