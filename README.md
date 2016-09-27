Site de la LP-DW [![Build Status](https://travis-ci.org/lpdw/lpdw2.0.svg)](https://travis-ci.org/lpdw/lpdw2.0)
================

Le site de la LP-DW présente la formation “Licence Professionelle Developpeur Web”, il permet également de pouvoir candidater, de s’informer et de se tenir au courant des différentes actualités.

> **Changelog** 

> **[2.4](https://github.com/lpdw/lpdw2.0/releases/tag/v2.4)** : Nouvelles fonctionnalitées, refactoring et correctifs :
> - Annuaire d'entreprises avec offres d'emploi, stage... ([#28](https://github.com/lpdw/lpdw2.0/pull/28))
> - Annuaire des étudiants ([#31](https://github.com/lpdw/lpdw2.0/pull/31))
> - Section Bon Plans ([#32](https://github.com/lpdw/lpdw2.0/pull/32))
> - Refactoring, fonctionnalités backoffice ([#6](https://github.com/lpdw/lpdw2.0/pull/6) [#18](https://github.com/lpdw/lpdw2.0/pull/18) [#19](https://github.com/lpdw/lpdw2.0/pull/19) [#29](https://github.com/lpdw/lpdw2.0/pull/29))
> - Nombreux correctifs

> **[2.0](https://github.com/lpdw/lpdw2.0/releases/tag/v2.0)** : workflow  
> **1.0** : website


----------


###Installation
L’installation de MySQL et HomeBrew sur Mac est indispensable.
test
**1)** Il faut préalablement **[forker](https://help.github.com/articles/fork-a-repo/#fork-an-example-repository) le dépôt sur ton compte**.

**2) Cloner ton dépôt** préalablement forké :

    git clone https://github.com/TON_PSEUDO/lpdw2.0.git 

**3) Ajouter un Remote “upstream”** afin de pouvoir synchroniser l’application avec le dépôt central :

    git remote add upstream https://github.com/lpdw/lpdw2.0 

**4) Installer toutes les dépendances** :

    bundle install

    #Pour l'envoi de mail en local
    gem install mailcatcher

**5) Faire la migration** de la base de données :
   
	# Créer la base de données et faire les migrations :
    rake db:create db:migrate
    
	#Peupler la base de données avec des exemples (fichier db/seeds.rb)
    rake db:seed


----------


###Démarrage de l’application
    # Lancer le serveur
    rails server
###Mettre à jour mon application

    # Se mettre sur la branche development
    git checkout development 
    
    # Synchronisation du code depuis le dépôt central
    git fetch upstream 
    
    # Rebase des commits
    git rebase upstream/development

    # Push des mises à jour sur le fork
    git push origin development


###Tu as découvert un bug ?

**Tu as découvert un bug sur le site, dans le code ou une erreur dans la documentation ?**
Tu peux nous aider en [soumettant une Issue](https://github.com/lpdw/lpdw2.0/issues) sur le dépôt avec le tag “bug”. Ou encore mieux, tu peux soumettre une Pull request avec un correctif.

**Tu veux une fonctionnalité et tu sais pas (encore) coder ?**
Tu peux proposer une nouvelle fonctionnalité en ajoutant une Issue sur le dépôt avec le tag “feature”. Et comme ton idée est super géniale, un développeur va vite s'empresser de la développer.

**Tu veux contribuer ?**
Tout le monde sans exception doit suivre ce processus du fichier [CONTRIBUTION.md](https://github.com/lpdw/lpdw2.0/blob/development/CONTRIBUTION.md). Les excuses du genre : “Je fais partie de la promo X” ne sont pas valables.


----------


Administrateurs (2015/2016)

Yassin AGHANI [@aghaniyassin](https://github.com/aghaniyassin)

Enguerran POULAIN [@theblackhole](https://github.com/theblackhole)

