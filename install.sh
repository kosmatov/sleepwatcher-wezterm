#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0}); pwd)

PLIST_FILE=~/Library/LaunchAgents/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist

if [ -f $PLIST_FILE ]; then
  launchctl unload $PLIST_FILE
fi

launchctl remove "com.kosmatov.sleepwatcher-wezterm"

ln -sfv $SCRIPT_DIR/com.kosmatov.sleepwatcher-wezterm-20compatibility-localuser.plist ~/Library/LaunchAgents/

launchctl load $PLIST_FILE
