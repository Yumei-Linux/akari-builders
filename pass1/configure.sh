export ROOT=${@}
export SOURCE_ROOT=${ROOT}/sources
export YUMEI_TGT=$(uname -m)-yumei-linux-gnu
export CONFIG_SITE=$ROOT/usr/share/config.site
export LC_ALL=POSIX

# configuring PATH
PATH=/usr/bin
if [ ! -L /bin ]; then
    PATH=/bin:$PATH
fi

PATH=$ROOT/tools/bin:$PATH

export PATH

into_source() {
    cd ${SOURCE_ROOT}
    if [ -d ${@} ]; then
        rm -rvf ${@}
    fi

    tar -xvf ${SOURCE_ROOT}/${@}.*
    cd ${SOURCE_ROOT}/${@}
}