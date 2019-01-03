# Jenkins WAR location: /opt/Jenkins/jenkins.war
# Jenkins PORT: 9998

if sudo lsof -Pi :9998 -sTCP:LISTEN -t >/dev/null ; 
then
    echo "Current Jenkins status: running"
else
    echo "Current Jenkins status: not running"
fi

echo "Command: start or stop"
read -p "Enter action: " action

if [ $action == "stop" ] 
then 
    sudo kill `sudo lsof -t -i:9998`
    exit
elif [ $action == "start" ] 
then
    sudo java -jar /opt/Jenkins/jenkins.war --enable-future-java --httpPort=9998 &
else
   echo "Unknown action. Exit"
   exit
fi
