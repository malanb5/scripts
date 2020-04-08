#!/bin/bash

set -e

# Bazel self-extractable installer

# Installation and etc prefix can be overriden from command line
install_prefix=${1:-"/usr/local"}

echo "$install_prefix"

if [ -z "${JAVA_HOME-}" ];
then
	echo "prefix no installed"
else
	echo "prefix installed"
fi

exit 0
