into_source gcc-12.2.0

tar -xvf ../mpfr-4.2.0.tar.xz
tar -xvf ../gmp-6.2.1.tar.xz
tar -xvf ../mpc-1.3.1.tar.gz

mv -v mpfr-4.2.0 mpfr
mv -v gmp-6.2.1 gmp
mv -v mpc-1.3.1 mpc

case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
    ;;
esac

sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir -pv build ; cd build

../configure \
    --build=$(../config.guess) \
    --host=$YUMEI_TGT \
    --target=$YUMEI_TGT \
    LDFLAGS_FOR_TARGET=-L$PWD/$YUMEI_TGT/libgcc \
    --prefix=/usr \
    --with-build-sysroot=$ROOT \
    --enable-default-pie \
    --enable-default-ssp \
    --disable-nls \
    --disable-multilib \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --enable-languages=c,c++

make && make DESTDIR=$ROOT install

ln -sv gcc $ROOT/usr/bin/cc