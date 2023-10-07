into_source coreutils-9.3

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(build-aux/config.guess) \
    --enable-install-program=hostname \
    --enable-no-install-program=kill,uptime

make && make DESTDIR=$ROOT install

mv -v $ROOT/usr/bin/chroot $ROOT/usr/sbin
mkdir -pv $ROOT/usr/share/man/man8
mv -v $ROOT/usr/share/man/man1/chroot.1 $ROOT/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' $ROOT/usr/share/man/man8/chroot.8
