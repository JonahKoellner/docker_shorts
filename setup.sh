#!/bin/bash

# To run or call the docker_setup.sh from anywhere
# copy the docker_init.sh into ~/.script/docker/init/
# append the export for the file into the .zshrc


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

cp "src/Dockerfile" "~/.scripts/docker/custom_container/"

# Append the ubuntu alias into the shell config file
echo 'alias ubuntu="docker run -it -v $PWD:code ~/.scripts/docker/custom_container/. /bin/bash"' >> "$SHELLCONF"

chmod +x "src/docker_init.sh"
cp -p "src/docker_init.sh" "~/.scripts/docker/init/"

echo 'export "PATH=$PATH:$HOME/.scripts/docker/init/"' >> "$SHELLCONF"

# For the running of the docker env with make and g++ preinstalled
# create the ~/.script/docker/custom_container/ directory
#
# cp the files from src/ to the created container 
#
# append the alias to the .zshrc for the docker run call
