#!/bin/bash
set -euxo pipefail

[ -d u2f-token ] || git clone --recursive https://github.com/gl-sergei/u2f-token.git

cd u2f-token/src
make clean
make TARGET=ST_DONGLE_NO_PUSH ENFORCE_DEBUG_LOCK=1
