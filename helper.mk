# The compiler to use
CXX = g++

# Compiler flags
CXXFLAGS = -g -std=c++20 -Wall

# Output file
TARGET = out

# Source files
SRCS = main.cpp helper.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Ignore any files named "all" or "clean"
.PHONY: all clean

all: $(TARGET)

# Rule to build the final executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Rule to build object files from source files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean target to remove generated files
clean:
	$(RM) $(OBJS) $(TARGET)
