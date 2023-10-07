into_source file-5.45

mkdir -pv build

pushd build
    ../configure --disable-bzlib \
        --disable-libseccomp \
        --disable-xzlib \
        --disable-zlib

    make
popd

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$ROOT install
rm -v $ROOT/usr/lib/libmagic.la
