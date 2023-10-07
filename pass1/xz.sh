into_source xz-5.4.4

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess) \
    --disable-static \
    --docdir=/usr/share/doc/xz-5.4.4

make && make DESTDIR=$ROOT install
rm -v $ROOT/usr/lib/liblzma.la
