FROM requarks/wiki:2 AS assets

WORKDIR /wiki/assets/css

COPY ./script.sh /wiki/assets/css
RUN bash ./script.sh
RUN rm ./script.sh

WORKDIR /wiki

USER node

VOLUME ["/wiki/data/content"]

EXPOSE 3000
EXPOSE 3443

CMD ["node", "server"]
