#!/bin/bash


if [ "$( psql -U postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='bety'" )" = '1' ]
then
    echo "Database already exists"
else
    echo "Database does not exist"
    curl -s https://raw.githubusercontent.com/PecanProject/pecan/357b70e21592375827e9c55bc5e1ce8e3426bd78/scripts/load.bety.sh > /tmp/load.bety.sh
    chmod +x /tmp/load.bety.sh
  
    psql  -v ON_ERROR_ROLLBACK=on -U postgres -c "CREATE ROLE bety WITH LOGIN CREATEDB NOSUPERUSER NOCREATEROLE PASSWORD 'password'"
    /tmp/load.bety.sh -c -u -m 99 -r 0 -w https://terraref.ncsa.illinois.edu/bety/dump/bety0/bety.tar.gz 
    /tmp/load.bety.sh -m 99 -r 6 -w https://terraref.ncsa.illinois.edu/bety/dump/bety6/bety.tar.gz
fi
