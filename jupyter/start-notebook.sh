#!/bin/bash
set -e

ln -s /data ~/work/
git clone https://github.com/terraref/tutorials.git ~/work/turorials

. /usr/local/bin/start.sh jupyter notebook $*