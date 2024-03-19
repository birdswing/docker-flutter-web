FROM debian:latest

ARG FLUTTER_VERSION=3.19.2

ENV FLUTTER_SDK=/usr/local/flutter
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

RUN apt-get update
RUN apt-get install -y curl git unzip

WORKDIR /app

RUN git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_SDK
RUN flutter doctor
RUN rm -rf .dart_tool/
