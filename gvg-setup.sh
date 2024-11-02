#!/bin/bash
# THIS SCRIPT IS COMPLETELY UNTESTED

# username and password of the standard user.
USERNAME="gvg"
PASSWORD=""

#screen rotaion
ROTATION="left"  # Options: normal, left, right, inverted

# Create a new user
useradd -m "$USERNAME"
# echo "$USERNAME:$PASSWORD" | chpasswd
echo "User $USERNAME created."

# Set Screen Rotation
# Automatically detect the primary display name
DISPLAY_NAME=$(xrandr --query | grep " connected" | awk '{ print $1 }' | head -n 1)
if [ -z "$DISPLAY_NAME" ]; then
  echo "Error: No display found."
  exit 1
fi

# Rotate the screen
xrandr --output "$DISPLAY_NAME" --rotate "$ROTATION"
echo "Screen rotated to $ROTATION on display $DISPLAY_NAME."
