#!/bin/bash

set -e

# Bazel self-extractable installer
# Installation and etc prefix can be overriden from command line
install_prefix=${1:-"/usr/local"}

install_prefix="safd"

if [ -z "$install_prefix" ]
then
	echo "prefix no installed"
else
	echo "prefix installed"
fi

exit 0
