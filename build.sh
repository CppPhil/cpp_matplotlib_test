#!/bin/bash

readonly DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -d "build" ]; then
  rm -rf build
fi

pushd "$DIR" > /dev/null
pushd external/matplotlib-cpp > /dev/null
git apply "$DIR/git_patches/matplotlibcpp_patch.diff"
popd > /dev/null

cmake -G "Visual Studio 17 2022" -A x64 -S . -B build
cmake --build build --config Release --parallel 4

pushd external/matplotlib-cpp > /dev/null
git checkout matplotlibcpp.h
popd > /dev/null
popd > /dev/null

exit 0
