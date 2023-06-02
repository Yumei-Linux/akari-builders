into_source binutils-2.40

mkdir -pv build ; cd build

../configure --prefix=$ROOT/tools \
    --with-sysroot=$ROOT \
    --target=$YUMEI_TGT \
    --disable-nls \
    --enable-gprofng=no \
    --disable-werror

make && make install