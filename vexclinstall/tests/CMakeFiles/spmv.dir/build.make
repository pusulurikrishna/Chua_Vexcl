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
include tests/CMakeFiles/spmv.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/spmv.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/spmv.dir/flags.make

tests/CMakeFiles/spmv.dir/spmv.cpp.o: tests/CMakeFiles/spmv.dir/flags.make
tests/CMakeFiles/spmv.dir/spmv.cpp.o: /home/krishna/workspace/GPU/vexcl/tests/spmv.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/GPU/vexclinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tests/CMakeFiles/spmv.dir/spmv.cpp.o"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/spmv.dir/spmv.cpp.o -c /home/krishna/workspace/GPU/vexcl/tests/spmv.cpp

tests/CMakeFiles/spmv.dir/spmv.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/spmv.dir/spmv.cpp.i"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/GPU/vexcl/tests/spmv.cpp > CMakeFiles/spmv.dir/spmv.cpp.i

tests/CMakeFiles/spmv.dir/spmv.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/spmv.dir/spmv.cpp.s"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/GPU/vexcl/tests/spmv.cpp -o CMakeFiles/spmv.dir/spmv.cpp.s

tests/CMakeFiles/spmv.dir/spmv.cpp.o.requires:
.PHONY : tests/CMakeFiles/spmv.dir/spmv.cpp.o.requires

tests/CMakeFiles/spmv.dir/spmv.cpp.o.provides: tests/CMakeFiles/spmv.dir/spmv.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/spmv.dir/build.make tests/CMakeFiles/spmv.dir/spmv.cpp.o.provides.build
.PHONY : tests/CMakeFiles/spmv.dir/spmv.cpp.o.provides

tests/CMakeFiles/spmv.dir/spmv.cpp.o.provides.build: tests/CMakeFiles/spmv.dir/spmv.cpp.o

# Object files for target spmv
spmv_OBJECTS = \
"CMakeFiles/spmv.dir/spmv.cpp.o"

# External object files for target spmv
spmv_EXTERNAL_OBJECTS =

tests/spmv: tests/CMakeFiles/spmv.dir/spmv.cpp.o
tests/spmv: tests/CMakeFiles/spmv.dir/build.make
tests/spmv: /usr/lib/libboost_date_time.so
tests/spmv: /usr/lib/libboost_filesystem.so
tests/spmv: /usr/lib/libboost_system.so
tests/spmv: /usr/lib/libboost_thread.so
tests/spmv: /usr/lib/libboost_unit_test_framework.so
tests/spmv: /usr/lib/libboost_program_options.so
tests/spmv: /usr/lib/x86_64-linux-gnu/libpthread.so
tests/spmv: tests/CMakeFiles/spmv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable spmv"
	cd /home/krishna/workspace/GPU/vexclinstall/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spmv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/spmv.dir/build: tests/spmv
.PHONY : tests/CMakeFiles/spmv.dir/build

tests/CMakeFiles/spmv.dir/requires: tests/CMakeFiles/spmv.dir/spmv.cpp.o.requires
.PHONY : tests/CMakeFiles/spmv.dir/requires

tests/CMakeFiles/spmv.dir/clean:
	cd /home/krishna/workspace/GPU/vexclinstall/tests && $(CMAKE_COMMAND) -P CMakeFiles/spmv.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/spmv.dir/clean

tests/CMakeFiles/spmv.dir/depend:
	cd /home/krishna/workspace/GPU/vexclinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/GPU/vexcl /home/krishna/workspace/GPU/vexcl/tests /home/krishna/workspace/GPU/vexclinstall /home/krishna/workspace/GPU/vexclinstall/tests /home/krishna/workspace/GPU/vexclinstall/tests/CMakeFiles/spmv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/spmv.dir/depend

