Xatkit - The easiest way to build complex digital assistants
======

[![Download Badge](https://img.shields.io/badge/download-4.0.0-blue)](https://github.com/xatkit-bot-platform/xatkit-runtime/releases/latest) [![Wiki Badge](https://img.shields.io/badge/doc-wiki-blue)](https://github.com/xatkit-bot-platform/xatkit/wiki)


*Model your bot once, deploy everywhere*

Xatkit has been created to reduce boilerplate code, complex API understanding, and platform-specific deployment of your bots. Xatkit helps you focus on what really matters: **the conversation logic you want to embed in your chatbot**. 

To do so, we have baked a **chatbot-specific definition language** to specify user intentions, receive events, and bind them to computable actions. The produced chatbot *specification* is handled by the **Xatkit Runtime Engine**, which automatically manages its deployment and execution.

![Overview](https://raw.githubusercontent.com/wiki/xatkit-bot-platform/xatkit/img/overview.png)

## Quick Start

1- Download the [latest release](https://github.com/xatkit-bot-platform/xatkit-releases/releases/tag/4.0.0) and extract *xatkit_4.0.0.zip*.

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

Open your browser and navigate to http://localhost:5000/admin to test your deployed web-based bot! Remember this bot is just a greetings bot to test your installation so beyond saying 'Hi', the bot will respond to everything else with the default answer!. Also, to simplify its configuration, this sample bot just uses regular expression to match your intent but you could easily configure it to [use a real NLP such as DialogFlow](https://github.com/xatkit-bot-platform/xatkit-releases/wiki/Integrating-DialogFlow)

![Greetings Bot Chatbox](https://raw.githubusercontent.com/wiki/xatkit-bot-platform/xatkit/img/greetings-bot-example.gif)

## What are the supported platforms?

The current release of Xatkit is shipped with 11 platforms such as Slack, Github, React ... You can find the full list of supported platform in our [wiki](https://github.com/xatkit-bot-platform/xatkit/wiki).

There are also additional platforms built and supported by the community, you can find them on this dedicated [article](https://github.com/xatkit-bot-platform/xatkit/wiki). 

*If you have created your own Xatkit platform we will be happy to add it to the list, just [drop us an email](mailto:admin@xatkit.com) with a link to your awesome work!*

## What's next?

Congratulations, you just started your first Xatkit digital assistant!

You can now have a look at the [tutorial](https://github.com/xatkit-bot-platform/xatkit/wiki/Getting-Started) to learn how assistants are defined with the Xatkit language, or if you are already familiar with it you can take a look at the [documentation](https://github.com/xatkit-bot-platform/xatkit-releases/wiki) for additional information on Xatkit capabilities.

## Build

You can build your local version of Xatkit using the following commands:

1 - Clone this repository and initialize its submodules

```bash
git clone https://github.com/xatkit-bot-platform/xatkit.git
git submodule update --init --recursive
```

2 - Run the installation script

```bash
# Linux users
./install-linux.sh
# Windows users: execute the following bat file with administrative rights
./install-windows.bat
```

3 - Run the build script

```bash
./build.sh --all --skip-tests --product
```

Your local version of Xatkit is built in the `build` directory, you can install it and run the Greetings bot by following [these instructions](https://github.com/xatkit-bot-platform/xatkit#quick-start).

**Note**: the `git submodule` command will initialize Xatkit submodules with the latest releases of Xatkit. If you want to use the latest development version, or if you need advanced configuration in your build you can check [this detailed article from our wiki](https://github.com/xatkit-bot-platform/xatkit/wiki/Build-Xatkit).

## Troubleshooting

If you experience any issue with Xatkit you can open an issue on [our tracker](https://github.com/xatkit-bot-platform/xatkit/issues) and we will be happy to help you! Note that we may move your issue to a different repository based on the impacted components.



## Contributing

You want to contribute to Xatkit? We would love to hear from you and provide all the assistance we can! To ease the process we have written a [detailed article](https://github.com/xatkit-bot-platform/xatkit/wiki/Build-Xatkit) on how to build Xatkit from sources and install the development version.

You have contributed to one of our repository? To not hesitate to create a pull-request on the repository you updated and we will be happy to review your code and help you!

You have created a brand new platform for Xatkit? You can [contact us](mailto:admin@xatkit.com) and we will take a look at it! If you want to increase the visibility of your contribution we can create a dedicated repository for it in the Xatkit organization on Github.
