# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/runner/work/navitia/navitia/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/runner/work/navitia/navitia

# Include any dependencies generated for this target.
include lz4_filter/tests/CMakeFiles/lz4_tests.dir/depend.make

# Include the progress variables for this target.
include lz4_filter/tests/CMakeFiles/lz4_tests.dir/progress.make

# Include the compile flags for this target's objects.
include lz4_filter/tests/CMakeFiles/lz4_tests.dir/flags.make

lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.o: lz4_filter/tests/CMakeFiles/lz4_tests.dir/flags.make
lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.o: source/lz4_filter/tests/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.o"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lz4_tests.dir/test.cpp.o -c /home/runner/work/navitia/navitia/source/lz4_filter/tests/test.cpp

lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lz4_tests.dir/test.cpp.i"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/lz4_filter/tests/test.cpp > CMakeFiles/lz4_tests.dir/test.cpp.i

lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lz4_tests.dir/test.cpp.s"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/lz4_filter/tests/test.cpp -o CMakeFiles/lz4_tests.dir/test.cpp.s

lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o: lz4_filter/tests/CMakeFiles/lz4_tests.dir/flags.make
lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o: source/third_party/lz4/lz4.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o   -c /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c

lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.i"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c > CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.i

lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.s"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c -o CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.s

# Object files for target lz4_tests
lz4_tests_OBJECTS = \
"CMakeFiles/lz4_tests.dir/test.cpp.o" \
"CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o"

# External object files for target lz4_tests
lz4_tests_EXTERNAL_OBJECTS =

lz4_filter/tests/lz4_tests: lz4_filter/tests/CMakeFiles/lz4_tests.dir/test.cpp.o
lz4_filter/tests/lz4_tests: lz4_filter/tests/CMakeFiles/lz4_tests.dir/__/__/third_party/lz4/lz4.c.o
lz4_filter/tests/lz4_tests: lz4_filter/tests/CMakeFiles/lz4_tests.dir/build.make
lz4_filter/tests/lz4_tests: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
lz4_filter/tests/lz4_tests: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
lz4_filter/tests/lz4_tests: lz4_filter/tests/CMakeFiles/lz4_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable lz4_tests"
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lz4_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lz4_filter/tests/CMakeFiles/lz4_tests.dir/build: lz4_filter/tests/lz4_tests

.PHONY : lz4_filter/tests/CMakeFiles/lz4_tests.dir/build

lz4_filter/tests/CMakeFiles/lz4_tests.dir/clean:
	cd /home/runner/work/navitia/navitia/lz4_filter/tests && $(CMAKE_COMMAND) -P CMakeFiles/lz4_tests.dir/cmake_clean.cmake
.PHONY : lz4_filter/tests/CMakeFiles/lz4_tests.dir/clean

lz4_filter/tests/CMakeFiles/lz4_tests.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/lz4_filter/tests /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/lz4_filter/tests /home/runner/work/navitia/navitia/lz4_filter/tests/CMakeFiles/lz4_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lz4_filter/tests/CMakeFiles/lz4_tests.dir/depend

