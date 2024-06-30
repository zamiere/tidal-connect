#!/bin/bash

TMUX_SESSION=speaker_controller_application
TMUX_KEYSTROKE="L"
docker exec tidal-connect /usr/bin/tmux send-keys -t ${TMUX_SESSION}.0 ${TMUX_KEYSTROKE}
