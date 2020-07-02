# RemoteTM
Tomcat server running [RemoteTM Web Server](https://www.maxprograms.com/products/remotetm.html).

### Installed software:
* Ubuntu 20.04
* OpenJDK (11.0.7)
* Tomcat (9.0.31-1)
* RemoteTM Web Server (4.0-6
  * Database Backup Scripts

## Notes
Tomcat management console has been defaulted to admin:admin. If you would like to use a different username and/or password change the following:
* TOM_USER="admin"
* TOM_PASS="admin"

Backup scripts need a username and password. For the backup script to work change sysadmin:nopassword to the correct admin account:
* BACK_USER="sysadmin"
* BACK_PASSWORD="nopassword"

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
