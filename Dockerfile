FROM ubuntu:latest

RUN apt-get update && apt-get install -y gnupg software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && \
    apt-get install -y python libnss3 openjdk-8-jre-headless openjdk-8-jdk curl

COPY . /radlog
RUN cd /radlog && build/mvn -T 4 -DskipTests clean package

