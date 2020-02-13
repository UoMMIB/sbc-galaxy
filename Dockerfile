FROM bgruening/galaxy-stable

#COPY config/tool_conf.xml /galaxy-central/config/local_tools.xml
#COPY config/job_conf.xml /galaxy-central/config/job_conf.xml
COPY local_tools /local_tools

WORKDIR /local_tools/galaxytools
#RUN sudo service docker start
#RUN sudo docker build -t sbc1 .

# docker run -d -p 8080:80 -p 8021:21 -p 8022:22 -v ${PWD}/local_tools:/local_tools -e GALAXY_CONFIG_TOOL_CONFIG_FILE=config/tool_conf.xml.sample,config/shed_tool_conf.xml.sample,/local_tools/local_tools.xml sbcglx
