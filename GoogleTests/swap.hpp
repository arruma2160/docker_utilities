#ifndef SWAP_HPP_
#define SWAP_HPP_

#include <iostream>

template <typename T>
void swap(T& a, T&b)
{
    T aux = a;
    a = b;
    b = aux;
};

#endif
