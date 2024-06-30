#!/bin/bash

echo ""
echo "Press CTRL+B, D to detach!"
sleep 3
docker exec -ti tidal-connect /usr/bin/tmux a -t speaker_controller_application
