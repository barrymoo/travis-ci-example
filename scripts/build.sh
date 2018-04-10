#!/usr/bin/env bash

#!/usr/bin/env bash
cwd=$(pwd)

# Generate compile_commands.json
mkdir $cwd/build
cd $cwd/build
cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

# Lint the code
cd $cwd
ln -s build/compile_commands.json
clang-tidy hello.cpp --checks=clang-*,modernize-*

# Build and run the code
cd $cwd/build
make
./hello
