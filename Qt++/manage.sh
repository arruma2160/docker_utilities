#! /bin/bash
##
##  Using the Docker container specified at the Dockerfile in this same directory,
##  this script is able to generate Makefile at '${BUILD}/' directory and build or
##  clean the project.
##
##  Note:
##  -----
##  The build of the project is made 'statically', what it means that the binary
##  is "heavier" but contains all the dependencies.
##
##  Functions:
##  ------------------
##
##    - usage: display main usage of this script.
##    - qmake: generates Makefile at '${BUILD}/' directory BASED ON 'qmake.pro'
##    - make [clean]: access '${BUILD}/' folder and makes [clean] qt project.
##    - main functionality: parses arguments and if error displays usage,
##                          otherwise executes the command passed to this script
##                          as its first argument and alternative argument to
##                          command.
##    - run <program>: runs inside the container the program passed as parameter.


# //------------------------------
# Global vars.
BUILD="build_"

# //-------------------------------
# usage

function usage() 
{
    echo -e ""
    echo -e "USAGE: ./manage.sh [function]"
    echo -e ""
    echo -e "    function: "
    echo -e "        qmake "
    echo -e "        make [clean] "
    echo -e "        run <program> "
    echo -e "        qmake-project "
    echo -e ""
    echo -e "    examples:"
    echo -e "        ./manage.sh qmake"
    echo -e "        ./manage.sh make"
    echo -e "        ./manage.sh make clean"
    echo -e "        ./manage.sh run hello-world"
    echo -e "        ./manage.sh qmake-project"
    echo -e ""
}


# //-------------------------------
# qmake

function qmake() 
{
    COMMAND="qmake -o ${BUILD}/Makefile project.pro"
    docker run --rm -v $(pwd):/code qt5-dock /bin/bash -c "${COMMAND}"
}


# //-------------------------------
# qmake-project

function qmake-project() 
{
    COMMAND="qmake -project"
    docker run --rm -v $(pwd):/code qt5-dock /bin/bash -c "${COMMAND}"
}

# //-------------------------------
# make

function make() 
{
    case "$1" in
        clean) COMMAND="make clean -C ${BUILD}/" ;;
        all) COMMAND="make all -C ${BUILD}/" ;;
        "") COMMAND="make -C ${BUILD}/" ;;
        *) usage ;;
    esac
    docker run --rm -v $(pwd):/code qt5-dock /bin/bash -c "${COMMAND}"
}

# //-------------------------------
# run

function run()
{
    if [ $# -ne 1 ]; then
        echo "[!!] Missed binary to run"
        usage
        exit 1
    fi
    docker run -it -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v $(pwd):/code qt5-dock "${1}"
}


# //-------------------------------
# main

function main() 
{
case "$1" in
    qmake) qmake ;;
    qmake-project) qmake-project ;;
    make)
        case "$2" in
            clean) make clean && rm -rf ${BUILD} && echo "Removed '${BUILD}/'";;
            all) make all ;;
            "") make ;;
            *) usage ;;
        esac ;;
    run) run $2 ;;
    *) usage ;;
esac
}

## ------------------------------------------------------------
## Main body of script
## ------------------------------------------------------------
main $@
