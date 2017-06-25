
set -e
mpic++ $CXXFLAGS "-I$PREFIX/include" "-L$PREFIX/lib" "${RECIPE_DIR}/test/test_ptscotch.cxx" -o test_ptscotch -DSCOTCH_PTSCOTCH -lptscotch -lptscotcherr

if [[ "$(uname)" == "Darwin" ]]; then
    # FIXME: mpiexec messes with docker (CircleCI) builds
    mpiexec -n 2 ./test_ptscotch
fi
