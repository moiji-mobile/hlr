#!/bin/sh

DEST=$1
git clone --depth=1 git://git.osmocom.org/libosmocore
cd libosmocore
autoreconf --install --force

# hack... need to fix this later..
sed -i s,"comp128;","comp128v1;comp128v2;comp128v3;", src/gsm/libosmogsm.map

export PKG_CONFIG_PATH=/usr/lib/i386-linux-gnu/pkgconfig/
CC="gcc -m32" ./configure --disable-pcsc --prefix=$DEST
CC="gcc -m32" make -j 8 install
