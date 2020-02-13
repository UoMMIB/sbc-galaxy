#!/bin/bash
# Start Galaxy
docker run -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/local_tools:/local_tools -v /var/run/docker.sock:/var/run/docker.sock -e GALAXY_CONFIG_TOOL_CONFIG_FILE=/local_tools/local_tools.xml,config/tool_conf.xml.sample,config/shed_tool_conf.xml.sample sbcglx
