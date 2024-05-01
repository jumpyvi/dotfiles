#!/bin/bash

# Function to check internet connectivity
check_internet() {
  wget -q --spider http://example.com
  return $?
}

# Check internet connectivity
if check_internet; then
  echo "Internet connection available. Proceeding with push."
  home-manager switch
  git -C $HOME/.config/home-manager add .
  git -C $HOME/.config/home-manager commit -m 'Automatic update by home-manager'
  git -C $HOME/.config/home-manager push
else
  echo "No internet connection available. Skipping push."
  home-manager switch
  git -C $HOME/.config/home-manager add .
  git -C $HOME/.config/home-manager commit -m 'Automatic update by home-manager'
fi
