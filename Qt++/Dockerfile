FROM ubuntu:trusty

ENV QT_BASE_DIR=/opt/qt55
ENV QTDIR=$QT_BASE_DIR
ENV PATH=$QT_BASE_DIR/bin:$PATH
ENV LD_LIBRARY_PATH=$QT_BASE_DIR/lib/x86_64-linux-gnu:$QT_BASE_DIR/lib:$LD_LIBRARY_PATH
ENV PKG_CONFIG_PATH=$QT_BASE_DIR/lib/pkgconfig:$PKG_CONFIG_PATH

## Dockerfile icsinc/qt5.5.1-x64
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && \
    apt-get install -y software-properties-common \
                       python-software-properties && \
    add-apt-repository ppa:beineri/opt-qt551-trusty

RUN apt-get update && \
    apt-get install -y git \
                       qt55-meta-full \
                       build-essential \
                       mesa-common-dev \
                       libglu1-mesa-dev && \
    rm -rf /var/lib/apt/lists/*


## Install project utilities
RUN apt-get update -y && \
    apt-get install -y python3-pip \
                       python3-dev \
                       python3 \
                       git \
                       cmake \
                       g++

## Install poker client dependencies
RUN apt-get install -y libssl-dev \
                       libzip-dev

## Install poker server dependencies
RUN apt-get install -y libssl-dev \
                       libapr1-dev \
                       libaprutil1-dev \
                       libcurl4-openssl-dev

## Install openssh client
RUN apt-get install -y openssh-client \
                       openssh-server

RUN mkdir -p /code
RUN useradd -ms /bin/bash nonroot
USER nonroot
ENV SHELL "/bin/bash"

WORKDIR /code

CMD ["/bin/bash"]
