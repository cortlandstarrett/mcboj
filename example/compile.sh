#!/bin/bash

# prepare build space
mkdir -p gen/code_generation/build

# prepare output space
mkdir -p bin

# copy source into _ada folder
mkdir -p gen/code_generation/_ada
cp src/* gen/code_generation/_ada

# compile
cd gen/code_generation/build
gnat make ../_ada/*

# copy executable
cp defineoven ../../../bin

exit 0
