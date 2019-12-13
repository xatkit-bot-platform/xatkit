#!/bin/bash

echo "Creating environment variable XATKIT_DEV"

export XATKIT_DEV=$(dirname $(realpath -- $BASH_SOURCE))

echo "Done, if you want to store the variable permanently add the following line in your .bashrc file"
echo "export XATKIT_DEV=$XATKIT_DEV"
