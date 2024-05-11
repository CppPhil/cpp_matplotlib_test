#!/bin/bash

readonly DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd "$DIR" > /dev/null

echo "Patching matplotlib-cpp ..."
pushd external/matplotlib-cpp > /dev/null
git apply "$DIR/git_patches/matplotlibcpp_patch.diff"
popd > /dev/null
echo "Patched matplotlib-cpp."

echo "Generating build files ..."
cmake -G "Visual Studio 17 2022" -A x64 -S . -B build
echo "Build files generated."

echo "Building project ..."
cmake --build build --config Release --parallel 4
echo "Project built."

echo "Removing matplotlib-cpp patch ..."
pushd external/matplotlib-cpp > /dev/null
git checkout matplotlibcpp.h > /dev/null
popd > /dev/null
echo "Removed matplotlib-cpp patch."

popd > /dev/null
echo "Build completed."

exit 0
