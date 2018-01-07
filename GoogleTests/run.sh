#!/bin/bash

docker build -t gtesting .

docker run --rm -it -v $(pwd):/code gtesting "$@"
