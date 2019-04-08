# Nim wrappers for PB C++ code
We start with **pbbbam**, of course.

## To install pbbam
We use **pkg-config**, so do something like this:
```
PREFIX=$(pwd)/.git/PREFIX
meson --prefix=$PREFIX --buildtype=debug build
cd build
ninja -j2 install

export DYLD_LIBRARY_PATH=$PREFIX/lib
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
```

## Example

```
make dataset.exe
```
