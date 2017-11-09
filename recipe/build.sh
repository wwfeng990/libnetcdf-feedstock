#!/bin/bash

export CFLAGS="$CFLAGS -I$PREFIX/include"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib"

# Build static.
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
<<<<<<< HEAD
      -D CMAKE_BUILD_TYPE=Release \
=======
      -D CMAKE_C="$CC" \
      -D CMAKE_CXX="$CXX" \
>>>>>>> remove vc features (use run_exports vc pkg instead)
      -D CMAKE_INSTALL_LIBDIR:PATH=$PREFIX/lib \
      -D ENABLE_DAP=ON \
      -D ENABLE_HDF4=ON \
      -D ENABLE_NETCDF_4=ON \
      -D BUILD_SHARED_LIBS=OFF \
      -D ENABLE_TESTS=OFF \
      -D BUILD_UTILITIES=ON \
      -D ENABLE_DOXYGEN=OFF \
      -D ENABLE_LOGGING=ON \
      -D CURL_INCLUDE_DIR=$PREFIX/include \
      -D CURL_LIBRARY=$PREFIX/lib/libcurl${SHLIB_EXT} \
      -D ENABLE_CDF5=ON \
      $SRC_DIR
make -j$CPU_COUNT
# ctest  # Run only for the shared lib build to save time.
make install -j$CPU_COUNT
make clean

# Build shared.
cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
<<<<<<< HEAD
      -D CMAKE_BUILD_TYPE=Release \
=======
      -D CMAKE_C_FLAGS="$CFLAGS" \
>>>>>>> remove vc features (use run_exports vc pkg instead)
      -D CMAKE_INSTALL_LIBDIR:PATH=$PREFIX/lib \
      -D ENABLE_DAP=ON \
      -D ENABLE_HDF4=ON \
      -D ENABLE_NETCDF_4=ON \
      -D BUILD_SHARED_LIBS=ON \
      -D ENABLE_TESTS=OFF \
      -D BUILD_UTILITIES=ON \
      -D ENABLE_DOXYGEN=OFF \
      -D ENABLE_LOGGING=ON \
      -D CURL_INCLUDE_DIR=$PREFIX/include \
      -D CURL_LIBRARY=$PREFIX/lib/libcurl${SHLIB_EXT} \
      -D ENABLE_CDF5=ON \
      -D ENABLE_HDF4_FILE_TESTS=OFF \
      $SRC_DIR
make -j$CPU_COUNT
make install -j$CPU_COUNT
ctest
