#!/usr/bin/env bash

#!/usr/bin/env bash
cwd=$(pwd)

echo "--> Run cmake, generate compile_commands.json <--"
mkdir $cwd/build
cd $cwd/build
cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

echo "--> Static Analysis <--"
cd $cwd
ln -s build/compile_commands.json
clang-check -analyze hello.cpp

echo "--> Build and Run Code <--"
cd $cwd/build
make
./hello
