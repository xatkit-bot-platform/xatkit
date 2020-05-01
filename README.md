Xatkit - The easiest way to build advanced (chat)bots and digital assistants
======

[![Wiki Badge](https://img.shields.io/badge/doc-wiki-blue)](https://github.com/xatkit-bot-platform/xatkit/wiki)


*Get get your own smart chatbot. Design your bot once, deploy it everywhere*

Xatkit has been created to reduce boilerplate code, complex API understanding, and technical details to facilitate the definition and deployment of your bots. Xatkit helps you focus on what really matters: **the conversation logic you want to embed in your chatbot**. 

To do so, we have baked a **chatbot-specific definition language** to specify user intentions, receive events (your bots can also be proactive!), and bind them to computable actions following powerful [state machine semantics](https://xatkit.com/chatbot-dsl-state-machines-xatkit-language/). The produced chatbot *specification* is handled by the **Xatkit Runtime Engine**, which automatically manages its deployment and execution. See some [examples](https://xatkit.com/chatbot-examples/) of what you can do with Xatkit!. Reuse the existing platforms (or add your own) to make your bot *talk* with external services (Slack, GitHub, websites,...).

![Overview](https://raw.githubusercontent.com/wiki/xatkit-bot-platform/xatkit/img/overview.png)

## Quick Start

1- [Build the latest version of Xatkit](https://github.com/xatkit-bot-platform/xatkit/wiki/Build-Xatkit)

2- Setup the environment variable

**Windows**

Execute `xatkit/install-windows.bat` with administrative rights

**Ubuntu**

Execute `xatkit/install-linux.sh`

3- Navigate to `xatkit/bin` and start the example digital assistant

The example assistant is a basic web-based bot that greets users, it is defined in `xatkit/examples/GreetingsBot`.

**Windows**

```bash
./start-xatkit-windows.sh ../examples/GreetingsBots/GreetingsBot/GreetingsBot.properties
```

**Ubuntu**

```bash
./start-xatkit-linux.sh ../examples/GreetingsBots/GreetingsBot/GreetingsBot.properties
```

The console will log some initialization information, and after a few seconds you should see the following message:

```bash
You can test your chatbot here http://localhost:5000/admin (note that the bots behavior can be slightly different on the test page than when it is deployed on a server)
```

Open your browser and navigate to http://localhost:5000/admin to test your deployed web-based bot! Remember this bot is just a greetings bot to test your installation so beyond saying 'Hi', the bot will respond to everything else with the default answer!. Also, to simplify its configuration, this sample bot just uses regular expression to match your intent but you could easily configure it to [use a real NLP such as DialogFlow](https://github.com/xatkit-bot-platform/xatkit/wiki/Integrating-DialogFlow). You can see a more complete online demo by talking to **Xat**, the bot waiting to assist you in [our home page](https://xatkit.com/). 

![Greetings Bot Example](https://raw.githubusercontent.com/wiki/xatkit-bot-platform/xatkit/img/greetings-bot-example.gif)

## What platforms are available in Xatkit?

Xatkit supports over a dozen platforms (and counting) such as Slack, Github, React ... You can find the full list of supported platform in our [wiki](https://github.com/xatkit-bot-platform/xatkit/wiki).


## What's next?

Congratulations, you just started your first Xatkit digital assistant!

You can now have a look at the [tutorial](https://github.com/xatkit-bot-platform/xatkit/wiki/Getting-Started) to learn how assistants are defined with the Xatkit language, or if you are already familiar with it you can take a look at the [documentation](https://github.com/xatkit-bot-platform/xatkit/wiki) for additional information on Xatkit capabilities.

## Troubleshooting

If you experience any issue with Xatkit you can open an issue on [our tracker](https://github.com/xatkit-bot-platform/xatkit/issues) and we will be happy to help you! Note that we may move your issue to a different repository based on the impacted components.

## Contributing

You want to contribute to Xatkit? We would love to hear from you. Remember that there are [many ways to support open source projects](https://livablesoftware.com/5-ways-to-thank-open-source-maintainers/) beyond committing code!. Talking about Xatkit, writing documentation, contributing examples,... all are great ways to help us.

And, of course, if you want/can fix bugs and/or implement new features for Xatkit, do not not hesitate to create a pull-request on the repository you updated and we will be happy to review your code and help you!

## Contact

Feel free to [reach out by mail](mailto:admin@xatkit.com) or [ping us in social media](https://twitter.com/xatkit). 

## Website

[Xatkit.com](https://xatkit.com/)


