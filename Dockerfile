FROM openjdk:8

COPY ./build /opt/xatkit/build

ENV XATKIT=/opt/xatkit/build

WORKDIR ${XATKIT}/bin

RUN sed -i -e 's/\r$//' start-xatkit-linux.sh

RUN chmod +x start-xatkit-linux.sh

ENTRYPOINT [ "./start-xatkit-linux.sh" ]

CMD  ["../examples/GreetingsBots/GreetingsBot/GreetingsBot.properties"]