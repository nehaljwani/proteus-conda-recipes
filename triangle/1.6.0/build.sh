#!/usr/bin/env bash

cd src
make -f triangleConfig/makefile.linux
make -f triangleConfig/makefile.linux trilibrary
cd ..
mkdir -p $PREFIX/bin
cp bin/triangle $PREFIX/bin
mkdir -p $PREFIX/lib
cp lib/libtri.a $PREFIX/lib
mkdir -p $PREFIX/include
cp src/triangle.h $PREFIX/include
