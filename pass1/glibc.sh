into_source glibc-2.37

case $(uname -m) in
    i?86) ln -sfv ld-linux.so.2 $ROOT/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $ROOT/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $ROOT/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.37-fhs-1.patch

mkdir -pv build ; cd build

echo "rootsbindir=/usr/sbin" > configparms

../configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(../scripts/config.guess) \
    --enable-kernel=3.2 \
    --with-headers=$ROOT/usr/include \
    libc_cv_slibdir=/usr/lib

make
make DESTDIR=$ROOT install

sed '/RTLDLIST=/s@/usr@@g' -i $ROOT/usr/bin/ldd

$ROOT/tools/libexec/gcc/$YUMEI_TGT/12.2.0/install-tools/mkheaders