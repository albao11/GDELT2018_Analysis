filename=./conf.txt
IFS=$'\n'
KEY_PATH=./
AWS_IF_REF=eth0
if [ ! -f $KEY_PATH/gdeltKeyPair.pem ]; then
   read -p "Donner le répertoire du fichier gdeltKeyPair.perm ? " -r
   KEY_PATH=$REPLY
   echo $KEY_PATH
fi
declare -i i=0
for next in `cat $filename`; do
    ssh -i $KEY_PATH/gdeltKeyPair.pem hadoop@$next.compute-1.amazonaws.com " //sbin/ifconfig $AWS_IF_REF;">./log.txt
    IP=`cat log.txt | grep 'inet ' | cut -d: -f2 | awk '{ print $1}'`
    echo "IP :$IP"
    echo "next :$next"
    if [ $i -eq 0 ]; then
        IPS=$IP
        echo "IPS :$IPS"
    elif [ $i -eq 1 ]; then
        IPS="$IPS,$IP"
    fi
    rm sshcommands$i.sh
    cat ./sshcommands.sh >> sshcommands$i.sh
    sed -i.bak "s/NEXT=.*/NEXT=$next/" ./sshcommands$i.sh
    sed -i.bak "s/MY_IP=.*/MY_IP=$IP/" ./sshcommands$i.sh
    i=$i+1
done

IPS="\"$IPS\""
echo "etape 1.1 :$IPS"

echo "etape 2"

i=0
for next in `cat $filename`; do
    sed -i.bak "s/TEST1=.*/TEST1=$IPS/" ./sshcommands$i.sh
    i=$i+1
done

MASTER=true
i=0
for next in `cat $filename`; do
    echo "déploiement sur "$next
    scp -i $KEY_PATH/gdeltKeyPair.pem ./spark-cassandra-connector_2.11-2.4.0.jar hadoop@$next.compute-1.amazonaws.com:/home/hadoop
    scp -i $KEY_PATH/gdeltKeyPair.pem ./jsr166e-1.1.0.jar hadoop@$next.compute-1.amazonaws.com:/home/hadoop
    echo "c'est parti pour le ssh"
    ssh -i $KEY_PATH/gdeltKeyPair.pem hadoop@$next.compute-1.amazonaws.com "$(< ./sshcommands$i.sh)" &
    MASTER=false
    i=$i+1
done

