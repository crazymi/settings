#!/bin/bash

# Script for installing htop on systems where you don't have root access.
# htop will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

HTOP_VERSION=2.2.0

# create our directories
mkdir -p $HOME/local/bin $HOME/htop_tmp
cd $HOME/htop_tmp
git clone https://github.com/hishamhm/htop 

# download source files for htop
#REL=https://hisham.hm/htop/releases
#HTOP_FILENAME=htop-${HTOP_VERSION}
#wget -O ${HTOP_FILENAME}.tar.gz ${REL}/${HTOP_VERSION}/${HTOP_FILENAME}.tar.gz

# extract files, configure, and compile
#tar xvzf ${HTOP_FILENAME}.tar.gz
#cd ${HTOP_FILENAME}
cd htop 

./autogen.sh 

./configure --prefix=$HOME/local && make
cp htop $HOME/local/bin/
cd ..

# cleanup
rm -rf $HOME/htop_tmp

echo "$HOME/local/bin/htop is now available. You can optionally add $HOME/local/bin to your PATH."
