# set all environment variables
source setenv.sh

# clone repos
git clone ${HALIDE_REPO} -b ${HALIDE_BRANCH} ${HALIDE_PATH}
git clone ${COREIR_REPO} -b ${COREIR_BRANCH} ${COREIR_PATH}

# make coreir
make -C ${COREIR_PATH} -j12 build coreir
make -C ${COREIR_PATH}/tools/crop
