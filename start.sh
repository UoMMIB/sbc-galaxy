#!/bin/bash
# Start Galaxy
# Having issues with /var/run/docker.sock : changed permissions

USERID=`id -u`

docker run -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/galaxy_storage:/export -v ${PWD}/local_tools:/local_tools -v ${PWD}:/sbc -v /var/run/docker.sock:/var/run/docker.sock:rw -e GALAXY_CONFIG_JOB_CONFIG_FILE=/sbc/job_conf.xml -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample sbcglx

#docker run -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/local_tools:/local_tools -v /var/run/docker.sock:/var/run/docker.sock -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample sbcglx
