cmake_minimum_required(VERSION 2.6)
set (CMAKE_CXX_STANDARD 11)
 
# Locate GTest
find_package(GTest REQUIRED)
include_directories(..)
include_directories(${GTEST_INCLUDE_DIRS})
 
# Link runTests with what we want to test and the GTest and pthread library
add_executable(swap_tests test_swap)
target_link_libraries(swap_tests ${GTEST_LIBRARIES} pthread)
