#!/bin/bash

#xpra start --daemon=no --exit-with-children --mdns=no --pulseaudio=no --printing=no --webcam=no  --bind-tcp=0.0.0.0:10000 --html=on --start-child=/PanoplyJ/panoply.sh

xpra start-desktop --start=openbox-session --bind-tcp=0.0.0.0:10000 --html=on

sleep infinity
