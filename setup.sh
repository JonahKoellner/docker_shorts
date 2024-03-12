#!/bin/bash

# Check for the Shell configuration file
if [-f "$HOME/.bashrc"]; then
   SHELLCONF="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc"]; then
  SHELLCONF="$HOME/.zshrc"
else
  echo "No Shell Config (bashrc or zshrc) file found"
  exit 1
fi

mkdir -p "~/.scripts/docker/custom_container/"
mkdir -p "~/.scripts/docker/init/"

cp "src/custom_container/Dockerfile" "~/.scripts/docker/custom_container/"

# Append the debian alias into the shell config file
echo 'alias debian="docker run -it -v $PWD:code ~/.scripts/docker/custom_container/. /bin/bash"' >> "$SHELLCONF"

chmod +x "src/init/docker_init.sh"
cp -p "src/init/*" "~/.scripts/docker/init/"

echo 'export "PATH=$PATH:$HOME/.scripts/docker/init/"' >> "$SHELLCONF"
