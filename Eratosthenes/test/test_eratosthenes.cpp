#include "eratosthenes.hpp"
#include <gtest/gtest.h>
#include <iostream>
#include <vector>

TEST(NaturalNumbers, 1_generation_of_natural_numbers_vector)
{
    // Creating vector model
    std::vector<int> model_vector;
    for(int i=2 ; i <= 1000 ; i++) {
        model_vector.push_back(i);
    }

    // Creating vector via funtion to be tested
    std::vector<int> test_vector = natural_numbers(1000);   

    ASSERT_TRUE(model_vector == test_vector);
}

// ---------------------------------
// Main 
int 
main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

