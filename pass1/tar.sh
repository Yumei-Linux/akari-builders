into_source tar-1.34

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess)

make && make DESTDIR=$ROOT install