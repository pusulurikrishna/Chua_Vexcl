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
include CMakeFiles/scan_by_key.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/scan_by_key.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/scan_by_key.dir/flags.make

CMakeFiles/scan_by_key.dir/scan_by_key.o: CMakeFiles/scan_by_key.dir/flags.make
CMakeFiles/scan_by_key.dir/scan_by_key.o: /home/krishna/workspace/GPU/vexcl/tests/scan_by_key.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/scan_by_key.dir/scan_by_key.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/scan_by_key.dir/scan_by_key.o -c /home/krishna/workspace/GPU/vexcl/tests/scan_by_key.cpp

CMakeFiles/scan_by_key.dir/scan_by_key.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/scan_by_key.dir/scan_by_key.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/scan_by_key.cpp > CMakeFiles/scan_by_key.dir/scan_by_key.i

CMakeFiles/scan_by_key.dir/scan_by_key.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/scan_by_key.dir/scan_by_key.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/scan_by_key.cpp -o CMakeFiles/scan_by_key.dir/scan_by_key.s

CMakeFiles/scan_by_key.dir/scan_by_key.o.requires:
.PHONY : CMakeFiles/scan_by_key.dir/scan_by_key.o.requires

CMakeFiles/scan_by_key.dir/scan_by_key.o.provides: CMakeFiles/scan_by_key.dir/scan_by_key.o.requires
	$(MAKE) -f CMakeFiles/scan_by_key.dir/build.make CMakeFiles/scan_by_key.dir/scan_by_key.o.provides.build
.PHONY : CMakeFiles/scan_by_key.dir/scan_by_key.o.provides

CMakeFiles/scan_by_key.dir/scan_by_key.o.provides.build: CMakeFiles/scan_by_key.dir/scan_by_key.o

# Object files for target scan_by_key
scan_by_key_OBJECTS = \
"CMakeFiles/scan_by_key.dir/scan_by_key.o"

# External object files for target scan_by_key
scan_by_key_EXTERNAL_OBJECTS =

scan_by_key: CMakeFiles/scan_by_key.dir/scan_by_key.o
scan_by_key: CMakeFiles/scan_by_key.dir/build.make
scan_by_key: CMakeFiles/scan_by_key.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable scan_by_key"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scan_by_key.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/scan_by_key.dir/build: scan_by_key
.PHONY : CMakeFiles/scan_by_key.dir/build

CMakeFiles/scan_by_key.dir/requires: CMakeFiles/scan_by_key.dir/scan_by_key.o.requires
.PHONY : CMakeFiles/scan_by_key.dir/requires

CMakeFiles/scan_by_key.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/scan_by_key.dir/cmake_clean.cmake
.PHONY : CMakeFiles/scan_by_key.dir/clean

CMakeFiles/scan_by_key.dir/depend:
	cd /home/krishna/workspace/GPU/vexcltestsinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall /home/krishna/workspace/GPU/vexcltestsinstall/CMakeFiles/scan_by_key.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/scan_by_key.dir/depend

