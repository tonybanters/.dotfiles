#!/bin/bash

# Define the names of your headphones and speakers
HEADPHONES="alsa_output.usb-Kingston_HyperX_Cloud_II_Wireless_000000000001-00.analog-stereo"
SPEAKERS="alsa_output.pci-0000_00_1f.3.analog-stereo"

# Function to get the current fallback sink
get_fallback_sink() {
  pactl info | awk -F': ' '/Default Sink:/{print $2}'
}

# Function to toggle between the headphones and speakers as the fallback sink
toggle_fallback_sink() {
  current_sink=$(get_fallback_sink)

  if [ "$current_sink" = "$HEADPHONES" ]; then
    pactl set-default-sink "$SPEAKERS"
    echo ""
  else
    pactl set-default-sink "$HEADPHONES"
    echo ""
  fi
}

# Function to get the icon based on the current fallback sink
get_icon() {
  current_sink=$(get_fallback_sink)
  if [ "$current_sink" = "$HEADPHONES" ]; then
    echo ""
  else
    echo ""
  fi
}

# Check if the script was called with a click event
if [ "$1" = "click" ]; then
  # Call the toggle_fallback_sink function when clicked
  toggle_fallback_sink
else
  # Print the current fallback sink and icon
  echo "$(get_icon)"
fi

while true; do
  # Print the current fallback sink and icon
  echo "$(get_icon)"
  # Wait for a second before checking again
  sleep 0.5
done
