#!/bin/bash
set -e

git clone https://github.com/terraref/tutorials.git ~/work/tutorials

. /usr/local/bin/start.sh jupyter notebook $*
