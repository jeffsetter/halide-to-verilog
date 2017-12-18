# execute export in bash, setenv in csh
test "$?BASH_VERSION" = "0" || eval 'setenv() { export "$1=$2"; }'

# setenv HALIDE_REPO https://github.com/jeffsetter/Halide_CoreIR.git
# setenv COREIR_REPO https://github.com/rdaly525/coreir.git
# 
# setenv HALIDE_BRANCH master
# setenv COREIR_BRANCH verilog_tb
# 
# setenv HALIDE_PATH Halide_CoreIR
# setenv COREIR_PATH coreir

source setenv.sh

# clone repos
git clone ${HALIDE_REPO} -b ${HALIDE_BRANCH} ${HALIDE_PATH}
git clone ${COREIR_REPO} -b ${COREIR_BRANCH} ${COREIR_PATH}

${HALIDE_PATH}/test/scripts/install_travis.sh
make -C ${COREIR_PATH} -j12 build coreir
make -C ${COREIR_PATH}/tools/crop

#halide
# setenv LLVM_VERSION=3.7.1
# setenv BUILD_SYSTEM=MAKE
# setenv CXX_=g++-4.9
# setenv CC_=gcc-4.9
# setenv CXX g++-4.9
# Halide_CoreIR/test/scripts/install_travis.sh
# 
# #coreir
# setenv COREIRCONFIG g++-4.9
# make -C ${COREIR_PATH} -j12 build
# make -C ${COREIR_PATH}/tools/crop
# 
# # set some environment variables
# source ${HALIDE_PATH}/test/scripts/before_install_travis.sh
# #source setenv.sh # (LD_LIBRARY_PATH in coreir)
# setenv LD_LIBRARY_PATH ${PWD}/coreir/lib:${LD_LIBRARY_PATH}

