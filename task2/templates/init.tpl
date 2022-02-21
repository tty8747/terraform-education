#!/usr/bin/env bash

# set -o errexit
# set -o nounset
# set -o pipefail

# Build and install AWS EFS Utilities
sudo apt-get update -yq
packages="${packages}"
sudo apt-get -yq install $packages
