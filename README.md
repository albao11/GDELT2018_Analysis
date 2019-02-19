Contributeurs: Matthieu Roussel, Thierry Golder, Alba Ordoñez, Joël Géhin, Pierre Gelade, Guillaume Soufflet

![Gdelt](https://github.com/albao11/GDELT2018_Analysis/blob/master/GDELTProjectmainpage.png)
# Analyse de l’année 2018 via la base de données GDELT

## Contexte
L’objectif du projet était de concevoir un système permettant d’analyser l’evolution des relations entre les differents pays, en étudiant le ton des mentions (positives/negatives) dans les articles médias de chaque pays.

L'exercice auquel nous devions répondre est détaillé à l'adresse suivante :
http://andreiarion.github.io/projet2018.html

Nous devions être capable de répondre aux 4 requêtes suivantes:
- **Requete 1** : afficher le nombre d’articles/évènements qu’il y a eu pour chaque triplet (jour, pays de l’évènement, langue de l’article).
- **Requete 2** : pour un acteur donné en paramètre, afficher les événements (valeurs de la table events) qui y font référence (dans les derniers 6 mois).
- **Requete 3** : trouver les sujets (acteurs) qui ont eu le plus d’articles positifs/negatifs pour chaque triplet (mois, pays, langue de l’article).
- **Requete 4** : trouver quels sont les acteurs/pays/organisations qui divisent le plus (par exemple ont eu une perception positive dans une partie du globe et une perception negative dans le rest du monde). Permettez une agrégation par jour/mois/annee.

## Architecture proposée

![Architecture](https://github.com/albao11/GDELT2018_Analysis/blob/master/Architecture.PNG)

Pour stocker les données, nous avons choisi Cassandra. Cassandra est une solution offrant une capacité de réponse rapide quand il s'agit de manipuler un volume important de données. 
Grâce à sa représentation en colonnes, cette base de données non relationnelle permet d'avoir des schémas de données flexibles, 
même s'il est essentiel de penser à comment modéliser les données en amont. Son architecture lui permet d'évoluer dans un environnement distribué. 

## Chargement des fichiers .zip dans S3

Les fichiers Gdelt events et mentions de l'année 2018 ont préalablement été chargés sur S3.

## Scripts de déploiement de Cassandra

Ce script permet d'installer Cassandra sur les trois noeuds et de le connecter à Spark.

[Script de deploiement de Cassandra](https://github.com/albao11/GDELT2018_Analysis/blob/master/deployCassandra/install_cassandra.sh) (Shell script)

## Traitement des fichiers et export dans Cassandra

[Requete 1 et 3](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt-ETLChargCassandraReq1et3.json) (Notebook Zeppelin, format json)

[Requete 2 et 4](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt-ETLChargCassandraRequete2et4.json) (Notebook Zeppelin, format json)

## Présentation du projet

[Présentation](https://github.com/albao11/GDELT2018_Analysis/blob/master/Projet_NoSQL_presentation_vFINAL.pptx) (format pptx)

## Demonstration des requetes (utilisation d'angular)

[Requete 1](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt_Requete1.json) (Notebook Zeppelin, format json)

[Requete 2 et 5](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt%20-%20Requ%C3%AAte2.json) (Notebook Zeppelin, format json)

[Requete 3](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt_Requete3.json) (Notebook Zeppelin, format json)

[Requete 4](https://github.com/albao11/GDELT2018_Analysis/blob/master/Gdelt%20-%20Requ%C3%AAte4%20.json) (Notebook Zeppelin, format json)

![Req2](https://github.com/albao11/GDELT2018_Analysis/blob/master/Carte_Requete2.png)

