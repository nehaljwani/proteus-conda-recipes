#!/bin/bash

mkdir -p build
cd build

CC=mpicc CXX=mpicxx cmake \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DCMAKE_PREFIX_PATH="$PREFIX" \
  -DENABLE_PETSC:BOOL=ON \
  -DENABLE_PETSC4PY:BOOL=ON \
  -DENABLE_FLTK:BOOL=OFF \
  -DENABLE_BUILD_SHARED:BOOL=ON \
  -DENABLE_WRAP_PYTHON:BOOL=ON \
  ..

make
make install
