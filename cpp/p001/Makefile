# Variables
CC = g++
CFLAGS = -Wall -std=c++11

# Default target
all: solution

# General rule for building a solution
solution: solution.cpp
	$(CC) $(CFLAGS) -o solution solution.cpp

# Clean up
clean:
	rm -f solution

# Run the solution
run: solution
	./solution
