To use:
```
PREFIX=$(pwd)/.git/PREFIX
meson --prefix=$PREFIX --buildtype=debug build
cd build
ninja -j2 install

export DYLD_LIBRARY_PATH=$PREFIX/lib
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
```
Then
```
cd nim
make
```
