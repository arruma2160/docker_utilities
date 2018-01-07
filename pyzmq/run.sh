#! /bin/bash

function usage() {
    echo ""
    echo "::: usage:"
    echo "::: ./run.sh server|client|build-client-exe|build-server-exe|help"
    echo "::: [-]  server:           runs server."
    echo "::: [-]  client:           runs client."
    echo "::: [-]  just-build:       runs client."
    echo "::: [-]  build-client-exe: builds executable for client" 
    echo "::: [-]  build-server-exe: builds executable for server"
    echo "::: [-]  help:             shows this help."
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
    docker run -it -e DISPLAY=$DISPLAY \
               -v /tmp/.X11-unix:/tmp/.X11-unix \
               --name=client \
               --rm -v $(pwd):/code \
               docker_pyzmq \
               python3 -u client.py
}

function docker_installer() {
    echo "===="
    echo "==== Running installer..."
    echo "===="
    docker run --name=client \
               --rm -v $(pwd):/code \
               docker_pyzmq \
               pyinstaller --onefile $1
}

function main() {
    if [ "$#" -ne 1 ]; then
        echo ""
        echo "!!: WRONG USE OF $0:"
        echo "[!!] Remember to pass parameter to this program: server | client | help"
    fi

    case "$1" in
        "server") 
            docker_build && docker_server;;
        "client") 
            docker_build && docker_client;;
        "build-client-exe") 
            docker_build && docker_installer "./client.py";;
        "build-server-exe") 
            docker_build && docker_installer "./server.py";;
        "just-build") 
            docker_build && exit 0;;
        "help") 
            usage && exit 1;;
        *) 
            usage && exit 1;;
    esac

}

## Running program ./run.sh
main $@
     
