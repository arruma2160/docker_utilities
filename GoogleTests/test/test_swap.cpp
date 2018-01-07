#include "swap.hpp"
#include <algorithm>
#include <vector>
#include <gtest/gtest.h>

TEST(SwapTest, int_swap) {
    int a = 1;
    int b = 2;
    swap(a,b);
    ASSERT_EQ(a, 2);
    ASSERT_EQ(b, 1);
}

TEST(SwapTest, double_swap) {
    double a = 1.1;
    double b = 2.2;
    swap(a,b);
    ASSERT_EQ(a, 2.2);
    ASSERT_EQ(b, 1.1);
}

TEST(SwapTest, vector_swap) {
    std::vector<int> a {1, 2, 3};
    std::vector<int> c {1, 2, 3};
    std::vector<int> b {4, 5, 6};
    std::vector<int> d {4, 5, 6};
    swap(a,b);
    ASSERT_TRUE(std::equal(a.begin(), a.begin() + a.size(), d.begin()));
    ASSERT_TRUE(std::equal(b.begin(), b.begin() + b.size(), c.begin()));
}

int main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
