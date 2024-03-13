# docker_shorts
Repo that contains a Dockerfile and setup script that creates a global docker_init.sh to open docker and a "debian" command to start a linux machine with a few things preinstalled

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
If "debian" is not found, source (zshrc or bashrc) your Shell configuration file first or restart the terminal
```bash
user@pc:$ source ~/.zshrc
```
