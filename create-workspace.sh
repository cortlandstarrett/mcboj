#!/bin/bash
if [[ $# != 1 ]]; then
  echo "Usage:"
  echo "  ./create-workspace.sh <workspace>"
  exit 1
fi
echo "Preparing workspace..."
export WORKSPACE="$1"
mkdir -p $WORKSPACE/io.ciera.runtime
mkdir -p $WORKSPACE/mcooa
mkdir -p $WORKSPACE/org.xtuml.bp.ui.marking
OLD_PWD=$PWD
cd $WORKSPACE/io.ciera.runtime && unzip -q $HOME/.m2/repository/io/ciera/io.ciera.runtime/1.1.7/io.ciera.runtime-1.1.7.jar 
cd $WORKSPACE/mcooa && unzip -q $HOME/.m2/repository/org/xtuml/mcooa/1.0.0/mcooa-1.0.0.jar
cd $WORKSPACE/org.xtuml.bp.ui.marking && unzip -q $HOME/.m2/repository/org/xtuml/bp/org.xtuml.bp.ui.marking/6.18.0/org.xtuml.bp.ui.marking-6.18.0.jar
cd $OLD_PWD
$BPHOME/bridgepoint -nosplash -data $WORKSPACE -application org.eclipse.cdt.managedbuilder.core.headlessbuild -importAll $WORKSPACE
$BPHOME/bridgepoint -nosplash -data $WORKSPACE -application org.eclipse.cdt.managedbuilder.core.headlessbuild -importAll $PWD/model/mcboj
echo "Workspace set up: $WORKSPACE"
exit 0
