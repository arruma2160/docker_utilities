CFLAG = -Wall -ggdb
CC = g++
INCLUDE =
LIBS = 

all:test

test_swap: 
	@cd test;\
	mkdir -p test_build;\
	cd test_build;\
	cmake .. && make && ./swap_tests

test:test_swap
.PHONY: test
