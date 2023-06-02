into_source bash-5.2.15

./configure --prefix=/usr \
    --build=$(sh support/config.guess) \
    --host=$YUMEI_TGT \
    --without-bash-malloc

make && make DESTDIR=$ROOT install

ln -sv bash $ROOT/bin/sh