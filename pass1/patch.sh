into_source patch-2.7.6

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess)

make && make DESTDIR=$ROOT install