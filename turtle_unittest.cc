#include "mock_turtle.h"
#include "gmock/gmock.h"
#include "gtest/gtest.h"

using ::testing::AtLeast;                    
using ::testing::Return;

TEST(TurtleTest, PenDown) {
  MockTurtle turtle;                         

  EXPECT_CALL(turtle, PenDown())             
    .Times(AtLeast(1));
  turtle.PenDown();
}                                             

TEST(TurtleTest, GetX) {
  MockTurtle turtle;                         

  EXPECT_CALL(turtle, GetX())
    .Times(5)
    .WillOnce(Return(100))
    .WillOnce(Return(150))
    .WillRepeatedly(Return(200));

  EXPECT_EQ(turtle.GetX(), 100);
  EXPECT_EQ(turtle.GetX(), 150);
  EXPECT_EQ(turtle.GetX(), 200);
  EXPECT_EQ(turtle.GetX(), 200);
  EXPECT_EQ(turtle.GetX(), 200);
}
