into_source make-4.4

sed -e '/ifdef SIGPIPE/,+2 d' \
    -e '/undef FATAL_SIG/i FATAL_SIG (SIGPIPE);' \
    -i src/main.c

./configure --prefix=/usr \
    --without-guile \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess)

make && make DESTDIR=$ROOT install