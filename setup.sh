#!/bin/bash

# Check for the Shell configuration file
if [[ -f "$HOME/.bashrc" ]]; then
	SHELLCONF="$HOME/.bashrc"
elif [[ -f "$HOME/.zshrc" ]]; then
	SHELLCONF="$HOME/.zshrc"
else
 echo "No Shell Config (bashrc or zshrc) file found"
 exit 1
fi

# Create directories
mkdir -p "$HOME/.scripts/docker/custom_container/" || { echo "Failed to create directory"; exit 1; }
mkdir -p "$HOME/.scripts/docker/init/" || { echo "Failed to create directory"; exit 1; }

# Copy Dockerfile
cp "src/custom_container/Dockerfile" "$HOME/.scripts/docker/custom_container/" || { echo "Failed to copy Dockerfile"; exit 1; }

echo "" >> "$SHELLCONF"
echo "# Custom Container scripts" >> "$SHELLCONF"

echo 'alias debian="docker build -t custom_debian:latest $HOME/.scripts/docker/custom_container/ && docker run -it -v $PWD:/code custom_debian:latest /bin/bash "' >> "$SHELLCONF" || { echo "Failed to append the alias to the $SHELLCONF"; exit 1; }

# Make start docker script executable
chmod +x "src/init/docker_init.sh" || { echo "Failed to make script executable"; exit 1; }

# Copy initialization scripts
cp -r "src/init/" "$HOME/.scripts/docker/init/" || { echo "Failed to copy initialization scripts"; exit 1; }

echo 'export "PATH=$PATH:$HOME/.scripts/docker/init/"' >> "$SHELLCONF" || { echo "Failed to add the location $HOME/.scripts/docker/init/ to the PATH in $SHELLCONF"; exit 1; }

# Source new condif
. "$SHELLCONF" 2>/dev/null
if [ $? -ne 0 ]; then
    # Attempt to source the shell configuration file in Zsh
    zsh -c ". $SHELLCONF 2>/dev/null"
    if [ $? -ne 0 ]; then
        echo "[Warning] Couldn't source $SHELLCONF in zsh or bash. Manually sourcing required"
    fi
fi
