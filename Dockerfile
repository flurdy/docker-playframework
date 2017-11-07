FROM flurdy/sbt:1.0.2-alpine

MAINTAINER Ivar Abrahamsen <@flurdy>

RUN mkdir -p /opt/build

COPY project /opt/play-project

WORKDIR /opt/build

RUN sbt new playframework/play-scala-seed.g8 --name=play-base && \
  cd play-base && \
  rm -rf project && \
  mv /opt/play-project project && \
  sbt stage && \
  rm -rf /opt/build

