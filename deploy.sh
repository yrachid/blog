#!/bin/bash -eu

git submodule init themes/coder

git submodule update themes/coder

rm -rf public/

mkdir public

cp now.json public/

hugo -v

ls -la public/

now public/

now alias
