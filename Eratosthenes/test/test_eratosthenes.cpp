#include <gtest/gtest.h>
#include <iostream>

TEST(dummy, 1_dummy )
{
    bool it_is_true = true;
    ASSERT_TRUE(it_is_true);
}

// ---------------------------------
// Main 
int 
main(int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

