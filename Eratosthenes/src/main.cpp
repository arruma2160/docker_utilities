#include "eratosthenes.hpp"
#include <iostream>
#include <set>
using std::set;

// ---------------------------------
//
int main(void) {
    set<int> primes = sieve_eratosthenes(100);
    for(const auto& num : primes) {
        std::cerr << num << " ";
    }
    std::cerr << std::endl;
    return 0;
}


