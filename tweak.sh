#!/bin/bash
# Some tweaks to be made after rebooting 
# Maybe they are not necessary anymore

# Galaxy home
export GALAXY=${PWD}

# Allow galaxy to communicate through the docker socket 
# sudo chmod 777 /var/run/docker.sock
sudo groupadd docker
sudo usermod -aG docker root
sudo usermod -aG docker galaxy

# Some symbolic links that were necessary for mapping correctly the
# volumes by docker inside Galaxy container
# The issue was to how to use symbolic links for docker commands
# into the Galaxy XML tool file
sudo ln -s ${GALAXY}/sbc-galaxy/galaxy_storage /export
sudo ln -s ${GALAXY}/sbc-galaxy/local_tools/
sudo ln -s ${GALAXY}/sbc-galaxy/galaxy_storage/galaxy-central/
