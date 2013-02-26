TEST_CPP_FILES := $(wildcard ./*.cc)
TEST_OBJ_FILES := $(addprefix ./,$(notdir $(TEST_CPP_FILES:.cc=.o)))
GTEST_LIBS     := $(wildcard ./lib/*.a)
TEST_TARGET    := hello_mock

all: $(TEST_TARGET)
	./$(TEST_TARGET)
 
$(TEST_TARGET): $(TEST_OBJ_FILES) $(GTEST_LIBS)
	g++ -lpthread -o $@ $^
 
./%.o: ./%.cc
	g++ -g -c -fPIC -I./include -o $@ $<
 
clean:
	rm -rf $(TEST_TARGET) $(TEST_OBJ_FILES)
