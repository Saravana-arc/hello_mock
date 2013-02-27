TEST_CPP_FILES := $(wildcard ./*.cc)
TEST_OBJ_FILES := $(addprefix ./,$(notdir $(TEST_CPP_FILES:.cc=.o)))
GTEST_LIBS     := gmock-1.6.0/lib/.libs/libgmock.a gmock-1.6.0/gtest/lib/.libs/libgtest.a gmock-1.6.0/gtest/lib/.libs/libgtest_main.a
TEST_TARGET    := hello_mock

all: $(GTEST_LIBS) $(TEST_TARGET)
	./$(TEST_TARGET)

$(GTEST_LIBS):
	cd gmock-1.6.0/; ./configure; make
 
$(TEST_TARGET): $(TEST_OBJ_FILES) $(GTEST_LIBS)
	g++ -lpthread -o $@ $^
 
./%.o: ./%.cc
	g++ -g -c -fPIC -I./gmock-1.6.0/include/ -I./gmock-1.6.0/gtest/include/ -o $@ $<
 
clean:
	cd gmock-1.6.0; make clean; cd ..
	rm -rf $(TEST_TARGET) $(TEST_OBJ_FILES)
