Xatkit - The easiest way to build powerful bots and chatbots
======

[![Wiki Badge](https://img.shields.io/badge/doc-wiki-blue)](https://github.com/xatkit-bot-platform/xatkit/wiki) [![Twitter](https://img.shields.io/twitter/follow/xatkit?label=Follow&style=social)](https://twitter.com/xatkit) [![GitHub forks](https://img.shields.io/github/forks/xatkit-bot-platform/xatkit?style=social)](https://github.com/xatkit-bot-platform/xatkit/network/members) [![GitHub Repo stars](https://img.shields.io/github/stars/xatkit-bot-platform/xatkit?style=social)](https://github.com/xatkit-bot-platform/xatkit/stargazers)

*Get your own smart chatbot. Design your bot once, deploy it everywhere.*

Xatkit has been created to reduce boilerplate code, complex API understanding, and technical details to facilitate the definition and deployment of your bots. Xatkit helps you focus on what really matters: **the conversation logic you want to embed in your chatbot**. 

To do so, we have baked a **chatbot-specific definition language** to specify user intentions, receive events (your bots can also be proactive!), and bind them to computable actions following powerful [state machine semantics](https://xatkit.com/chatbot-dsl-state-machines-xatkit-language/). Our chatbot language is implemented as a [Java Fluent Interface](https://xatkit.com/fluent-interface-building-chatbots-bots/) combining the low-code benefits of using a dedicated chatbot Internal DSL with the full power of Java when you need to write complex bot behaviours. 

This chatbot *specification* is then handled by the **Xatkit Runtime Engine**, which automatically manages its deployment and execution. Reuse the existing platforms (or add your own) to make your bot *talk* with external services (Slack, GitHub, Telegram, websites,...).

Xatkit's philosophy is *not* to reinvent the wheel. Look at Xatkit as a [chatbot orchestration platform](https://xatkit.com/chatbot-orchestration-platform-open-source/) that will help you integrate the best NLP components in your ideal chatbot. 

Xatkit is a java-based framework. If you're looking for a Python-based one that shares the same philosophy and similar arquitecture, check the [BESSER Bot Framework](https://github.com/BESSER-PEARL/BESSER-Bot-Framework)

## Quick Start

1- [Build the latest version of Xatkit](https://github.com/xatkit-bot-platform/xatkit/wiki/Build-Xatkit)

2- Navigate to `xatkit-examples/GreetingsBots/GreetingsBot` and start the example digital assistant (a basic web-based bot that greets users)

```bash
mvn clean compile
mvn exec:java -Dexec.mainClass="com.xatkit.example.GreetingsBot"
```

The console will log some initialization information, and after a few seconds you should see the following message:

```bash
You can test your chatbot here http://localhost:5000/admin (note that the bots behavior can be slightly different on the test page than when it is deployed on a server)
```

Open your browser and navigate to http://localhost:5000/admin to test your deployed web-based bot! Remember this bot is just a greetings bot to test your installation so beyond saying 'Hi', the bot will respond to everything else with the default answer!. Also, to simplify its configuration, this sample bot just uses regular expression to match your intent but you could easily configure it to [use a real NLP such as DialogFlow](https://github.com/xatkit-bot-platform/xatkit/wiki/Integrating-DialogFlow). 

You can see a more complete online demo by talking to **our ecommerce chatbot demo**, freely accessible from [our home page](https://xatkit.com/). 


## Create your first bot

Congratulations, you just started your first Xatkit digital assistant!

You can now have a look at the [tutorial](https://github.com/xatkit-bot-platform/xatkit/wiki/Getting-Started) to learn how bots are defined with the Xatkit language, or if you are already familiar with it you can take a look at the [documentation](https://github.com/xatkit-bot-platform/xatkit/wiki) for additional information on Xatkit capabilities.

You can also kickstart the process thanks to our pre-configured [Xakit Bot Template](https://github.com/xatkit-bot-platform/xatkit-bot-template).

## What platforms are available in Xatkit?

Your bot will be able to use any of the over a dozen platforms (and counting) available in Xatkit such as Slack, Telegram, WhatsApp, Github, web ... You can find the full list of supported platform in our [wiki](https://github.com/xatkit-bot-platform/xatkit/wiki).

## Troubleshooting

If you experience any issue with Xatkit you can open an issue on [our tracker](https://github.com/xatkit-bot-platform/xatkit/issues) and we will be happy to help you! Note that we may move your issue to a different repository based on the impacted components.

## Contact

Feel free to [reach out by mail](mailto:jcabotsagrera@gmail.com) or [ping us in social media](https://twitter.com/xatkit). 

However, note that the project is not actively maintained as we are now investing our efforts on the [BESSER Bot Framework](https://github.com/BESSER-PEARL/BESSER-Bot-Framework)

## Website

[Xatkit.com](https://xatkit.com/)




**Thanks for reading until the end! If you like what you see, don't forget to star/watch this repository, thanks!**
