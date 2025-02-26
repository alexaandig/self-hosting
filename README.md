# docker_installs
This script will help install any, or all, of Docker-CE, Docker-Compose, NGinX Proxy Manager, and Portainer-CE.

## Reason for Making this Script
I got tired of running individual commands all the time, so I created some scripts to make this very easy. 

## Using this script

You can use the script by simply pulling it down with wget or curl, changing the permissions, and running it. 

1. Pull down a copy with the command

`wget -O install-docker.sh https://raw.githubusercontent.com/alexaandig/self-hosting/refs/heads/main/install_docker_nproxyman.sh?ref_type=heads`

2. Change the permission to make the file executable:

`chmod +x install-docker.sh`

3. Run it with

`./install-docker.sh`

## Contributing by making changes

1. Clone the repo
`git clone https://github.com/alexaandig/self-hosting.git`


## Prompts from the script:
First, you'll be prompted to select the number for your OS / Distro.  Currently I support RaspbianOS (latest), CentOS 7 and 8, Debian 10 and 11, Ubuntu 18.04 20.04 22.04 23.04 24.04 and on, Arch Linux, and Open Suse (tested on Leap 15.4). 

Next, you'll be asked to answer "y" to any of the four software packages you'd like to install. 
- Docker-CE (you'll need this for the others to work)
- Docker-Compose (you'll need this for any of the applications to start properly)
Note: I try to detect if Docker and Docker Compose are already installed and running...and won't prompt if they are found.

Next, you'll be asked if you want to install any applications with Docker and Docker compose. This is a yes / no (y/n) question. If you answer 'y', you'll be asked to answer y/n for each application I offer.

- NGinx Proxy Manager
- Portainer-CE
  - if you answer y to Portainer, you'll be asked another question

Do you want 
  1. full Portainer-CE with the web UI, or 
  2. just Portainer-agent (which you connect to another full portainer instance). 

Make that selection, and the install will continue.

Answering "n" to any of them will cause them to be skipped.

### NOTE
* You must have Docker-CE (or some version of Docker) installed in order to run any of the other three packages.
* You must have Docker-Compose installed in order to run NGinX Proxy Manager, Portainer-CE, or any of the apps offered with this script.

Before prompting to install Docker or Docker-Compose, I do try to see if you already have them installed, and I skip the prompt if you do (or I try to anyway).
