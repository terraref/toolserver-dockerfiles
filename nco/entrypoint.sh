#!/bin/sh
set -e

adduser --system --home /home/$NAMESPACE --shell /bin/bash --ingroup root --disabled-password $NAMESPACE
mkdir -p /home/$NAMESPACE

cd /wetty
sed -i "106s?^.*?term = pty.spawn('/bin/su', ['-', '$NAMESPACE'], {?" app.js
node app.js -p 3000
