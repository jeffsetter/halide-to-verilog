
# execute export in bash, setenv in csh
test "$?BASH_VERSION" = "0" || eval 'setenv() { export "$1=$2"; }'

setenv LD_LIBRARY_PATH ${PWD}/coreir/lib:${LD_LIBRARY_PATH}


