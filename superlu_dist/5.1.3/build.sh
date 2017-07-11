#!/bin/bash

mkdir -p build
cd build

export CFLAGS="$CFLAGS -std=c99"

cmake \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_PREFIX_PATH="$PREFIX" \
  -DTPL_PARMETIS_LIBRARIES="$PREFIX/lib/libparmetis.so" \
  -DTPL_PARMETIS_INCLUDE_DIRS="$PREFIX/include" \
  -DBUILD_SHARED_LIBS="ON" \
  ..

make
make install
