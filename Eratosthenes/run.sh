#!/bin/bash

docker build -t eratosthenes .

docker run --rm -it -v $(pwd):/code eratosthenes "$@"
