. $(dirname $0)/configure.sh ${@}

for item in $(ls ./); do
    if [[ "$item" != "configure.sh" && "$item" != "main.sh" ]]; then
        . $(dirname $0)/$item ${@}
    fi
done