#!/bin/bash
set -e

source /opt/axis/acapsdk/environment-setup*

make clean

cp -Rf ./ /tmp/build/
mv /tmp/build ./
cd build/

acap-build .
