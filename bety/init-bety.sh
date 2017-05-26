#!/bin/bash


curl -s https://raw.githubusercontent.com/PecanProject/pecan/357b70e21592375827e9c55bc5e1ce8e3426bd78/scripts/load.bety.sh > /bety/load.bety.sh
chmod +x /bety/load.bety.sh

if [ "$( psql -U postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='bety'" )" = '1' ]
then
    echo "Database already exists"
else
    echo "Database does not exist"
  
    psql  -v ON_ERROR_ROLLBACK=on -U postgres -c "CREATE ROLE bety WITH LOGIN CREATEDB NOSUPERUSER NOCREATEROLE PASSWORD 'password'"
    /bety/update.sh
    psql -U postgres bety < /bety/revoke_select_from_bety_user.sql
fi


