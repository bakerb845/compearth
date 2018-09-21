#!/bin/bash
/usr/bin/cmake $( dirname "$0" ) -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=./ \
-DCMAKE_C_FLAGS="-g3 -O2 -fopenmp" \
-DCOMPEARTH_USE_MKL=TRUE \
-DCOMPEARTH_BUILD_PYTHON_MODULE=ON
