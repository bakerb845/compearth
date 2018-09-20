#!/bin/bash
/usr/bin/cmake $( dirname "$0" ) -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=./ \
-DCMAKE_C_FLAGS="-g3 -O2 -fopenmp" \
-DCOMPEARTH_USE_MKL=TRUE \
-DMKL_LIBRARY="/opt/intel/mkl/lib/intel64_lin/libmkl_intel_lp64.so;/opt/intel/mkl/lib/intel64_lin/libmkl_sequential.so;/opt/intel/mkl/lib/intel64_lin/libmkl_core.so" \
-DMKL_INCLUDE_DIR=/opt/intel/mkl/include \
-DCOMPEARTH_BUILD_PYTHON_MODULE=ON
