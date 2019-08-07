#!/bin/bash

CIERA_RUNTIME_VERSION=1.1.7
MCBOJ_VERSION=0.0.1

# check arguments
if [[ $# < 1 ]]; then
  echo "Usage:"
  echo "  ./run_mcboj <project_path>"
  exit 1
fi

CLASSPATH=~/.m2/repository/io/ciera/io.ciera.runtime/$CIERA_RUNTIME_VERSION/io.ciera.runtime-$CIERA_RUNTIME_VERSION.jar:~/.m2/repository/org/antlr/antlr4-runtime/4.7.1/antlr4-runtime-4.7.1.jar:~/.m2/repository/org/xtuml/mcboj/$MCBOJ_VERSION-SNAPSHOT/mcboj-$MCBOJ_VERSION-SNAPSHOT.jar

# prepare build space
mkdir -p gen/code_generation/_ada

# prebuild
PRE_BUILD_OUT=gen/code_generation/_system.sql
echo "Pre-building..."
python -m bridgepoint.prebuild -o $PRE_BUILD_OUT $@

# run compiler
echo "Generating..."
java -cp $CLASSPATH mcboj.McbojApplication -i $PRE_BUILD_OUT --cwd . --gendir gen/code_generation/_ada

# prepare build space
mkdir -p gen/code_generation/build

# prepare output space
mkdir -p bin

# copy source into _ada folder
mkdir -p gen/code_generation/_ada
cp src/* gen/code_generation/_ada

# compile
echo "Compiling..."
cd gen/code_generation/build
gnat make ../_ada/*

# copy executable
cp defineoven ../../../bin

echo "Done."
exit 0
