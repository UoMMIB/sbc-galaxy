# sbc-galaxy

SYNBIOCHEM Galaxy server that supports the design pipeline infrastructure. Pablo Carbonell, SYNBIOCHEM, 2020.

## Description

The system is built from two docker images:

* ``sbcglx`` based on the [Galaxy Docker Image](https://hub.docker.com/r/bgruening/galaxy-stable/).
* ``sbc1`` based on  [docker-annaconda](https://hub.docker.com/r/continuumio/anaconda3).

The reason for creating two separate images is to have an independent ``sbc1`` image with all required libraries for running the SBC tools. In order to be able to run ``sbc1`` from ``sbcglx``, the latter has to share the docker socket from the parent and have the permissions to read and write:

```
-v /var/run/docker.sock:/var/run/docker.sock:rw
```

## Installation

Create account `galaxy` with following id details:

``uid=1450(galaxy) gid=1450(galaxy) groups=1450(galaxy),27(sudo),999(docker)``

Main scripts:

* ``build.sh`` build the images and install the SBC repositories.
* ``start.sh`` will start the galaxy server.
* ``stop.sh`` will stop and remove the container of the server.

Other scripts:

``tweak.sh`` contains some commands that might be required to run at least once in order to install the Galaxy server in a new computer.

A container running an ``nginx`` server is used in order to employ virtual domains.

The Galaxy tools are in https://github.com/synbiochem/galaxytools. When possible, the tools are run within the ``sbc1`` container by Galaxy. For some apps, there were some issues and I have written directly the docker invocation in the tool. In the future, this should be unified and made more automated.
