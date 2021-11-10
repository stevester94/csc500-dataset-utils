FROM ubuntu:18.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential
RUN apt-get install -y vim tmux git
RUN apt-get install -y cmake 
RUN apt-get install -y gnuradio gnuradio-dev
