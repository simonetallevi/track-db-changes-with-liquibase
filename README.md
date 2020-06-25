# Track DB Changes With Liquibase

## Setup

1 Start your mysql database instances:

- If is the first time your are running the container
```
docker run -p 3306:3306 --name mysql_80 -e MYSQL_ROOT_PASSWORD=password -d mysql:8
```

- If you already have run the previous command and yiu want to re-run the stopped container
```
docker start mysql_80
```

2 Connect to the docker instance
```
docker exec -it mysql_80 /bin/bash
```

3 Connect to the database
```
mysql -h localhost -u root -p
```

4 Create your schema
```
CREATE SCHEMA TRY2CATCHIT DEFAULT CHARACTER SET utf8;
```

4 Exit from the container
```
exit
```

## Configure Liquibase 

Install Liquibase by following these instructions [HERE](https://www.liquibase.org/get-started/first-steps).

Test your the Liquibase installation with the following command:

```
liquibase --version
```

expected output:

```
Starting Liquibase at Thu, 25 Jun 2020 00:31:01 CEST (version 3.10.0 #10 built at Thu Jun 11 09:47:49 UTC 2020)
Liquibase Version: 3.10.0
Liquibase Community 3.10.0 by Datical
Running Java under /Library/Java/JavaVirtualMachines/jdk-11.0.4.jdk/Contents/Home (Version 11.0.4)
```

Download your MySql 8 jdbc Driver from [HERE](https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar) 
and place it in the root folder of the project.

Configure Liquibase properties in the ``liquibase.properties`` 
file and place it in the root of the project.

```
driver=<DRIVER>
classpath=<DRIVER-JAR>
url=jdbc:mysql://<HOST>:<PORT>/<SCHEMA>?useSSL=false&nullNamePatternMatchesAll=true&serverTimezone=UTC
username=<USER>
password=<PASSWORD>
changeLogFile=db-changes-master.xml
logLevel=info
```

Below an example

```
driver=com.mysql.cj.jdbc.Driver
classpath=mysql-connector-java-8.0.19.jar
url=jdbc:mysql://localhost:3306/TRY2CATCHIT?useSSL=false&nullNamePatternMatchesAll=true&serverTimezone=UTC
username=root
password=password
changeLogFile=db-changes-master.xml
logLevel=info
```

## Run the migrations

Below are some of the most used commands,
however for more information have a look at the full documentation [HERE](https://www.liquibase.org/)

### 1 Start the migrations
```
liquibase update
```

### 2 Rollback a migration
```
liquibase rollbackCount 1
```

### 3 Environment dependent migration

### 4 Star using Liquibase on existing databases
