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
include examples/CMakeFiles/devlist.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/devlist.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/devlist.dir/flags.make

examples/CMakeFiles/devlist.dir/devlist.cpp.o: examples/CMakeFiles/devlist.dir/flags.make
examples/CMakeFiles/devlist.dir/devlist.cpp.o: /home/krishna/workspace/GPU/vexcl/examples/devlist.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexclinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/CMakeFiles/devlist.dir/devlist.cpp.o"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/devlist.dir/devlist.cpp.o -c /home/krishna/workspace/GPU/vexcl/examples/devlist.cpp

examples/CMakeFiles/devlist.dir/devlist.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/devlist.dir/devlist.cpp.i"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/examples/devlist.cpp > CMakeFiles/devlist.dir/devlist.cpp.i

examples/CMakeFiles/devlist.dir/devlist.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/devlist.dir/devlist.cpp.s"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/examples/devlist.cpp -o CMakeFiles/devlist.dir/devlist.cpp.s

examples/CMakeFiles/devlist.dir/devlist.cpp.o.requires:
.PHONY : examples/CMakeFiles/devlist.dir/devlist.cpp.o.requires

examples/CMakeFiles/devlist.dir/devlist.cpp.o.provides: examples/CMakeFiles/devlist.dir/devlist.cpp.o.requires
	$(MAKE) -f examples/CMakeFiles/devlist.dir/build.make examples/CMakeFiles/devlist.dir/devlist.cpp.o.provides.build
.PHONY : examples/CMakeFiles/devlist.dir/devlist.cpp.o.provides

examples/CMakeFiles/devlist.dir/devlist.cpp.o.provides.build: examples/CMakeFiles/devlist.dir/devlist.cpp.o

# Object files for target devlist
devlist_OBJECTS = \
"CMakeFiles/devlist.dir/devlist.cpp.o"

# External object files for target devlist
devlist_EXTERNAL_OBJECTS =

examples/devlist: examples/CMakeFiles/devlist.dir/devlist.cpp.o
examples/devlist: examples/CMakeFiles/devlist.dir/build.make
examples/devlist: /usr/lib/libboost_date_time.so
examples/devlist: /usr/lib/libboost_filesystem.so
examples/devlist: /usr/lib/libboost_system.so
examples/devlist: /usr/lib/libboost_thread.so
examples/devlist: /usr/lib/libboost_unit_test_framework.so
examples/devlist: /usr/lib/libboost_program_options.so
examples/devlist: /usr/lib/x86_64-linux-gnu/libpthread.so
examples/devlist: examples/CMakeFiles/devlist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable devlist"
	cd /home/krishna/workspace/GPU/vexclinstall/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/devlist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/devlist.dir/build: examples/devlist
.PHONY : examples/CMakeFiles/devlist.dir/build

examples/CMakeFiles/devlist.dir/requires: examples/CMakeFiles/devlist.dir/devlist.cpp.o.requires
.PHONY : examples/CMakeFiles/devlist.dir/requires

examples/CMakeFiles/devlist.dir/clean:
	cd /home/krishna/workspace/GPU/vexclinstall/examples && $(CMAKE_COMMAND) -P CMakeFiles/devlist.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/devlist.dir/clean

examples/CMakeFiles/devlist.dir/depend:
	cd /home/krishna/workspace/GPU/vexclinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl /home/krishna/workspace/GPU/vexcl/examples /home/krishna/workspace/GPU/vexclinstall /home/krishna/workspace/GPU/vexclinstall/examples /home/krishna/workspace/GPU/vexclinstall/examples/CMakeFiles/devlist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/devlist.dir/depend

