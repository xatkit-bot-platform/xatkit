#!/bin/bash

echo "Creating environment variable XATKIT"

export XATKIT=$(dirname $(realpath -- $BASH_SOURCE))

echo "Done, if you want to store the variable permanently add the following line in your .bashrc file"
echo "export XATKIT=$XATKIT"