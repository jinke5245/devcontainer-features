#!/usr/bin/env bash

set -e

# Checks if packages are installed and installs them if not
check_packages() {
  if ! dpkg -s "$@" >/dev/null 2>&1; then
    apt-get update -y
    apt-get -y install --no-install-recommends "$@"
  fi
}

# Install capnproto
install() {
  curl -O https://capnproto.org/capnproto-c++-$VERSION.tar.gz
  tar zxf capnproto-c++-$VERSION.tar.gz && rm capnproto-c++-$VERSION.tar.gz
  cd capnproto-c++-$VERSION
  ./configure
  make -j6 check
  sudo make install
}

# Install dependencies
check_packages ca-certificates curl tar make

install

echo "Done!"