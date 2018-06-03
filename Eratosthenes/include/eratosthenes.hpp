#ifndef ERATOSTHENES_HPP_
#define ERATOSTHENES_HPP_

#include <vector>
#include <set>

// ---------------------------------
// Data structures

struct IncGenerator {
    int _current;
    IncGenerator(int start): _current{start} {};
    int operator() (){return _current++;};
};


// ---------------------------------
// Prototypes

std::vector<int> natural_numbers(int max, int start=2);
std::set<int> sieve_eratosthenes(int max);

# endif
