FROM php:8.2-apache

# Installation des extensions MySQL nécessaires à votre BD
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Activation de la réécriture d'URL d'Apache (pour les .htaccess)
RUN a2enmod rewrite

# Copie des fichiers de votre projet dans le dossier web d'Apache
COPY . /var/www/html/

EXPOSE 80
