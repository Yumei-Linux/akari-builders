into_source linux-6.1.11

make mrproper
make headers

find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $ROOT/usr