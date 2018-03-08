#!/bin/bash


curl -s https://raw.githubusercontent.com/PecanProject/pecan/master/scripts/load.bety.sh > /bety/load.bety.sh
chmod +x /bety/load.bety.sh

/bety/update.sh
psql -U postgres bety < /bety/revoke_select_from_bety_user.sql
