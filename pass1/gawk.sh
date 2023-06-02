into_source gawk-5.2.1

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess)

make && make DESTDIR=$ROOT install