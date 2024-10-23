# Utiliser une image de base qui contient PHP
FROM php:8.1-fpm

# Installer Nginx
RUN apt-get update && apt-get install -y nginx

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copier le code source dans le conteneur
COPY . /var/www/html/

# Copier le fichier de configuration Nginx
COPY nginx.conf /etc/nginx/sites-available/default

# Définir les permissions
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80

# Commande pour démarrer Nginx et PHP
CMD service nginx start && php-fpm

