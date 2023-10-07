into_source sed-4.9

./configure --prefix=/usr \
    --host=$YUMEI_TGT

make && make DESTDIR=$ROOT install
