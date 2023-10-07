into_source ncurses-6.4

sed -i s/mawk// configure

mkdir -pv build

pushd build
    ../configure
    make -C include
    make -C progs tic
popd

./configure --prefix=/usr \
    --host=$YUMEI_TGT \
    --build=$(./config.guess) \
    --mandir=/usr/share/man \
    --with-manpage-format=normal \
    --with-shared \
    --without-normal \
    --with-cxx-shared \
    --without-debug \
    --without-ada \
    --disable-stripping \
    --enable-widec

make

make DESTDIR=$ROOT TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $ROOT/usr/lib/libncurses.so
