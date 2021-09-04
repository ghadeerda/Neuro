#!/bin/bash

if [ "$#" == 0 ]
then
echo "HELP :
-d  database (default postgres)
-u  user (default postgres)
-h  host (default localhost)
-p  port (default 5432)
"
exit 102
fi

database="postgres"
user="postgres"
host="localhost"
port=5432

while getopts ":d:u:h:p:" opt; do
  case $opt in
    d) database="$OPTARG" 
    ;;
    u) user="$OPTARG"
    ;; 
    h) host="$OPTARG"
    ;;
    p) port="$OPTARG"
    ;; 
    \?) echo "HELP :
-d  database (default postgres)
-u  user (default postgres)
-h  host (default localhost)
-p  port (default 5432)
"
  exit 103
    ;;
  esac
done

psql_cmd=`which psql`
if [ ! -x "$psql_cmd" ]; then
    echo "Postgsql is needed"
    exit 1
fi

psql $database -U $user -h $host -p $port -q -c "CREATE TABLE GHNEW(FIRST_NAME CHAR(20) NOT NULL,LAST_NAME CHAR(20),AGE INT,SEX CHAR(1),INCOME FLOAT);"





