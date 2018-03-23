#!/bin/bash -eu

git submodule init themes/coder

git submodule update themes/coder

rm -rf public/

hugo -v

cd public

now --public

cd -
