#!/bin/bash

#add user and password to tomcat-users.xml
cp -f /etc/tomcat9/tomcat-users.xml.mod /etc/tomcat9/tomcat-users.xml
sed -i "s|TOM_USER|$TOM_USER|g" /etc/tomcat9/tomcat-users.xml
sed -i "s|TOM_PASS|$TOM_PASS|g" /etc/tomcat9/tomcat-users.xml

#move ROOT folder to webapps
if [ -d "/tmp/ROOT" ]; then
   mv /tmp/ROOT /var/lib/tomcat9/webapps/ROOT
fi

#move and rename RemoteTM.war into folder webapps
if [ -f "/tmp/RemoteTM.war" ]; then
   mv /tmp/RemoteTM.war /var/lib/tomcat9/webapps/RemoteTM.war
fi

#Remove move and rename ROOT and RemoteTM.war command
sed '8,20d' /usr/local/bin/docker-entrypoint.sh

#start tomcat
exec /usr/share/tomcat9/bin/catalina.sh run
