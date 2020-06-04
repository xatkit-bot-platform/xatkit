# Start GreetingsBot
# Print a message
e() {
    echo -e "$1"
}

main() {
	e "Deploying GreetingsBot"
    cd $XATKIT/bin
    ./start-xatkit-linux.sh ../examples/GreetingsBots/GreetingsBot/GreetingsBot.properties &
}

main
