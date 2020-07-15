# RemoteTM
Tomcat server running [RemoteTM Web Server](https://www.maxprograms.com/products/remotetm.html).

### Installed software:
* Ubuntu 20.04
* OpenJDK (11.0.7)
* Tomcat (9.0.31-1)
* RemoteTM Web Server (4.0-6)
  * Database Backup Scripts

## User Notes
Tomcat management console has been defaulted to admin:admin. If you would like to use a different username and/or password change the following:
* TOM_USER="***admin***"
* TOM_PASS="***admin***"

Backup scripts need a username and password. For the backup script to work change sysadmin:nopassword to the correct admin account:
* BACK_USER="***sysadmin***"
* BACK_PASSWORD="***nopassword***"

## Create Docker Image
```
docker create \
  --name=remotetm \
  -e BACK_USER="sysadmin" \
  -e BACK_PASSWORD="nopassword" \
  -e TOM_USER="admin" \
  -e TOM_PASS="admin" \
  -e TZ=America/Los_Angeles \
  -p 8080:8080 \
  -v /path/to/webapps:/srv/webapps \
  -v /path/to/backup:/srv/backup \
  -v /path/to/logs:/srv/logs \
  -v /path/to/opt:/opt \
  --restart unless-stopped \
  vlombardino/remotetm
```

## Web Access
* Luanch RemoteTM by going to the following link http://localhost:8080/RemoteTM
* Enter your license or Request a trial key. 
* Login with these default credentials: User Name: ***sysadmin*** Password: ***secData***

## Backup
To create a backup of the data run the script RemoteTM-backup.sh. It will create a TMX folder and export each memory in a tmx file organized by date. To run the RemoteTM-backup.sh command you can us the following:
```
docker exec -it CONTAINERNAME RemoteTM-backup

```
