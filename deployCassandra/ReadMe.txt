Mode d'emploi pour deployer cassandra sur les 3 noeuds du cluster


- Modifier le fichier conf.txt avec les 3 DNS public (en mettant le Master en premier?).

Par exemple : 
ec2-54-237-223-72
ec2-3-83-121-78
ec2-3-84-249-194


- Placer les fichiers suivant dans le répertoire courant :
jsr166e-1.1.0.jar
spark-cassandra-connector_2.11-2.4.0.jar


- Executer la commande ./install_cassandra.sh dans le répertoire courant

- Indiquer dans quel répertoire se trouve la gdeltkey
