into_source grep-3.8

./configure --prefix=/usr \
    --host=$YUMEI_TGT

make && make DESTDIR=$ROOT install