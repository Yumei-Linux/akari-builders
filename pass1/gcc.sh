into_source gcc-13.2.0

tar -xvf ../mpfr-4.2.0.tar.xz
tar -xvf ../gmp-6.3.0.tar.xz
tar -xvf ../mpc-1.3.1.tar.gz

mv -v mpfr-4.2.0 mpfr
mv -v gmp-6.3.0 gmp
mv -v mpc-1.3.1 mpc

case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
    ;;
esac

mkdir -pv build ; cd build

../configure \
    --target=$YUMEI_TGT \
    --prefix=$ROOT/tools \
    --with-glibc-version=2.38 \
    --with-sysroot=$ROOT \
    --with-newlib \
    --without-headers \
    --enable-default-pie \
    --enable-default-ssp \
    --disable-nls \
    --disable-shared \
    --disable-multilib \
    --disable-threads \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-libstdcxx \
    --enable-languages=c,c++

make && make install

cd ..

cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
    `dirname $($YUMEI_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
