#!/bin/bash

PLIST_FILE=~/Library/LaunchAgents/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist

if [ -f $PLIST_FILE ]; then
  launchctl unload $PLIST_FILE

  rm $PLIST_FILE
fi

launchctl remove "com.kosmatov.sleepwatcher-wezterm"
