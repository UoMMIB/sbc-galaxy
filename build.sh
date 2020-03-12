#!/bin/bash

# Build Galaxy image
docker build -t sbcglx .

# Clone sbc tools
cd local_tools
git clone https://github.com/synbiochem/galaxytools.git

# Build SBC tools image
cd galaxytools
docker build -t sbc1 .

# Clone additional repos
mkdir code
cd code
git clone https://github.com/pablocarb/doebase.git
git clone https://github.com/pablocarb/sbc-viscad.git

git clone https://github.com/neilswainston/PlasmidGenieClient.git
git clone https://github.com/neilswainston/sbc-assembly.git

git clone https://github.com/pablocarb/sbc-doe.git
# Add symbolic links
cd sbc-doe
ln -s ../doebase
ln -s ../sbc-viscad viscad
cd .. # sbc-doe

cd .. # code

ln -s code/sbc-assembly/assembly

# Clone additional tools
cd ..
git clone https://github.com/pablocarb/galaxysynbiodesign.git
cd ..

# Start Galaxy
sh start.sh

# Start Galaxy after reboot
cat crontab | crontab
