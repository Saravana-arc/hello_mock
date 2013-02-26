#include "mock_turtle.h"
#include "gmock/gmock.h"
#include "gtest/gtest.h"

using ::testing::AtLeast;                    

TEST(TurtleTest, CallPenDown) {
  MockTurtle turtle;                         
  EXPECT_CALL(turtle, PenDown())             
    .Times(AtLeast(1));

  turtle.PenDown();
}                                             
