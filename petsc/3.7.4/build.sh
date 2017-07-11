#!/bin/bash

export PETSC_DIR=$SRC_DIR
export PETSC_ARCH=arch-conda-c-opt


$PYTHON ./configure \
  LDFLAGS="$LDFLAGS" \
  --with-fc=0 \
  --with-debugging=0 \
  --COPTFLAGS=-O3 \
  --CXXOPTFLAGS=-O3 \
  --LIBS=-Wl,-rpath,$PREFIX/lib \
  --with-blas-lapack-lib=libopenblas${SHLIB_EXT} \
  --with-hwloc=0 \
  --with-mpi=1 \
  --with-pthread=1 \
  --with-ssl=0 \
  --with-suitesparse=1 \
  --with-x=0 \
  --with-parmetis=1 \
  --with-metis=1 \
  --with-superlu_dist=1 \
  --prefix=$PREFIX

sedinplace() { [[ $(uname) == Darwin ]] && sed -i "" $@ || sed -i"" $@; }
for path in $PETSC_DIR $PREFIX; do
    sedinplace s%$path%\${PETSC_DIR}%g $PETSC_ARCH/include/petsc*.h
done

make

if [[ $(uname) == Darwin ]]; then
    # FIXME: make check prevents upload on CircleCI
    # See https://github.com/conda-forge/conda-smithy/pull/337
    make check
fi

make install
