# source/ setup  intel libs
source /opt/intel/oneapi/setvars.sh
export LIBMKL="$MKLROOT/lib"
# export INTELMKL="$LIBMKL/intel64"
source $MKLROOT/env/vars.sh -arch intel64
