# Variables
CC = g++
CFLAGS = -Wall -std=c++11

# Get all directories with the pattern p### (like p001, p002, etc.)
DIRS := $(wildcard p[0-9][0-9][0-9])

# Define a target for each directory that contains a solution.cpp
TARGETS := $(foreach dir, $(DIRS), $(if $(wildcard $(dir)/solution.cpp), $(dir)/solution))

# Default target
all: $(TARGETS)

# Rule to make each target
%/solution: %/solution.cpp
	$(CC) $(CFLAGS) -o $@ $<
	chmod +x $@

# Clean up
clean:
	rm -f $(TARGETS)

# Shortcut targets for each problem
$(DIRS):
	$(MAKE) $@/solution

# Run shortcuts
run-%: %/solution
	@./$*/solution

# PHONY targets
.PHONY: all clean run $(DIRS) run-%
