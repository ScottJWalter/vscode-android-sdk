#!/bin/bash

# Check Tailscale login status
status=$(tailscale status --json | jq -r '.BackendState')

if [[ "$status" == "Running" ]]; then
  echo "Tailscale is running."
else
  # Prompt for login if not logged in
  read -r -p "Tailscale is not running. Do you want to log in? [y/N] " response
  if [[ "$response" =~ ^[yY]$ ]]; then
    sudo tailscale up
  fi
fi