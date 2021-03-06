# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/krishna/workspace/GPU/vexcl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/krishna/workspace/GPU/vexclinstall

# Include any dependencies generated for this target.
include tests/CMakeFiles/vector_arithmetics.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/vector_arithmetics.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/vector_arithmetics.dir/flags.make

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o: tests/CMakeFiles/vector_arithmetics.dir/flags.make
tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o: /home/krishna/workspace/GPU/vexcl/tests/vector_arithmetics.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexclinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o -c /home/krishna/workspace/GPU/vexcl/tests/vector_arithmetics.cpp

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.i"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/vector_arithmetics.cpp > CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.i

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.s"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/vector_arithmetics.cpp -o CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.s

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.requires:
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.requires

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.provides: tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/vector_arithmetics.dir/build.make tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.provides.build
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.provides

tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.provides.build: tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o

# Object files for target vector_arithmetics
vector_arithmetics_OBJECTS = \
"CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o"

# External object files for target vector_arithmetics
vector_arithmetics_EXTERNAL_OBJECTS =

tests/vector_arithmetics: tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o
tests/vector_arithmetics: tests/CMakeFiles/vector_arithmetics.dir/build.make
tests/vector_arithmetics: /usr/lib/libboost_date_time.so
tests/vector_arithmetics: /usr/lib/libboost_filesystem.so
tests/vector_arithmetics: /usr/lib/libboost_system.so
tests/vector_arithmetics: /usr/lib/libboost_thread.so
tests/vector_arithmetics: /usr/lib/libboost_unit_test_framework.so
tests/vector_arithmetics: /usr/lib/libboost_program_options.so
tests/vector_arithmetics: /usr/lib/x86_64-linux-gnu/libpthread.so
tests/vector_arithmetics: tests/CMakeFiles/vector_arithmetics.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable vector_arithmetics"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vector_arithmetics.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/vector_arithmetics.dir/build: tests/vector_arithmetics
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/build

tests/CMakeFiles/vector_arithmetics.dir/requires: tests/CMakeFiles/vector_arithmetics.dir/vector_arithmetics.cpp.o.requires
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/requires

tests/CMakeFiles/vector_arithmetics.dir/clean:
	cd /home/krishna/workspace/GPU/vexclinstall/tests && $(CMAKE_COMMAND) -P CMakeFiles/vector_arithmetics.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/clean

tests/CMakeFiles/vector_arithmetics.dir/depend:
	cd /home/krishna/workspace/GPU/vexclinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexclinstall /home/krishna/workspace/GPU/vexclinstall/tests /home/krishna/workspace/GPU/vexclinstall/tests/CMakeFiles/vector_arithmetics.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/vector_arithmetics.dir/depend

