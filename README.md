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
CREATE SCHEMA liquibase DEFAULT CHARACTER SET utf8;
```

4 Exit from the container
```
exit
```

## Run migrations

Below you can find some of most used command.
For more information have a look [HERE](https://www.liquibase.org/)

1 Liquibase update
```

```

2 liquibase rollback
```
```
