#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

# install dependencies for build
# this is taken from /.github/workflows/ci.yml
apt-get update -y
apt-get upgrade -y --fix-missing
apt-get install -y  --fix-missing pkg-config \
  dbus \
  xvfb \
  libgtk-3-0 \
  libxkbfile-dev \
  libkrb5-dev \
  libgbm1 \
  rpm \
  curl \
  zip \
  unzip \
  build-essential \
  libsecret-1-dev \
  coreutils \
  git \
  zstd
