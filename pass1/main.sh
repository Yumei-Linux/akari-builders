right_pth() {
    cd ${@}/sources/builders/pass1
}

right_pth ${@}

. configure.sh ${@}

packages=(
    binutils.sh
    gcc.sh
    linux-api-headers.sh
    glibc.sh
    libstdcpp.sh
    m4.sh
    ncurses.sh
    bash.sh
    coreutils.sh
    diffutils.sh
    file.sh
    findutils.sh
    gawk.sh
    grep.sh
    gzip.sh
    make.sh
    patch.sh
    sed.sh
    tar.sh
    xz.sh
)

for pkg in ${packages[@]}; do
    right_pth ${@}
    . $pkg ${@} || exit 1
done
