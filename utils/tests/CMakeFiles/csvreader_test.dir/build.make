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
include utils/tests/CMakeFiles/csvreader_test.dir/depend.make

# Include the progress variables for this target.
include utils/tests/CMakeFiles/csvreader_test.dir/progress.make

# Include the compile flags for this target's objects.
include utils/tests/CMakeFiles/csvreader_test.dir/flags.make

utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o: utils/tests/CMakeFiles/csvreader_test.dir/flags.make
utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o: source/utils/tests/csvreader_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o"
	cd /home/runner/work/navitia/navitia/utils/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o -c /home/runner/work/navitia/navitia/source/utils/tests/csvreader_test.cpp

utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/csvreader_test.dir/csvreader_test.cpp.i"
	cd /home/runner/work/navitia/navitia/utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/utils/tests/csvreader_test.cpp > CMakeFiles/csvreader_test.dir/csvreader_test.cpp.i

utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/csvreader_test.dir/csvreader_test.cpp.s"
	cd /home/runner/work/navitia/navitia/utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/utils/tests/csvreader_test.cpp -o CMakeFiles/csvreader_test.dir/csvreader_test.cpp.s

# Object files for target csvreader_test
csvreader_test_OBJECTS = \
"CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o"

# External object files for target csvreader_test
csvreader_test_EXTERNAL_OBJECTS =

utils/tests/csvreader_test: utils/tests/CMakeFiles/csvreader_test.dir/csvreader_test.cpp.o
utils/tests/csvreader_test: utils/tests/CMakeFiles/csvreader_test.dir/build.make
utils/tests/csvreader_test: utils/libutils.a
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_system.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libpq.so
utils/tests/csvreader_test: libconfig.a
utils/tests/csvreader_test: /usr/lib/x86_64-linux-gnu/libzmq.so
utils/tests/csvreader_test: utils/tests/CMakeFiles/csvreader_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable csvreader_test"
	cd /home/runner/work/navitia/navitia/utils/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/csvreader_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/tests/CMakeFiles/csvreader_test.dir/build: utils/tests/csvreader_test

.PHONY : utils/tests/CMakeFiles/csvreader_test.dir/build

utils/tests/CMakeFiles/csvreader_test.dir/clean:
	cd /home/runner/work/navitia/navitia/utils/tests && $(CMAKE_COMMAND) -P CMakeFiles/csvreader_test.dir/cmake_clean.cmake
.PHONY : utils/tests/CMakeFiles/csvreader_test.dir/clean

utils/tests/CMakeFiles/csvreader_test.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/utils/tests /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/utils/tests /home/runner/work/navitia/navitia/utils/tests/CMakeFiles/csvreader_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/tests/CMakeFiles/csvreader_test.dir/depend

