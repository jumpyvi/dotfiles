#!/bin/zsh

# Get a list of all running container IDs
containers=$(docker ps -q)

# Check if there are any running containers
if [ -n "$containers" ]; then
  echo "Stopping and removing all running containers..."
  # Forcefully stop and remove all running containers
  docker rm -f $(docker ps -q)
  echo "All running containers have been removed."
else
  echo "No running containers found."
fi
