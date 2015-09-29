lpdw2.0
=======

Refonte du site de la Licence Professionelle 2.0



### Initalisation du projet

    git clone https://github.com/lpdw/lpdw2.0
    cd lpdw2.0
    bundle install

### Initalisation de la base de données:

    mysql.server start
    rake db:create db:migrate
    rake db:seed

### Démarrage de l’application:

    rails server

----------

Version 2.0 : workflow
Version 1.0 : website
