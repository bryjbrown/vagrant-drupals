echo "Beginning Drupal 11 build..." >> /root/build.log

/vagrant/shared/packages.sh
/vagrant/shared/composer.sh

cd /var/www/html
composer create-project drupal-composer/drupal-project:11.x-dev -n drupal11default

sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/drupal11default\/web/" /etc/apache2/sites-available/000-default.conf
service apache2 restart

echo "Drupal 11 build complete." >> /root/build.log
