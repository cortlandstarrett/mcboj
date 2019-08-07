MC-Boj
======

Ada 2012 model compiler

## System requirements

- Python
- Maven: https://maven.apache.org/
- GNAT: https://www.adacore.com/community
- pyxtuml (installed from source): https://github.com/xtuml/pyxtuml
- BridgePoint (nightly build): https://xtuml.org/download/

## Installing pyxtuml

Some recent changes to pyxtuml that have not yet been released are required for
this project. Use the following instructions to install pyxtuml.

1. Clone the repository
   ```
   git clone https://github.com/xtuml/pyxtuml.git
   ```
2. Run the installation script
   ```
   cd pyxtuml
   python setup.py install
   ```

## Building MC-Boj

1. Navigate to the source project directory
   ```
   cd model/mcboj
   ```
2. Install the project with maven
   ```
   mvn install
   ```

## Building/running the example

1. Launch BridgePoint. In a new workspace, import the MicrowaveOven model from
   the welcome page.
2. Load and persist the model.
   - _This is required so the model data matches the latest schema for the
     pyxtuml prebuild_
3. Navigate to the example directory
   ```
   cd example
   ```
4. Build the project
   ```
   ./build.sh <path_to_MicrowaveOven_project>
   ```
5. Run the project
   ```
   ./bin/defineoven
   ```

## Preparing a development workspace

A convenience script has been included to prepare a workspace for development
with the required projects.

```
./create-workspace.sh <desired_workspace_location>
```

**NOTE: The script marks the referred to projects as _read only_. This is
intentional as they are meant as library projects only. Edits to them will have
to be committed to their upstream repositories if they really need to change**
