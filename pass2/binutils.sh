into_source binutils-2.41

sed '6009s/$add_dir//' -i ltmain.sh

mkdir -pv build && cd build

../configure --prefix=/usr \
    --build=$(../config.guess) \
    --host=$YUMEI_TGT \
    --disable-nls \
    --enable-shared \
    --enable-gprofng=no \
    --disable-werror \
    --enable-64-bit-bfd

make && make DESTDIR=$ROOT install
rm -v $ROOT/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}
