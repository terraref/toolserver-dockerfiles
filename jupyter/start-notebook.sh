#!/bin/bash
set -e

git clone https://github.com/terraref/tutorials.git ~/work/turorials

. /usr/local/bin/start.sh jupyter notebook $*
