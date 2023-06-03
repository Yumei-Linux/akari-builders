right_pth() {
    cd ${@}/sources/builders/pass2
}

right_pth ${@}

. configure.sh ${@}

packages=(
    binutils.sh
    gcc.sh
)

for pkg in ${packages[@]}; do
    right_pth ${@}
    . $pkg ${@} || exit 1
done