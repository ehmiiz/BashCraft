#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p ~/Pictures/Screenshots

# Capture the date and time
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the file path
filepath=~/Pictures/Screenshots/Screenshot_$timestamp.png

# Take a screenshot in area mode and save it to the specified path
gnome-screenshot -a -f "$filepath"

# Check if the screenshot was taken successfully
if [[ -f "$filepath" ]]; then
    # Open the screenshot with KolourPaint
    flatpak run org.kde.kolourpaint "$filepath"
else
    echo "Screenshot failed or was cancelled."
fi
