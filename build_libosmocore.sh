#!/bin/sh

DEST=$1
git clone --depth=1 git://git.osmocom.org/libosmocore
cd libosmocore
autoreconf --install --force

export PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig/
CC="gcc -m32" ./configure --disable-pcsc --prefix=$DEST --disable-gnutls
CC="gcc -m32" make -j 8 install
