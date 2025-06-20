mysql --execute="create database drupal;"
mysql --execute="create user 'drupal'@'localhost' IDENTIFIED BY 'drupal';"
mysql --execute="grant all privileges on drupal.* to 'drupal'@'localhost';"
mysql --execute="flush privileges;"
