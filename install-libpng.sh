#! /bin/bash

set -xe

source /entrypoint.sh
yum install -y xz automake autoconf libtool zlib-devel patch

wget -O- https://sourceforge.net/projects/libpng/files/libpng16/"$LIBPNG_VERSION"/libpng-"$LIBPNG_VERSION".tar.xz/download | tar xJ

cd libpng-"$LIBPNG_VERSION"

export CHOST="$DEBARCH"

# https://sourceforge.net/p/libpng/bugs/227/
export CFLAGS="-I/deps/include"
export CPPFLAGS="$CFLAGS"
export LDFLAGS="-L/deps/lib"

./configure --prefix=/usr/local --target="$CHOST" --host="$CHOST"

# build and install into prefix
make all -j$(nproc)
make install

cd ..

rm -rf libpng-"$LIBPNG_VERSION"/
