right_pth() {
    cd ${@}/sources/builders/pass1
}

right_pth

. configure.sh ${@}

for item in $(ls ./); do
    if [[ "$item" != "configure.sh" && "$item" != "main.sh" ]]; then
        right_pth
        . $item ${@}
    fi
done