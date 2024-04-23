#!/bin/bash
set -e

# install fnm
curl -fsSL https://fnm.vercel.app/install | bash

# configure fnm it
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env --shell=bash`"

# install node 18
fnm install 18
npm install -g yarn