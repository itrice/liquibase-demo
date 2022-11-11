<!--Style-->
<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Liquibase

## Comparer
### Liqubase VS. Flyway

https://www.baeldung.com/liquibase-vs-flyway#:~:text=Defining%20a%20Change,changes%20to%20different%20database%20types.

https://www.liquibase.com/liquibase-vs-flyway

## Support
OS:  Windows, MacOS, Linux and Docker.

File: SQL, JSON, YAML, XML

## Concepts & Feature
### Changelogs

### ChangeSet

### Properties
 - stauts
 - update
 - add

### Tracking Tables
https://docs.liquibase.com/concepts/tracking-tables/tracking-tables.html

### Docker Command
``` 
[linux] docker run --rm -v /home/edwin/WorkSpace/SourceCode/github/liquibase-demo:/liquibase/changelog liquibase/liquibase --defaultsFile=/liquibase/changelog/liquibase.properties db-doc changelogDocs update

[windows] docker run --rm -v C:\Users\Edwin\Documents\01WorkingSpace\SourceCode\Edwin\liquibase-demo:/liquibase/changelog liquibase/liquibase --defaultsFile=/liquibase/changelog/liquibase.properties db-doc changelogDocs update
```

#### SQL
<details>
  <summary>Click me</summary>

```
--liquibase formatted sql

--changeset nvoxland:1
create table test1 (  
    id int primary key,
    name varchar(255)  
);  
--rollback drop table test1; 

--changeset nvoxland:2 
insert into test1 (id, name) values (1, ‘name 1′);
insert into test1 (id,  name) values (2, ‘name 2′);  

--changeset nvoxland:3 dbms:oracle
create sequence seq_test;
```

</details>

#### XML

<details>
  <summary>Click me</summary>
  
```xml
<?xml version="1.0" encoding="UTF-8"?>	
<databaseChangeLog
	xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext"
	xmlns:pro="http://www.liquibase.org/xml/ns/pro"
	xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
		http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-latest.xsd
		http://www.liquibase.org/xml/ns/dbchangelog-ext http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd
		http://www.liquibase.org/xml/ns/pro http://www.liquibase.org/xml/ns/pro/liquibase-pro-latest.xsd">
    <preConditions>  
        <runningAs  username="liquibase"/>  
    </preConditions>  

    <changeSet  id="1"  author="nvoxland">  
        <createTable  tableName="person">  
            <column  name="id"  type="int"  autoIncrement="true">  
                <constraints  primaryKey="true"  nullable="false"/>  
            </column>  
            <column  name="firstname"  type="varchar(50)"/>  
            <column  name="lastname"  type="varchar(50)">  
                <constraints  nullable="false"/>  
            </column>  
            <column  name="state"  type="char(2)"/>  
        </createTable>  
    </changeSet>  

    <changeSet  id="2"  author="nvoxland">  
        <addColumn  tableName="person">  
            <column  name="username"  type="varchar(8)"/>  
        </addColumn>  
    </changeSet>  
    <changeSet  id="3"  author="nvoxland">  
        <addLookupTable  
            existingTableName="person"  existingColumnName="state"  
            newTableName="state"  newColumnName="id"  newColumnDataType="char(2)"/>  
    </changeSet>
</databaseChangeLog>
```
</details>

#### JSON
<details>
  <summary>Click me</summary>

```json
        {
            "databaseChangeLog": [
              {
                "preConditions": [
                  {
                    "runningAs": {
                      "username": "liquibase"
                    }
                  }
                ]
              },
              {
                "changeSet": {
                  "id": "1",
                  "author": "nvoxland",
                  "changes": [
                    {
                      "createTable": {
                        "tableName": "person",
                        "columns": [
                          {
                            "column": {
                              "name": "id",
                              "type": "int",
                              "autoIncrement": true,
                              "constraints": {
                                "primaryKey": true,
                                "nullable": false
                              },
                              
                            }
                          },
                          {
                            "column": {
                              "name": "firstname",
                              "type": "varchar(50)"
                            }
                          },
                          {
                            "column": {
                              "name": "lastname",
                              "type": "varchar(50)",
                              "constraints": {
                                "nullable": false
                              },
                              
                            }
                          },
                          {
                            "column": {
                              "name": "state",
                              "type": "char(2)"
                            }
                          }
                        ]
                      }
                    }
                  ]
                }
              },
              {
                "changeSet": {
                  "id": "2",
                  "author": "nvoxland",
                  "changes": [
                    {
                      "addColumn": {
                        "tableName": "person",
                        "columns": [
                          {
                            "column": {
                              "name": "username",
                              "type": "varchar(8)"
                            }
                          }
                        ]
                      }
                    }
                  ]
                }
              },
              {
                "changeSet": {
                  "id": "3",
                  "author": "nvoxland",
                  "changes": [
                    {
                      "addLookupTable": {
                        "existingTableName": "person",
                        "existingColumnName": "state",
                        "newTableName": "state",
                        "newColumnName": "id",
                        "newColumnDataType": "char(2)",
                        
                      }
                    }
                  ]
                }
              }
            ]
        }
```
</details>

#### YAML
<details>
  <summary>Click me</summary>

```yaml
databaseChangeLog:  
  -  preConditions:  
    -  runningAs:  
        username:  liquibase  

  -  changeSet:  
      id:  1  
      author:  nvoxland  
      changes:  
        -  createTable:  
            tableName:  person  
            columns:  
              -  column:  
                  name:  id  
                  type:  int  
                  autoIncrement:  true  
                  constraints:  
                    primaryKey:  true  
                    nullable:  false  
              -  column:  
                  name:  firstname  
                  type:  varchar(50)  
              -  column:  
                  name:  lastname  
                  type:  varchar(50)  
                  constraints:  
                    nullable:  false  
              -  column:  
                  name:  state  
                  type:  char(2)  

  -  changeSet:  
      id:  2  
      author:  nvoxland  
      changes:  
        -  addColumn:  
            tableName:  person  
            columns:  
              -  column:  
                  name:  username  
                  type:  varchar(8)  

  -  changeSet:  
      id:  3  
      author:  nvoxland  
      changes:  
        -  addLookupTable:  
            existingTableName:  person  
            existingColumnName:  state  
            newTableName:  state  
            newColumnName:  id  
            newColumnDataType:  char(2)
```
</details>

#### [Other Formats]("https://docs.liquibase.com/concepts/changelogs/other-formats.html")

### Filename Format

v MajorNumber . MinorNumber . FixNumber _changelog- Desc .sql

e.g. v1.0.0_changelog-desc.sql

## Demo
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
    <include path="db.changelogs/v1.0.0_changelog-root.sql"/>
    <include path="v1.0.1_changelog-employee.sql"/>
    <!-- <includeAll path="db.changelogs/"/> -->
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
  sudo docker run -u 0 --privileged --name jenkins-docker --restart=on-failure --detach --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --publish 8080:8080 --publish 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro jenkins/jenkins

  docker run -u 0 --privileged --name jenkins -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

  sudo docker run --privileged  --name jenkins -p 8080:8080 -p 50000:50000  -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/bin/docker  -v /var/jenkins_home:/var/jenkins_hom  -v /usr/lib64/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7 -d jenkins/jenkins

  #### Search log
  docker logs --tail 50 --follow --timestamps jenkins
```
  #### **Data 1**
  | Index | Changes                          | File Name                         |          |
  | :---: | -------------------------------- | --------------------------------- | -------- |
  |   1   | Create:<ul><li>Table A</li></ul> | v1.0.0_changelog-Add-table-A.sql  | &#x2705; |
  |   2   | Create:<ul><li>Table B</li></ul> | v1.1.0_changelog-Add-table-B.sql  | &#x2705; |
  |   3   | Create:<ul><li>Table C</li></ul> | v1.2.0_changelog-Add-table-C.sql  | &#x2705; |
  |   4   | PK-FK                            | v1.2.1_FK_table_A_and_table_B.sql | &#x2705; |
  |   5   | Seeds Data                       | v1.2.2_changelog-Seeds.sql        | &#x2705; |

  #### **Data 2**
  | Index | Changes                          | File Name                         |          |
  | :---: | -------------------------------- | --------------------------------- | -------- |
  |   1   | Create:<ul><li>Table A</li></ul> | v1.0.0_changelog-Add-table-A.sql  | &#x2705; |
  |   2   | Create:<ul><li>Table B</li></ul> | v1.1.0_changelog-Add-table-B.sql  | &#x2705; |
  |   3   | Create:<ul><li>Table C</li></ul> | v1.2.0_changelog-Add-table-C.sql  | &#x2705; |
  |   4   | PK-FK                            | v1.2.1_FK_table_A_and_table_B.sql | &#x274C; |
  |   5   | Seeds Data                       | v1.2.2_changelog-Seeds.sql        | &#x274C; |

  #### **Data 2.1**
  |  Index   | Changes                          | File Name                                  |          |
  | :------: | -------------------------------- | ------------------------------------------ | -------- |
  |    1     | Create:<ul><li>Table A</li></ul> | v1.0.0_changelog-Add-table-A.sql           | &#x2705; |
  |    2     | Create:<ul><li>Table B</li></ul> | v1.1.0_changelog-Add-table-B.sql           | &#x2705; |
  |    3     | Create:<ul><li>Table C</li></ul> | v1.2.0_changelog-Add-table-C.sql           | &#x2705; |
  | <o>4</o> | Modify:<ul><li>Table B</li></ul> | <o>v1.2.1_changelog-Modify-table-B.sql</o> | &#x2705; |
  | <r>5</r> | PK-FK                            | <r>v1.2.2_FK_table_A_and_table_B.sql</r>   | &#x2705; |
  | <r>6</r> | Seeds Data                       | <r>v1.2.3_changelog-Seeds.sql</r>          | &#x2705; |

  #### **Data 3**
  | Index | Changes                            | File Name                              |          |
  | :---: | ---------------------------------- | -------------------------------------- | -------- |
  |   1   | Create:<ul><li>Table A&B</li></ul> | v1.0.0_changelog-Add-table-A-and-B.sql | &#x2705; |
  |   2   | Create:<ul><li>Table C</li></ul>   | v1.2.0_changelog-Add-table-C.sql       | &#x2705; |
  |   3   | Seeds Data                         | v1.2.1_changelog-Seeds.sql             | &#x2705; |
