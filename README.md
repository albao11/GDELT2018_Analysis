Contributeurs: Matthieu Roussel, Thierry Golder, Alba Ordoñez, Joël Géhin, Pierre Gelade, Guillaume Soufflet

![Gdelt](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/GDELTProjectmainpage.png)
# Gdelt2018
## Analyse de l’année 2018 via la base de données GDELT

L’objectif du projet est de concevoir un système qui permet d’analyser l’evolution des relations entre les differents pays, en étudiant le ton des mentions (positives/negatives) dans les articles médias de chaque pays.

L'exercice auquel nous devions répondre est détaillé à l'adresse suivante :
http://andreiarion.github.io/projet2018.html

## Architecture proposée

![Architecture](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Architecture.PNG)

## Chargement des fichiers .zip dans S3

Les fichiers Gdelt events et mentions de l'année 2018 ont préalablement été chargés sur S3.

## Scripts de déploiement de Cassandra

Ce script permet d'installer Cassandra sur les trois noeuds et de le connecter à Spark.

[Script de deploiement de Cassandra](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/deployCassandra/install_cassandra.sh)

## Traitement des fichiers et export dans Cassandra

[Requete 1 et 3](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt-ETLChargCassandraReq1et3.json)

[Requete 2 et 4](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt-ETLChargCassandraRequete2et4.json)

## Présentation du projet

[Présentation](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Projet_NoSQL_presentation_vFINAL.pptx)

## Demonstration des requetes (utilisation d'angular)

[Requete 1](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt_Requete1.json)

[Requete 2 et 5](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt%20-%20Requ%C3%AAte2.json)

[Requete 3](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt_Requete3.json)

[Requete 4](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Gdelt%20-%20Requ%C3%AAte4%20.json)

![Req2](https://github.com/MSBigData2019/Gdelt2018-GGGROS/blob/master/Carte_Requete2.png)

