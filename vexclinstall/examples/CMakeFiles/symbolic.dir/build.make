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
include examples/CMakeFiles/symbolic.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/symbolic.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/symbolic.dir/flags.make

examples/CMakeFiles/symbolic.dir/symbolic.cpp.o: examples/CMakeFiles/symbolic.dir/flags.make
examples/CMakeFiles/symbolic.dir/symbolic.cpp.o: /home/krishna/workspace/GPU/vexcl/examples/symbolic.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexclinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/CMakeFiles/symbolic.dir/symbolic.cpp.o"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/symbolic.dir/symbolic.cpp.o -c /home/krishna/workspace/GPU/vexcl/examples/symbolic.cpp

examples/CMakeFiles/symbolic.dir/symbolic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/symbolic.dir/symbolic.cpp.i"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/examples/symbolic.cpp > CMakeFiles/symbolic.dir/symbolic.cpp.i

examples/CMakeFiles/symbolic.dir/symbolic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/symbolic.dir/symbolic.cpp.s"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/examples/symbolic.cpp -o CMakeFiles/symbolic.dir/symbolic.cpp.s

examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.requires:
.PHONY : examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.requires

examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.provides: examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.requires
	$(MAKE) -f examples/CMakeFiles/symbolic.dir/build.make examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.provides.build
.PHONY : examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.provides

examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.provides.build: examples/CMakeFiles/symbolic.dir/symbolic.cpp.o

# Object files for target symbolic
symbolic_OBJECTS = \
"CMakeFiles/symbolic.dir/symbolic.cpp.o"

# External object files for target symbolic
symbolic_EXTERNAL_OBJECTS =

examples/symbolic: examples/CMakeFiles/symbolic.dir/symbolic.cpp.o
examples/symbolic: examples/CMakeFiles/symbolic.dir/build.make
examples/symbolic: /usr/lib/libboost_date_time.so
examples/symbolic: /usr/lib/libboost_filesystem.so
examples/symbolic: /usr/lib/libboost_system.so
examples/symbolic: /usr/lib/libboost_thread.so
examples/symbolic: /usr/lib/libboost_unit_test_framework.so
examples/symbolic: /usr/lib/libboost_program_options.so
examples/symbolic: /usr/lib/x86_64-linux-gnu/libpthread.so
examples/symbolic: examples/CMakeFiles/symbolic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable symbolic"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/symbolic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/symbolic.dir/build: examples/symbolic
.PHONY : examples/CMakeFiles/symbolic.dir/build

examples/CMakeFiles/symbolic.dir/requires: examples/CMakeFiles/symbolic.dir/symbolic.cpp.o.requires
.PHONY : examples/CMakeFiles/symbolic.dir/requires

examples/CMakeFiles/symbolic.dir/clean:
	cd /home/krishna/workspace/GPU/vexclinstall/examples && $(CMAKE_COMMAND) -P CMakeFiles/symbolic.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/symbolic.dir/clean

examples/CMakeFiles/symbolic.dir/depend:
	cd /home/krishna/workspace/GPU/vexclinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl /home/krishna/workspace/GPU/vexcl/examples /home/krishna/workspace/GPU/vexclinstall /home/krishna/workspace/GPU/vexclinstall/examples /home/krishna/workspace/GPU/vexclinstall/examples/CMakeFiles/symbolic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/symbolic.dir/depend

