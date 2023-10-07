into_source gzip-1.12
./configure --prefix=/usr --host=$YUMEI_TGT
make && make DESTDIR=$ROOT install
