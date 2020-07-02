#!/bin/sh

if [ ! -f "/srv/backup/TMX" ]; then
   mkdir -p /srv/backup/TMX
fi

chown tomcat:tomcat /srv/backup/TMX

sudo -u tomcat sh -c "cd /srv/files/backup && ./BackupServer.sh localhost 8080 ${BACK_USER} ${BACK_PASSWORD} /srv/backup/TMX"
