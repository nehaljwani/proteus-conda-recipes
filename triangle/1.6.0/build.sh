#!/usr/bin/env bash

cd src
platform=$(uname | tr [:upper:] [:lower:])
make -f triangleConfig/makefile.${platform}
make -f triangleConfig/makefile.${platform} trilibrary
cd ..
mkdir -p $PREFIX/bin
cp bin/triangle $PREFIX/bin
mkdir -p $PREFIX/lib
cp lib/libtri.a $PREFIX/lib
mkdir -p $PREFIX/include
cp src/triangle.h $PREFIX/include
