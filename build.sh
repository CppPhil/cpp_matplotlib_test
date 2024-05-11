#!/bin/bash

if [ -d "build" ]; then
  rm -rf build
fi

cmake -G "Visual Studio 17 2022" -A Win64 -S . -B build
cmake --build build --config Release --parallel 4
