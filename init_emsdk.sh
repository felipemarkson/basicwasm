#!/bin/bash
EMSDK_VERSION="3.1.63"

if [ ! -f ./emsdk/emsdk ]; then
    echo "emsdk not found. Did you clone the submodule?" >&2
    exit 1
fi

./emsdk/emsdk install $EMSDK_VERSION >/dev/null
./emsdk/emsdk activate $EMSDK_VERSION >/dev/null
