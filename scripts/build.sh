#!/usr/bin/env bash

cwd=$(pwd)

mkdir $cwd/build
cd $cwd/build
cmake -DCMAKE_CXX_COMPILER=g++ ..
make
./hello
