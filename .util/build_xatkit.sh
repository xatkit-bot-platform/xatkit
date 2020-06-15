# Xatkit build script

# Print a message
e() {
    echo -e "$1"
}

main() {
	e "Building Xatkit"
    e "Please wait..."
    git submodule update --init --recursive  > /dev/null
    ./build.sh --all --skip-tests --product  > /dev/null
    e "Finished building Xatkit"
}

main
