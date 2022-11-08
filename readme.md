# Liquibase Demo

## Comparer
### Liqubase VS. Flyway

https://www.baeldung.com/liquibase-vs-flyway#:~:text=Defining%20a%20Change,changes%20to%20different%20database%20types.

https://www.liquibase.com/liquibase-vs-flyway

## Support
Windows, MacOS, Linux and Docker.

### Liquibase Properties


### Docker Command
sudo docker run --rm -v /home/edwin/WorkSpace/SourceCode/github/liquibase-demo:/liquibase/changelog liquibase/liquibase --defaultsFile=/liquibase/changelog/liquibase.docker.properties update

### SQL

### Filename Format

v MajorNumber . MinorNumber . FixNumber _changelog- Desc .sql

e.g. v1.0.0_changelog-desc.sql

### Demo
#### liquibase
- changelog
- classpath
- db.changelogs
- db.chnagelog.xml
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <databaseChangeLog
   xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:pro="http://www.liquibase.org/xml/ns/pro"
   xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
      http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-4.1.xsd
      http://www.liquibase.org/xml/ns/pro 
      http://www.liquibase.org/xml/ns/pro/liquibase-pro-4.1.xsd">  
    <includeAll path="db.changelogs/"/>
    </databaseChangeLog>
    
- liquibase.docker.properties
  ```
  classpath: /liquibase/changelog
  changeLogFile:db.changelog.xml
  url: jdbc:sqlserver://172.19.224.1:1433;encrypt=true;trustServerCertificate=true;databaseName=inpart;
  username: sa
  password: sa123
 - based on change-set
 
 #### Git Hub
 [Repository Address](https://github.com/itrice/liquibase-demo)
 #### Jenkins
  Run in docker.
  ```
  sudo docker run --name jenkins-docker --restart=on-failure --detach --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --publish 8080:8080 --publish 50000:50000 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro jenkins/jenkins