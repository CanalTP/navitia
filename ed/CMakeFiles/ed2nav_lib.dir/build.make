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
include ed/CMakeFiles/ed2nav_lib.dir/depend.make

# Include the progress variables for this target.
include ed/CMakeFiles/ed2nav_lib.dir/progress.make

# Include the compile flags for this target's objects.
include ed/CMakeFiles/ed2nav_lib.dir/flags.make

ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o: ed/CMakeFiles/ed2nav_lib.dir/flags.make
ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o: source/ed/ed2nav.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o -c /home/runner/work/navitia/navitia/source/ed/ed2nav.cpp

ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/ed2nav.cpp > CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.i

ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/ed2nav.cpp -o CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.s

ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o: ed/CMakeFiles/ed2nav_lib.dir/flags.make
ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o: source/ed/ed_reader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o -c /home/runner/work/navitia/navitia/source/ed/ed_reader.cpp

ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/ed_reader.cpp > CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.i

ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/ed_reader.cpp -o CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.s

# Object files for target ed2nav_lib
ed2nav_lib_OBJECTS = \
"CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o" \
"CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o"

# External object files for target ed2nav_lib
ed2nav_lib_EXTERNAL_OBJECTS =

ed/libed2nav_lib.a: ed/CMakeFiles/ed2nav_lib.dir/ed2nav.cpp.o
ed/libed2nav_lib.a: ed/CMakeFiles/ed2nav_lib.dir/ed_reader.cpp.o
ed/libed2nav_lib.a: ed/CMakeFiles/ed2nav_lib.dir/build.make
ed/libed2nav_lib.a: ed/CMakeFiles/ed2nav_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libed2nav_lib.a"
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/ed2nav_lib.dir/cmake_clean_target.cmake
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ed2nav_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ed/CMakeFiles/ed2nav_lib.dir/build: ed/libed2nav_lib.a

.PHONY : ed/CMakeFiles/ed2nav_lib.dir/build

ed/CMakeFiles/ed2nav_lib.dir/clean:
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/ed2nav_lib.dir/cmake_clean.cmake
.PHONY : ed/CMakeFiles/ed2nav_lib.dir/clean

ed/CMakeFiles/ed2nav_lib.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed /home/runner/work/navitia/navitia/ed/CMakeFiles/ed2nav_lib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/CMakeFiles/ed2nav_lib.dir/depend

