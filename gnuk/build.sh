#!/bin/bash
set -euxo pipefail

[ -d gnuk ] || git clone --recursive https://salsa.debian.org/gnuk-team/gnuk/gnuk.git

cd gnuk/src
make clean
./configure --vidpid=234b:0000 --target=ST_DONGLE
make
