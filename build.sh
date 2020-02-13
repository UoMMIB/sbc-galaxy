#!/bin/bash

# Build Galaxy image
docker build -t sbcglx .

# Clone sbc tools
cd local_tools
git clone https://github.com/synbiochem/galaxytools.git

# Build SBC tools image
cd galaxytools
docker build -t sbc1 .

# Clone additional tools
cd ..
git clone https://github.com/pablocarb/galaxysynbiodesign.git
cd ..

# Start Galaxy
sh start.sh
