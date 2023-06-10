#!/bin/sh
BIN=$(basename $0)
ROOT=$(dirname $(realpath $0))
ORIGINAL_BIN="${ROOT}/../bin_original/${BIN}"

COMPILER_FLAGS="-O3"
LINKER_FLAGS="-O3"

if [[ "$BIN" == *"c++"* ||  "$BIN" == *"g++"* || "$BIN" == *"gcc"* ]]
then
    FLAGS="$COMPILER_FLAGS"
elif [[ "$BIN" == *"ld"* ]]
then
    FLAGS="$LINKER_FLAGS"
fi

exec "${ORIGINAL_BIN}" "$@" $FLAGS
