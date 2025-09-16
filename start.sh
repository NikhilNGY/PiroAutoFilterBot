#!/bin/bash

set -e  # Exit immediately if a command fails

if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main repository..."
  git clone https://github.com/NikhilNGY/PiroAutoFilterBot.git /PiroAutoFilterBot
else
  echo "Cloning custom repository from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" /PiroAutoFilterBot
fi

cd /PiroAutoFilterBot

echo "Installing dependencies..."
pip3 install --no-cache-dir --upgrade -r requirements.txt

echo "Starting PiroAutoFilterBot..."
exec python3 bot.py
