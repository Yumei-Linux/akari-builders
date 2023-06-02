into_source gcc-12.2.0

mkdir -pv build ; cd build

../libstdc++-v3/configure \
    --host=$YUMEI_TGT \
    --build=$(../config.guess) \
    --prefix=/usr \
    --disable-multilib \
    --disable-nls \
    --disable-libstdcxx-pch \
    --with-gxx-include-dir=/tools/$YUMEI_TGT/include/c++/12.2.0

make && make DESTDIR=$ROOT install
rm -v $ROOT/usr/lib/lib{stdc++,stdc++fs,supc++}.la