FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y git-core \
                       libxml2-dev \
                       curl \
                       python \
                       build-essential \
                       make \
                       gcc \
                       python-dev \
                       python3 \
                       python3-pip \
                       net-tools \
                       iputils-ping

RUN apt-get install -y software-properties-common \
                       python-software-properties

##RUN add-apt-repository ppa:deadsnakes/ppa && \
##    apt-get update && \
##    apt-get install -y python3.5

RUN apt-get install -y libzmq-dev
RUN python3 -m pip install pyzmq
RUN python3 -m pip install pyinstaller
RUN apt-get install -y python3-pyqt5

EXPOSE 2222

WORKDIR /code
