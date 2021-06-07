FROM ubuntu:18.04

COPY . /flack

RUN apt-get update
#RUN apt-get -y install software-properties-common

RUN apt-get -y install openjdk-8-jdk 
RUN apt-get -y install maven

WORKDIR /flack

RUN mvn clean package

RUN echo 'alias flack="java -Djava.library.path=solvers -cp ./libs/*:./target/flack-1.0-jar-with-dependencies.jar"' >> ~/.bashrc

