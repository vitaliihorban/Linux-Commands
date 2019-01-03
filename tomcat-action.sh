# action = "start"
# tomcat location: /opt/apache-tomcat-8.5.37/
# tomcat port: 9999
# tomcat roles & users:
# <role rolename="manager-gui"/>
# <role rolename="manager-status"/>
# <role rolename="manager-script"/>
# <role rolename="manager-jmx"/>
# <role rolename="tomcat"/>
# <user username="zavada" password="zavada" roles="tomcat,manager-jmx,manager-gui,manager-status,manager-script"/>

echo "start, stop, debug, run"

if sudo lsof -Pi :9999 -sTCP:LISTEN -t >/dev/null ; 
then
    echo "Current Tomcat status: running"
else
    echo "Current Tomcat status: not running"
fi

read -p "Enter action: " action

if [ $action == "exit" ] 
then 
    exit
fi

sudo /opt/apache-tomcat-8.5.37/bin/catalina.sh $action
