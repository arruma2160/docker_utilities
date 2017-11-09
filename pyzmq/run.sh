#! /bin/bash

function usage() {
    echo ""
    echo ""
    echo "!!: WRONG USE OF $0:"
    echo "!!: usage:"
    echo "!!: ./run.sh server|client|help"
    echo "!!:             server: runs server."
    echo "!!:             client: runs client."
    echo "!!:         just-build: runs client."
    echo "!!:               help: shows this help."
    echo ""
    echo ""
}

function docker_build() {
    if [ ! -e "Dockerfile" ]; then
        echo "Error: no Dockerfile named dpyzmq"
        exit 1
    fi
    docker build -t docker_pyzmq .
}

function docker_server() {
    echo "===="
    echo "==== Starting server..."
    echo "===="
    docker run --name=server \
               --rm -v $(pwd):/code \
               -p 2222:2222 docker_pyzmq \
               python3 -u ./server.py
}

function docker_client() {
    echo "===="
    echo "==== Running client..."
    echo "===="
    docker run --name=client \
               --rm -v $(pwd):/code \
               docker_pyzmq \
               python3 -u ./client.py
}

function main() {
    if [ "$#" -ne 1 ]; then
        echo "[!!] Remember to pass parameter to this program: server | client | help"
        usage
    fi

    docker_build

    case "$1" in
        "server") docker_server;;
        "client") docker_client;;
        "just-build") exit 0;;
          "help") usage && exit 1;;
               *) usage && exit 1;;
    esac

}

## Running program ./run.sh
main $@
     
