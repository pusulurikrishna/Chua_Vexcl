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
include CMakeFiles/context.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/context.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/context.dir/flags.make

CMakeFiles/context.dir/context.o: CMakeFiles/context.dir/flags.make
CMakeFiles/context.dir/context.o: /home/krishna/workspace/GPU/vexcl/tests/context.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/context.dir/context.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/context.dir/context.o -c /home/krishna/workspace/GPU/vexcl/tests/context.cpp

CMakeFiles/context.dir/context.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/context.dir/context.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/context.cpp > CMakeFiles/context.dir/context.i

CMakeFiles/context.dir/context.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/context.dir/context.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/context.cpp -o CMakeFiles/context.dir/context.s

CMakeFiles/context.dir/context.o.requires:
.PHONY : CMakeFiles/context.dir/context.o.requires

CMakeFiles/context.dir/context.o.provides: CMakeFiles/context.dir/context.o.requires
	$(MAKE) -f CMakeFiles/context.dir/build.make CMakeFiles/context.dir/context.o.provides.build
.PHONY : CMakeFiles/context.dir/context.o.provides

CMakeFiles/context.dir/context.o.provides.build: CMakeFiles/context.dir/context.o

# Object files for target context
context_OBJECTS = \
"CMakeFiles/context.dir/context.o"

# External object files for target context
context_EXTERNAL_OBJECTS =

context: CMakeFiles/context.dir/context.o
context: CMakeFiles/context.dir/build.make
context: CMakeFiles/context.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable context"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/context.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/context.dir/build: context
.PHONY : CMakeFiles/context.dir/build

CMakeFiles/context.dir/requires: CMakeFiles/context.dir/context.o.requires
.PHONY : CMakeFiles/context.dir/requires

CMakeFiles/context.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/context.dir/cmake_clean.cmake
.PHONY : CMakeFiles/context.dir/clean

CMakeFiles/context.dir/depend:
	cd /home/krishna/workspace/GPU/vexcltestsinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles/context.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/context.dir/depend

