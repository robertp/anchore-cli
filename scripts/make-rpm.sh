#!/bin/bash -x
set -e

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/ci/utils"

print_colorized INFO "Package Anchore CLI for RH-based distros."; echo

print_colorized INFO "Installing dependencies."; echo

python setup.py bdist_rpm --requires="python python-setuptools python2-clint PyYAML python-requests python-click pyOpenSSL python-jsonschema python-prettytable" --build-requires="python python-setuptools" --release="0"

print_colorized INFO "Cleaning up."; echo

python setup.py clean --all
