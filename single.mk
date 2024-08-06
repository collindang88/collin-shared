# The compiler to use
CXX = g++

# Compiler flags
CXXFLAGS = -g -std=c++20 -Wall

# Output file
TARGET = out

# Source file
SRCS = main.cpp

# Ignore any files named "all" or "clean"
.PHONY: all clean

all: $(TARGET)

# Rule to build the final executable directly from the source file
$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRCS)

# Clean target to remove the generated executable
clean:
	$(RM) $(TARGET)
