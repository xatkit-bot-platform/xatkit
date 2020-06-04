# Start GreetingsBot
# Print a message
e() {
    echo -e "$1"
}

main() {
	e "Deploying GreetingsBot"
    cd $XATKIT/bin
    chmod +x start-xatkit-linux.sh
    ./start-xatkit-linux.sh ../examples/GreetingsBots/GreetingsBot/GreetingsBot.properties  > /dev/null &
}

main
