# sbc-galaxy

SYNBIOCHEM Galaxy server that supports the design pipeline infrastructure. Pablo Carbonell, SYNBIOCHEM, 2020.

## Installation

The system is built from two docker images:

* ``sbcglx`` based on the [Galaxy Docker Image](https://hub.docker.com/r/bgruening/galaxy-stable/).
* ``sbc1`` based on  [docker-annaconda](https://hub.docker.com/r/continuumio/anaconda3).

The reason for creating two separate images is to have an independent ``sbc1`` image with all required libraries for running the SBC tools. In order to be able to run ``sbc1`` from ``sbcglx``, the latter has to share the docker socket from the parent and have the permissions to read and write:

```
-v /var/run/docker.sock:/var/run/docker.sock:rw
```

Main scripts:

``build.sh`` build the images and install the SBC repositories.
``start.sh`` will start the galaxy server.
``stop.sh`` will stop and remove the container of the server.

``nginx`` is used in order to employ virtual domains.

The Galaxy tools are in https://github.com/synbiochem/galaxytools. When possible, the tools is run within the ``sbc1`` container by Galaxy. For some apps, there were some issues and I have written directly the docker invocation in the tool. In the future, this should be unified and made more automated.
