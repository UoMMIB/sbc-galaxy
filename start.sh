#!/bin/bash
# Start Galaxy
# I am having issues with /var/run/docker.sock : changed permissions

USERID=`id -u`

#docker run --name nginx-proxy -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
#docker run --name sbc-galaxy -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/galaxy_storage:/export -v ${PWD}/local_tools:/local_tools -v ${PWD}:/sbc -v ${SBCDATA_SHARED}:/shared:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=/sbc/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample -e GALAXY_CONFIG_BRAND="SYNBIOCHEM" -e VIRTUAL_HOST=galaxy.synbiochem.co.uk sbcglx
#docker run --name sbc-galaxy -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/galaxy_storage:/export -v ${PWD}/local_tools:/local_tools -v ${PWD}:/sbc -v ${SBCDATA_SHARED}:/shared:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=/sbc/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample -e GALAXY_CONFIG_BRAND="SYNBIOCHEM" sbcglx
#docker run --name sbc-galaxy -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}:/sbc -v ${SBCDATA_SHARED}:/shared:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=/sbc/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/sbc/local_tools/local_tools.xml,config/tool_conf.xml.sample -e GALAXY_CONFIG_BRAND="SYNBIOCHEM" sbcglx
docker run --name sbc-galaxy -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/galaxy_storage:/export -v ${PWD}/local_tools:/local_tools -v ${SBCDATA_SHARED}:/shared:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=${PWD}/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample -e GALAXY_CONFIG_BRAND="SYNBIOCHEM" sbcglx

#docker run --name sbc-galaxy -d -p 8080:80 -p 8021:21 -p 8022:22 -v /home/galaxy/sbc-galaxy/galaxy_storage:/export -v /home/galaxy/sbc-galaxy/local_tools:/local_tools -v /home/galaxy/sbc-galaxy:/home/galaxy/sbc-galaxy -v ${SBCDATA_SHARED}:/shared:ro -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=/home/galaxy/sbc-galaxy/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/home/galaxy/sbc-galaxy/local_tools/local_tools.xml,/home/galaxy/sbc-galaxy/galaxy_storage/galaxy-central/config/tool_conf.xml.sample -e GALAXY_CONFIG_BRAND="SYNBIOCHEM" sbcglx