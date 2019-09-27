#!/bin/sh

LANG=$1
SPEC_TAG=$2
VER=${SPEC_TAG:1}

generate-vspk -f /api-specifications --generation-version $VER -L $LANG -b $SPEC_TAG
mv ./codegen/* /out
