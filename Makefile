# A poorly written Makefile :-)
CC		= clang
CXX		= clang++
BUILD		= build
SRC		= src
PASSES_SRC	= src/OptPasses
INCLUDE		= include
CFLAGS		= -O0 -g -Wall -I$(INCLUDE)
CXX_FLAGS	= -O0 -g -Wall -I$(INCLUDE) -DPROFILE_TIME
LLVM_CFLAGS	= # we do not use LLVM C API
LLVM_CXXFLAGS	= $(shell llvm-config --cxxflags)
LLVM_LDFLAGS	= $(shell llvm-config --ldflags --system-libs --libs core ipo irreader mcjit native)

.PHONY: clean OptPasses

all: tinyvm

tinyvm: $(BUILD) $(BUILD)/main.o $(BUILD)/Lexer.o $(BUILD)/MCJITHelper.o \
	    $(BUILD)/CustomMemoryManager.o $(BUILD)/StackMap.o $(BUILD)/Liveness.o \
	    $(BUILD)/StateMap.o $(BUILD)/OSRLibrary.o $(BUILD)/Parser.o \
	    $(BUILD)/timer.o $(BUILD)/history.o $(BUILD)/CodeMapper.o OptPasses
	$(CXX) $(CXX_FLAGS) $(BUILD)/* $(LLVM_LDFLAGS) -o tinyvm

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/main.o: $(SRC)/main.cpp $(INCLUDE)/Lexer.hpp $(INCLUDE)/MCJITHelper.hpp \
	    $(INCLUDE)/Parser.hpp $(INCLUDE)/history.h
	$(CXX) $(CXX_FLAGS) -c $(SRC)/main.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/main.o

$(BUILD)/Lexer.o: $(SRC)/Lexer.cpp $(INCLUDE)/Lexer.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Lexer.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Lexer.o

$(BUILD)/MCJITHelper.o: $(SRC)/MCJITHelper.cpp $(INCLUDE)/MCJITHelper.hpp \
	    $(INCLUDE)/CustomMemoryManager.hpp $(INCLUDE)/OSRLibrary.hpp \
	    $(INCLUDE)/StateMap.hpp $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/MCJITHelper.cpp $(LLVM_CXXFLAGS) \
	    -o $(BUILD)/MCJITHelper.o

$(BUILD)/CustomMemoryManager.o: $(SRC)/CustomMemoryManager.cpp \
	    $(INCLUDE)/CustomMemoryManager.hpp $(INCLUDE)/MCJITHelper.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/CustomMemoryManager.cpp $(LLVM_CXXFLAGS) \
	    -o $(BUILD)/CustomMemoryManager.o

$(BUILD)/StackMap.o: $(SRC)/StackMap.cpp $(INCLUDE)/StackMap.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/StackMap.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/StackMap.o

$(BUILD)/Liveness.o: $(SRC)/Liveness.cpp $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Liveness.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Liveness.o

$(BUILD)/StateMap.o: $(SRC)/StateMap.cpp $(INCLUDE)/StateMap.hpp $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/StateMap.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/StateMap.o

$(BUILD)/OSRLibrary.o: $(SRC)/OSRLibrary.cpp $(INCLUDE)/OSRLibrary.hpp \
	    $(INCLUDE)/StateMap.hpp $(INCLUDE)/timer.h  $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/OSRLibrary.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/OSRLibrary.o

$(BUILD)/Parser.o: $(SRC)/Parser.cpp $(INCLUDE)/Lexer.hpp $(INCLUDE)/MCJITHelper.hpp \
	    $(INCLUDE)/OSRLibrary.hpp $(INCLUDE)/StateMap.hpp $(INCLUDE)/timer.h \
	    $(INCLUDE)/Liveness.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/Parser.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/Parser.o

$(BUILD)/history.o: $(SRC)/history.c $(INCLUDE)/history.h
	$(CC) $(CFLAGS) -c $(SRC)/history.c $(LLVM_CFLAGS) -o $(BUILD)/history.o

$(BUILD)/timer.o: $(SRC)/timer.c $(INCLUDE)/timer.h
	$(CC) $(CFLAGS) -c $(SRC)/timer.c $(LLVM_CFLAGS) -o $(BUILD)/timer.o

$(BUILD)/CodeMapper.o: $(SRC)/CodeMapper.cpp $(INCLUDE)/CodeMapper.hpp $(INCLUDE)/StateMap.hpp
	$(CXX) $(CXX_FLAGS) -c $(SRC)/CodeMapper.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/CodeMapper.o

OptPasses: $(BUILD)/ADCE.o $(BUILD)/DCE.o $(BUILD)/ConstantProp.o

$(BUILD)/ADCE.o: $(PASSES_SRC)/ADCE.cpp $(INCLUDE)/OptPasses.hpp $(INCLUDE)/CodeMapper.hpp
	$(CXX) $(CXX_FLAGS) -c $(PASSES_SRC)/ADCE.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/ADCE.o

$(BUILD)/DCE.o: $(PASSES_SRC)/DCE.cpp $(INCLUDE)/OptPasses.hpp $(INCLUDE)/CodeMapper.hpp
	$(CXX) $(CXX_FLAGS) -c $(PASSES_SRC)/DCE.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/DCE.o

$(BUILD)/ConstantProp.o: $(PASSES_SRC)/ConstantProp.cpp $(INCLUDE)/OptPasses.hpp $(INCLUDE)/CodeMapper.hpp
	$(CXX) $(CXX_FLAGS) -c $(PASSES_SRC)/ConstantProp.cpp $(LLVM_CXXFLAGS) -o $(BUILD)/ConstantProp.o


clean:
	rm -f $(BUILD)/*.o
