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
CMAKE_SOURCE_DIR = /home/krishna/workspace/GPU/vexcl/tests

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/krishna/workspace/GPU/vexcltestsinstall

# Include any dependencies generated for this target.
include CMakeFiles/logical.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/logical.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/logical.dir/flags.make

CMakeFiles/logical.dir/logical.o: CMakeFiles/logical.dir/flags.make
CMakeFiles/logical.dir/logical.o: /home/krishna/workspace/GPU/vexcl/tests/logical.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/logical.dir/logical.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/logical.dir/logical.o -c /home/krishna/workspace/GPU/vexcl/tests/logical.cpp

CMakeFiles/logical.dir/logical.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/logical.dir/logical.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/logical.cpp > CMakeFiles/logical.dir/logical.i

CMakeFiles/logical.dir/logical.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/logical.dir/logical.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/logical.cpp -o CMakeFiles/logical.dir/logical.s

CMakeFiles/logical.dir/logical.o.requires:
.PHONY : CMakeFiles/logical.dir/logical.o.requires

CMakeFiles/logical.dir/logical.o.provides: CMakeFiles/logical.dir/logical.o.requires
	$(MAKE) -f CMakeFiles/logical.dir/build.make CMakeFiles/logical.dir/logical.o.provides.build
.PHONY : CMakeFiles/logical.dir/logical.o.provides

CMakeFiles/logical.dir/logical.o.provides.build: CMakeFiles/logical.dir/logical.o

# Object files for target logical
logical_OBJECTS = \
"CMakeFiles/logical.dir/logical.o"

# External object files for target logical
logical_EXTERNAL_OBJECTS =

logical: CMakeFiles/logical.dir/logical.o
logical: CMakeFiles/logical.dir/build.make
logical: CMakeFiles/logical.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable logical"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/logical.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/logical.dir/build: logical
.PHONY : CMakeFiles/logical.dir/build

CMakeFiles/logical.dir/requires: CMakeFiles/logical.dir/logical.o.requires
.PHONY : CMakeFiles/logical.dir/requires

CMakeFiles/logical.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/logical.dir/cmake_clean.cmake
.PHONY : CMakeFiles/logical.dir/clean

CMakeFiles/logical.dir/depend:
	cd /home/krishna/workspace/GPU/vexcltestsinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles/logical.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/logical.dir/depend

