#!/bin/bash

MOUNTED_DIR="/mnt/wordpress"
BUILD_IN_DIR="/mnt/wordpress/built-in"
CONTENT_DIR="/mnt/wordpress/content"
CONFIG_FILE="/mnt/wordpress/config.json"

if [ ! -d $BUILD_IN_DIR ]; then
  cp -r /usr/bin/wordpress/built-in "$MOUNTED_DIR"
fi

if [ ! -d $CONTENT_DIR ]; then
  cp -r /usr/bin/wordpress/content "$MOUNTED_DIR"
fi

if [[ ! -f $CONFIG_FILE ]]; then
  cp /usr/bin/wordpress/config.json "$MOUNTED_DIR"
  chmod +x /mnt/wordpress/config.json
fi

/usr/bin/wordpress/journey -custom-path="/mnt/wordpress" -log="/mnt/wordpress/log.txt"
