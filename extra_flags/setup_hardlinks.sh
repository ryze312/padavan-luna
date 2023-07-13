#!/bin/sh
ROOT=$(dirname $(realpath $0))
find "${ROOT}/../bin_original" ! -type d -exec sh -c 'ln -P wrapper.sh $(basename $1)' _ {} \;
