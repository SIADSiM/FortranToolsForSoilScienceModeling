# Makefile for the Fortran Soil Science Library
# Compatible with ifx compiler on Windows

# Compiler and flags
FC = ifx
# Use -module flag to specify output directory for .mod files with ifx
FFLAGS = -g -warn all -I$(BUILD_DIR) -module $(BUILD_DIR)

# Directories
SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build

# Explicitly list kind_mod first to ensure it's built first.
KIND_SRC = $(SRC_DIR)/kind_mod.f90
OTHER_SRCS = $(filter-out $(KIND_SRC), $(wildcard $(SRC_DIR)/*.f90))
SRCS = $(KIND_SRC) $(OTHER_SRCS)

# Create a list of object files in the build directory
OBJS = $(patsubst $(SRC_DIR)/%.f90, $(BUILD_DIR)/%.o, $(SRCS))

# Test source and object files
TEST_SRC = $(TEST_DIR)/test_main.f90
TEST_OBJ = $(patsubst $(TEST_DIR)/%.f90, $(BUILD_DIR)/%.o, $(TEST_SRC))

# Executable name
TARGET = test_runner.exe

# Default target: build the test runner
all: $(TARGET)

# Rule to link the final executable
$(TARGET): $(OBJS) $(TEST_OBJ)
	$(FC) $(FFLAGS) -o $@ $(filter %.o, $^)

# Pattern rule to compile source files from src to the build directory
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.f90
	$(FC) $(FFLAGS) -c $< -o $@

# Rule to compile the test main file
$(BUILD_DIR)/test_main.o: $(TEST_DIR)/test_main.f90 $(OBJS)
	$(FC) $(FFLAGS) -c $< -o $@

# Target to run the tests
run_tests: all
	@echo "--- Running tests ---"
	@./$(TARGET)
	@echo "--- Tests finished ---"

# Target to clean up build artifacts
clean:
	@echo "--- Cleaning up build files ---"
	-rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/*.mod $(TARGET)

# Phony targets are not files
.PHONY: all clean run_tests
