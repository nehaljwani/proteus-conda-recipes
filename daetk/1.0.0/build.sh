#!/usr/bin/env bash

export DAETK_DIR=$SRC_DIR
export DAETK_ARCH=linux
export PETSC_DIR=$PREFIX
export PETSC=$PETSC_DIR
export MPICXX=$PREFIX/bin/mpicxx
export MPICC=$PREFIX/bin/mpicc
export MPIF77=$PREFIX/bin/mpif77

touch dep.txt

make
mkdir -p $PREFIX/lib
cp libdaetk.* $PREFIX/lib
mkdir -p $PREFIX/include
cp *.h $PREFIX/include
cp -r pete/pete-2.1.0/src/PETE $PREFIX/include
