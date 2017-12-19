#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.9 gcc-4.9

sudo apt-get install verilator luajit build-essential clang libedit-dev libpng12-dev csh libgmp3-dev git zlib1g zlib1g-dev graphviz-dev 

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
