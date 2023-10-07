export ROOT=${@}
export SOURCE_ROOT=${ROOT}/sources
export YUMEI_TGT=$(uname -m)-yumei-linux-gnu
export CONFIG_SITE=$ROOT/usr/share/config.site
export MAKEFLAGS="-j8"
export LC_ALL=POSIX

# configuring make
alias make="make ${MAKEFLAGS}"

# configuring PATH
PATH=/usr/bin:$ROOT/tools/bin:$PATH

if [ ! -L /bin ]; then
    PATH=/bin:$PATH
fi

export PATH

into_source() {
    cd ${SOURCE_ROOT}
    if [ -d ${@} ]; then
        rm -rvf ${@}
    fi

    tar -xvf ${SOURCE_ROOT}/${@}.*
    cd ${SOURCE_ROOT}/${@}
}
