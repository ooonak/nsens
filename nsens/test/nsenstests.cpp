#include "gtest/gtest.h"
#include "nsens/nsens.hpp"

TEST(Nsens, TestVersion)
{
    nsens::NSens::version();
    EXPECT_TRUE(true);
}
