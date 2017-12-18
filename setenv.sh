# execute export in bash, setenv in csh
test "$?BASH_VERSION" = "0" || eval 'setenv() { export "$1=$2"; }'

# git repo names
setenv HALIDE_REPO https://github.com/jeffsetter/Halide_CoreIR.git
setenv COREIR_REPO https://github.com/rdaly525/coreir.git

setenv HALIDE_BRANCH master
setenv COREIR_BRANCH verilog_tb

setenv HALIDE_PATH Halide_CoreIR
setenv COREIR_PATH coreir

# for halide
setenv LLVM_VERSION 3.7.1
setenv BUILD_SYSTEM MAKE
setenv CXX_ g++-4.9
setenv CC_ gcc-4.9

# for coreir
setenv CXX g++-4.9
setenv COREIRCONFIG g++-4.9
setenv LD_LIBRARY_PATH ${PWD}/coreir/lib:${LD_LIBRARY_PATH}


