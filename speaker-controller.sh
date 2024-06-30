#!/bin/bash

echo ""
echo "Press Ctrl+b, d to detach!"
sleep 3
docker exec -ti tidal-connect /usr/bin/tmux a -t speaker_controller_application
