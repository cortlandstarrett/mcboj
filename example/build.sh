#!/bin/bash

# check arguments
if [[ $# != 1 ]]; then
  echo "Usage:"
  echo "  ./run_mcboj <project_path>"
  exit 1
fi

PROJECT_DIR=$1
CLASSPATH=~/.m2/repository/io/ciera/io.ciera.runtime/1.1.7/io.ciera.runtime-1.1.7.jar:~/.m2/repository/org/antlr/antlr4-runtime/4.7.1/antlr4-runtime-4.7.1.jar:~/.m2/repository/org/xtuml/mcboj/0.0.1-SNAPSHOT/mcboj-0.0.1-SNAPSHOT.jar

# prepare build space
mkdir -p gen/code_generation/_ada

# prebuild
PRE_BUILD_OUT=gen/code_generation/_system.sql
echo "Pre-building..."
python -m bridgepoint.prebuild -o $PRE_BUILD_OUT $PROJECT_DIR/models

# run compiler
echo "Generating..."
java -cp $CLASSPATH mcboj.McbojApplication -i $PRE_BUILD_OUT --cwd . --gendir gen/code_generation/_ada

exit 0
