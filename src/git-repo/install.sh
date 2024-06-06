#!/bin/sh

set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/curl-apt-get:1.0.7"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/python:1.1.0" \
    --option installTools='false' --option OVERRIDEDEFAULTVERSION='false' --option version='3.10.8'

curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod a+rx /usr/local/bin/repo
