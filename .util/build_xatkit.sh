# Xatkit build script

# Print a message
e() {
    echo -e "$1"
}

main() {
	e "Started building Xatkit"
    git submodule update --init --recursive
    ./build.sh --all --skip-tests --product
    e "Finished building Xatkit"
}

main
