into_source findutils-4.9.0

./configure --prefix=/usr \
    --localstatedir=/var/lib/locate \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess)

make && make DESTDIR=$ROOT install