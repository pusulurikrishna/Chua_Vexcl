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
CMAKE_SOURCE_DIR = /home/krishna/workspace/lorenz_vexcl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/krishna/workspace/lorenz_vexclinstall

# Include any dependencies generated for this target.
include CMakeFiles/new_sweep.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/new_sweep.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/new_sweep.dir/flags.make

CMakeFiles/new_sweep.dir/new_sweep.cpp.o: CMakeFiles/new_sweep.dir/flags.make
CMakeFiles/new_sweep.dir/new_sweep.cpp.o: /home/krishna/workspace/lorenz_vexcl/new_sweep.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/krishna/workspace/lorenz_vexclinstall/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/new_sweep.dir/new_sweep.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/new_sweep.dir/new_sweep.cpp.o -c /home/krishna/workspace/lorenz_vexcl/new_sweep.cpp

CMakeFiles/new_sweep.dir/new_sweep.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/new_sweep.dir/new_sweep.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/krishna/workspace/lorenz_vexcl/new_sweep.cpp > CMakeFiles/new_sweep.dir/new_sweep.cpp.i

CMakeFiles/new_sweep.dir/new_sweep.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/new_sweep.dir/new_sweep.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/krishna/workspace/lorenz_vexcl/new_sweep.cpp -o CMakeFiles/new_sweep.dir/new_sweep.cpp.s

CMakeFiles/new_sweep.dir/new_sweep.cpp.o.requires:
.PHONY : CMakeFiles/new_sweep.dir/new_sweep.cpp.o.requires

CMakeFiles/new_sweep.dir/new_sweep.cpp.o.provides: CMakeFiles/new_sweep.dir/new_sweep.cpp.o.requires
	$(MAKE) -f CMakeFiles/new_sweep.dir/build.make CMakeFiles/new_sweep.dir/new_sweep.cpp.o.provides.build
.PHONY : CMakeFiles/new_sweep.dir/new_sweep.cpp.o.provides

CMakeFiles/new_sweep.dir/new_sweep.cpp.o.provides.build: CMakeFiles/new_sweep.dir/new_sweep.cpp.o

# Object files for target new_sweep
new_sweep_OBJECTS = \
"CMakeFiles/new_sweep.dir/new_sweep.cpp.o"

# External object files for target new_sweep
new_sweep_EXTERNAL_OBJECTS =

new_sweep: CMakeFiles/new_sweep.dir/new_sweep.cpp.o
new_sweep: CMakeFiles/new_sweep.dir/build.make
new_sweep: /usr/lib/libboost_filesystem.so
new_sweep: /usr/lib/libboost_system.so
new_sweep: /usr/lib/libboost_program_options.so
new_sweep: /usr/lib/x86_64-linux-gnu/libcuda.so
new_sweep: CMakeFiles/new_sweep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable new_sweep"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/new_sweep.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/new_sweep.dir/build: new_sweep
.PHONY : CMakeFiles/new_sweep.dir/build

CMakeFiles/new_sweep.dir/requires: CMakeFiles/new_sweep.dir/new_sweep.cpp.o.requires
.PHONY : CMakeFiles/new_sweep.dir/requires

CMakeFiles/new_sweep.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/new_sweep.dir/cmake_clean.cmake
.PHONY : CMakeFiles/new_sweep.dir/clean

CMakeFiles/new_sweep.dir/depend:
	cd /home/krishna/workspace/lorenz_vexclinstall && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krishna/workspace/lorenz_vexcl /home/krishna/workspace/lorenz_vexcl /home/krishna/workspace/lorenz_vexclinstall /home/krishna/workspace/lorenz_vexclinstall /home/krishna/workspace/lorenz_vexclinstall/CMakeFiles/new_sweep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/new_sweep.dir/depend

