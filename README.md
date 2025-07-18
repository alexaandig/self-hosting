### UPDATE PACKAGES BEFORE RUNNING THE SCRIPT

```bash
sudo apt update && sudo apt upgrade -y 
```

### Install Docker-CE, Docker-Compose and Portainer-CE.

1. Copy this command for the install script

```bash
wget -qO install-docker.sh https://raw.githubusercontent.com/alexaandig/self-hosting/refs/heads/main/install_docker.sh?ref_type=heads && chmod +x install-docker.sh && ./install-docker.sh
```
After Installation:
```bash
rm install-docker.sh
```

## Prompts from the script:
First, you'll be prompted to select the number for your OS / Distro.  Currently I support RaspbianOS (latest), CentOS 7 and 8, Debian 10 and 11, Ubuntu 18.04 20.04 22.04 23.04 24.04 and on, Arch Linux, and Open Suse (tested on Leap 15.4). 

Next, you'll be asked to answer "y" to any of the four software packages you'd like to install. 
- Docker-CE (you'll need this for the others to work)
- Docker-Compose (you'll need this for any of the applications to start properly)

Next, you'll be asked if you want to install any applications with Docker and Docker compose. This is a yes / no (y/n) question. If you answer 'y', you'll be asked to answer y/n for each application.

- Portainer-CE
  - if you answer y to Portainer, you'll be asked another question

Do you want 
  1. Full Portainer-CE with the web UI, or 
  2. Just Portainer-agent (which you connect to another full portainer instance). 

Make that selection, and the install will continue.

Answering "n" to any of them will cause them to be skipped.

### NOTE
* You must have Docker-CE (or some version of Docker) installed in order to run any of the other three packages.
* You must have Docker-Compose installed in order to run Portainer-CE, or any of the apps offered with this script.
