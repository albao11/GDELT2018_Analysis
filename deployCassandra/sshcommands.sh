#!/bin/bash
echo "je suis dans la machine virtuelle"
declare -i i=1

MASTER=false
NEXT=ec2-18-208-202-166
TEST1=""""172.31.11.33 172.31.9.155 172.31.14.90 "172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 "172.31.11.33 172.31.9.155 172.31.14.90 "172.31.11.33 172.31.9.155 172.31.14.90 "172.31.11.33 172.31.9.155 172.31.14.90 172.31.11.33 172.31.9.155 172.31.14.90 Bcast Bcast Bcast 
MY_IP=coucou

wget https://archive.apache.org/dist/cassandra/3.11.2/apache-cassandra-3.11.2-bin.tar.gz 
echo "Téléchargement cassandra terminé"
tar -xzvf apache-cassandra-3.11.2-bin.tar.gz; 
rm -rf apache-cassandra-3.11.2-bin.tar.gz
echo "Installation cassandra terminée"
sed -i.bak "s/cluster_name:.*/cluster_name: 'gdelt_cluster' /" ./apache-cassandra-3.11.2/conf/cassandra.yaml
sed -i.bak "s/listen_address:.*/listen_address: $MY_IP /" ./apache-cassandra-3.11.2/conf/cassandra.yaml
sed -i.bak "s/rpc_address:.*/rpc_address: $MY_IP /" ./apache-cassandra-3.11.2/conf/cassandra.yaml

#on prend les arguments à partir du 3ème
IP_ADDRESS=""
for el in $TEST1; do
    if [ $i -lt 3 ] ; then
        IP_ADDRESS=$IP_ADDRESS","el
    fi
    i=$i+1
done

sed -i.bak "s/seeds:.*/seeds: \"$TEST1\" /" ./apache-cassandra-3.11.2/conf/cassandra.yaml
sudo cp spark-cassandra-connector_2.11-2.4.0.jar /usr/lib/spark/jars/ 
echo "Téléchargement et installation du connecteur terminés"
sudo cp jsr166e-1.1.0.jar /usr/lib/spark/jars/
echo "Téléchargement et installation de jsr166 terminés"

#actions a faire uniquement sur le master 
if $MASTER; then
    sudo stop zeppelin 
    sudo chown root:root /usr/lib/zeppelin/conf/zeppelin-env.sh
    sudo chmod 777 /usr/lib/zeppelin/conf/zeppelin-env.sh
    sudo echo "export SPARK_SUBMIT_OPTIONS= --jars/usr/lib/spark/jars/spark-cassandra-connector_2.11-2.4.0.jar,/usr/lib/spark/jars/jsr166e-1.1.0.jar">> /usr/lib/zeppelin/conf/zeppelin-env.sh 
    sudo chmod 744 /usr/lib/zeppelin/conf/zeppelin-env.sh
    sudo chown -R zeppelin:zeppelin /usr/lib/zeppelin/conf/
    sudo start zeppelin 
    echo "fin des actions spécifiques au master"
fi

