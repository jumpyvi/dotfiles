#!/usr/bin/env bash

# Capture the screen resolution
res=$(kscreen-doctor -o | grep 'priority 1' -A 2 | grep Modes | awk -F: '{print $3}' | awk -F@ '{print $1}' | sed 's/\x1B\[[0-9;]*[mGK]//g' | tr -d '[:space:]')

# Check if resolution was found
if [ -z "$res" ]; then
    echo "No resolution found."
    exit 1
fi

# Run the Moonlight stream command
/usr/bin/flatpak run com.moonlight_stream.Moonlight stream VeryGaming Steam --quit-after --resolution "$res"
