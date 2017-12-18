#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status.

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.9 gcc-4.9

sudo apt-get install verilator luajit build-essential clang libedit-dev libpng-dev csh libgmp3-dev git cmake zlib1g zlib1g-dev graphviz-dev python3 
#sudo apt-get swig2.0 libcln-dev imagemagick python-virtualenv libxml2-dev libxslt-dev python3-dev python-gtk2

if [[ -z "${TRAVIS_BUILD_DIR}" ]]; then
    # Halide_CoreIR/test/scripts/install_travis.sh is known to use this
    export TRAVIS_BUILD_DIR=`pwd`
fi

export HALIDE_REPO="https://github.com/jeffsetter/Halide_CoreIR.git"
export COREIR_REPO="https://github.com/rdaly525/coreir.git"

export HALIDE_BRANCH="master"
export COREIR_BRANCH="master"

export HALIDE_PATH="Halide_CoreIR"
export COREIR_PATH="coreir"

# clone repos
git clone ${HALIDE_REPO} -b ${HALIDE_BRANCH} ${HALIDE_PATH}
git clone ${COREIR_REPO} -b ${COREIR_BRANCH} ${COREIR_PATH}

#halide
export LLVM_VERSION=3.7.1
export BUILD_SYSTEM=MAKE
export CXX_=g++-4.9
export CC_=gcc-4.9
Halide_CoreIR/test/scripts/install_travis.sh

#coreir
export COREIRCONFIG="g++-4.9";
make -C ${COREIR_PATH} -j12 build install
make -C ${COREIR_PATH}/tools/crop

# set some environment variables
source ${HALIDE_PATH}/test/scripts/before_install_travis.sh
source setenv.sh # (LD_LIBRARY_PATH in coreir)
