#!/bin/bash -eu

git submodule init themes/coder

git submodule update themes/coder

rm -rf public/

hugo -v

cp now.json public/

cd public

now

cd -
