# A poorly written Makefile
CXX				= clang++
BUILD			= build
SRC				= src
INCLUDE			= include
CXX_FLAGS		= -O0 -g -Wall -I$(INCLUDE)
LLVM_CXXFLAGS	= $(shell llvm-config --cxxflags)
LLVM_LDFLAGS	= $(shell llvm-config  --ldflags --system-libs --libs core irreader mcjit native)

all: TinyVM

TinyVM: $(BUILD) $(BUILD)/main.o $(BUILD)/Lexer.o $(BUILD)/MCJITHelper.o $(BUILD)/CustomMemoryManager.o $(BUILD)/StackMap.o $(BUILD)/Liveness.o $(BUILD)/StateMap.o $(BUILD)/OSRLibrary.o $(BUILD)/Timer.o
	$(CXX) $(CXX_FLAGS) $(BUILD)/* $(LLVM_LDFLAGS) -o tinyvm

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/main.o: $(SRC)/main.cpp $(INCLUDE)/Lexer.hpp $(INCLUDE)/MCJITHelper.hpp $(INCLUDE)/Timer.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/main.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/main.o

$(BUILD)/Lexer.o: $(SRC)/Lexer.cpp $(INCLUDE)/Lexer.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Lexer.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Lexer.o

$(BUILD)/MCJITHelper.o: $(SRC)/MCJITHelper.cpp $(INCLUDE)/MCJITHelper.hpp $(INCLUDE)/CustomMemoryManager.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/MCJITHelper.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/MCJITHelper.o

$(BUILD)/CustomMemoryManager.o: $(SRC)/CustomMemoryManager.cpp $(INCLUDE)/CustomMemoryManager.hpp $(INCLUDE)/MCJITHelper.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/CustomMemoryManager.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/CustomMemoryManager.o

$(BUILD)/StackMap.o: $(SRC)/StackMap.cpp $(INCLUDE)/StackMap.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/StackMap.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/StackMap.o

$(BUILD)/Liveness.o: $(SRC)/Liveness.cpp $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Liveness.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Liveness.o

$(BUILD)/StateMap.o: $(SRC)/StateMap.cpp $(INCLUDE)/StateMap.hpp $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/StateMap.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/StateMap.o

$(BUILD)/OSRLibrary.o: $(SRC)/OSRLibrary.cpp $(INCLUDE)/OSRLibrary.hpp $(INCLUDE)/StateMap.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/OSRLibrary.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/OSRLibrary.o

$(BUILD)/Timer.o: $(SRC)/Timer.cpp $(INCLUDE)/Timer.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Timer.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Timer.o

clean:
	rm -f $(BUILD)/*.o
