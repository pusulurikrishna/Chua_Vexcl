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
include CMakeFiles/vector_pointer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vector_pointer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vector_pointer.dir/flags.make

CMakeFiles/vector_pointer.dir/vector_pointer.o: CMakeFiles/vector_pointer.dir/flags.make
CMakeFiles/vector_pointer.dir/vector_pointer.o: /home/krishna/workspace/GPU/vexcl/tests/vector_pointer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/vector_pointer.dir/vector_pointer.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/vector_pointer.dir/vector_pointer.o -c /home/krishna/workspace/GPU/vexcl/tests/vector_pointer.cpp

CMakeFiles/vector_pointer.dir/vector_pointer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vector_pointer.dir/vector_pointer.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/vector_pointer.cpp > CMakeFiles/vector_pointer.dir/vector_pointer.i

CMakeFiles/vector_pointer.dir/vector_pointer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vector_pointer.dir/vector_pointer.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/vector_pointer.cpp -o CMakeFiles/vector_pointer.dir/vector_pointer.s

CMakeFiles/vector_pointer.dir/vector_pointer.o.requires:
.PHONY : CMakeFiles/vector_pointer.dir/vector_pointer.o.requires

CMakeFiles/vector_pointer.dir/vector_pointer.o.provides: CMakeFiles/vector_pointer.dir/vector_pointer.o.requires
	$(MAKE) -f CMakeFiles/vector_pointer.dir/build.make CMakeFiles/vector_pointer.dir/vector_pointer.o.provides.build
.PHONY : CMakeFiles/vector_pointer.dir/vector_pointer.o.provides

CMakeFiles/vector_pointer.dir/vector_pointer.o.provides.build: CMakeFiles/vector_pointer.dir/vector_pointer.o

# Object files for target vector_pointer
vector_pointer_OBJECTS = \
"CMakeFiles/vector_pointer.dir/vector_pointer.o"

# External object files for target vector_pointer
vector_pointer_EXTERNAL_OBJECTS =

vector_pointer: CMakeFiles/vector_pointer.dir/vector_pointer.o
vector_pointer: CMakeFiles/vector_pointer.dir/build.make
vector_pointer: CMakeFiles/vector_pointer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable vector_pointer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vector_pointer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vector_pointer.dir/build: vector_pointer
.PHONY : CMakeFiles/vector_pointer.dir/build

CMakeFiles/vector_pointer.dir/requires: CMakeFiles/vector_pointer.dir/vector_pointer.o.requires
.PHONY : CMakeFiles/vector_pointer.dir/requires

CMakeFiles/vector_pointer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vector_pointer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vector_pointer.dir/clean

CMakeFiles/vector_pointer.dir/depend:
	cd /home/krishna/workspace/GPU/vexcltestsinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles/vector_pointer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vector_pointer.dir/depend

