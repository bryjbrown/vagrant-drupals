echo "Beginning Drupal 11 build" >> /root/build.log

/vagrant/shared/packages.sh
/vagrant/shared/php83.sh
/vagrant/shared/composer.sh
/vagrant/shared/mysql.sh

cd /var/www/html
composer create-project drupal-composer/drupal-project:11.x-dev -n drupal11default

a2enmod rewrite
cd /etc/apache2
rm apache2.conf
cp /vagrant/drupal11/drupal11.apache2.conf /etc/apache2/apache2.conf
sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/drupal11default\/web/" /etc/apache2/sites-available/000-default.conf
service apache2 restart

rm /var/www/html/drupal11default/web/sites/default/settings.php
cp /vagrant/drupal11/drupal11.settings.php /var/www/html/drupal11default/web/sites/default/settings.php
chmod -R 777 /var/www/html/drupal11default

/var/www/html/drupal11default/vendor/bin/drush site:install -y \
  --account-pass="admin" \
  --site-name="Drupal 11 Default"

echo "Drupal 11 build complete." >> /root/build.log
