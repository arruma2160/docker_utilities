#include "eratosthenes.hpp"
#include <algorithm>
#include <iostream>
using std::vector;
using std::set;

// ---------------------------------
//

vector<int> 
natural_numbers(int max) {
    vector<int> nat_nums(max-1);
    IncGenerator inc(2);
    std::generate(nat_nums.begin(), nat_nums.end(), inc);
    return nat_nums;
};


// ---------------------------------
//

set<int> 
sieve_eratosthenes(int max) 
{
    vector<int> natnums = natural_numbers(max);
    set<int> sieve(natnums.begin(), natnums.end());

    // Algorithm
    int rem;
    for(auto& num : sieve) {
        std::cerr << num << " ";
        for(int i = 2, rem = i*num ; rem < max ; i++, rem = i*num) {
            sieve.erase(rem); 
        }
    }

    return sieve;
}

