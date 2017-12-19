#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.9 gcc-4.9

sudo apt-get install verilator
sudo apt-get install build-essential
sudo apt-get install clang
sudo apt-get install libedit-dev
sudo apt-get install libpng12-dev
sudo apt-get install csh
sudo apt-get install libgmp3-dev
sudo apt-get install git
sudo apt-get install zlib1g
sudo apt-get install zlib1g-dev
sudo apt-get install graphviz-dev 

if [[ -z "${TRAVIS_BUILD_DIR}" ]]; then
    # Halide_CoreIR/test/scripts/install_travis.sh is known to use this
    export TRAVIS_BUILD_DIR=`pwd`
fi

# clone Halide and coreir
source clonerepos.sh
 
# coreir install
sudo make -C ${COREIR_PATH} install

# set some environment variables
source ${HALIDE_PATH}/test/scripts/before_install_travis.sh
