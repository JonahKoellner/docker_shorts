# docker_shorts
Repo that contains a Dockerfile and setup script that creates a global docker_init.sh to open docker and a "debian" command to start a linux machine with a few things preinstalled

## Docker Initialization
This script will add a globaly callable initialization script.
42 Students have their own flag to make Docker store in goinfre and NOT clutter your system

## Container
This script will add an alias "debian" with which you can create yourself a Container wherever you want.
The container has "valgrind", "make", "cmake", "g++" preinstalled.
It also mounts the volume where you currently are so you can edit your files outside of the Container.

To get to your mounted directory:
```bash
root@pc:$ cd code
```

(The mounting has some quirks right now, so it might be that you start at your home directory.)

## Setup
1. Go into the cloned Directory
2.
```bash
user@pc:~/docker_shorts$ bash setup.sh
```

## Running
### To run the docker initialization:
```bash
user@pc:$ docker_init.sh
```

42 Students can run
```bash
user@pc:$ docker_init.sh 42
```

If you run into troubles with no permissions use "bash docker_init.sh"

### To run the container:
```bash
user@pc:$ debian
```
If "debian" is not found, source your Shell configuration (zshrc or bashrc) file first or restart the terminal
```bash
user@pc:$ source ~/.zshrc
```
