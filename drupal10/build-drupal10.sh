echo "Beginning Drupal 10 build" >> /root/build.log

/vagrant/shared/packages.sh
/vagrant/shared/composer.sh

cd /var/www/html
composer create-project drupal-composer/drupal-project:10.x-dev -n drupal10default

sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/drupal10default\/web/" /etc/apache2/sites-available/000-default.conf
service apache2 restart

echo "Drupal 10 build complete." >> /root/build.log
