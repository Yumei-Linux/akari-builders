. configure.sh ${@}

for item in $(ls ./); do
    if [[ "$item" != "configure.sh" && "$item" != "main.sh" ]]; then
        . "$item" ${@}
    fi
done