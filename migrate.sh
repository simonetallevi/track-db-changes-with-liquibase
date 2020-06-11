#!/bin/bash

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <liquibase-jar> <user> <password> <host> <schema> <liquibase command>"
  exit 1
fi

LIQUIBASE=$1
USER=$2
PASSWORD=$3
HOST=$4
SCHEMA_NAME=$5

shift 5

echo "$LIQUIBASE $USER $HOST $SCHEMA_NAME"

java -jar "$LIQUIBASE" \
    --changeLogFile="liquibase/db-changes-master.xml" \
    --username="$USER" \
    --password="$PASSWORD" \
    --url="jdbc:mysql://$HOST:3306/$SCHEMA_NAME?useSSL=false&nullNamePatternMatchesAll=true&serverTimezone=UTC" \
    --classpath="liquibase/mysql-connector-java-5.1.38.jar" \
    --driver="com.mysql.jdbc.Driver" \
    --logLevel="info" \
    $*
