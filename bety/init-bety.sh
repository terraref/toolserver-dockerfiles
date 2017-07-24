#!/bin/bash


curl -s https://raw.githubusercontent.com/PecanProject/pecan/357b70e21592375827e9c55bc5e1ce8e3426bd78/scripts/load.bety.sh > /bety/load.bety.sh
chmod +x /bety/load.bety.sh

/bety/update.sh
psql -U postgres bety < /bety/revoke_select_from_bety_user.sql
