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
include proximity_list/CMakeFiles/proximitylist.dir/depend.make

# Include the progress variables for this target.
include proximity_list/CMakeFiles/proximitylist.dir/progress.make

# Include the compile flags for this target's objects.
include proximity_list/CMakeFiles/proximitylist.dir/flags.make

proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.o: proximity_list/CMakeFiles/proximitylist.dir/flags.make
proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.o: source/proximity_list/proximity_list.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.o"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/proximitylist.dir/proximity_list.cpp.o -c /home/runner/work/navitia/navitia/source/proximity_list/proximity_list.cpp

proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/proximitylist.dir/proximity_list.cpp.i"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/proximity_list/proximity_list.cpp > CMakeFiles/proximitylist.dir/proximity_list.cpp.i

proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/proximitylist.dir/proximity_list.cpp.s"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/proximity_list/proximity_list.cpp -o CMakeFiles/proximitylist.dir/proximity_list.cpp.s

proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o: proximity_list/CMakeFiles/proximitylist.dir/flags.make
proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o: source/proximity_list/proximitylist_api.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o -c /home/runner/work/navitia/navitia/source/proximity_list/proximitylist_api.cpp

proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/proximitylist.dir/proximitylist_api.cpp.i"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/proximity_list/proximitylist_api.cpp > CMakeFiles/proximitylist.dir/proximitylist_api.cpp.i

proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/proximitylist.dir/proximitylist_api.cpp.s"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/proximity_list/proximitylist_api.cpp -o CMakeFiles/proximitylist.dir/proximitylist_api.cpp.s

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o: proximity_list/CMakeFiles/proximitylist.dir/flags.make
proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o: source/third_party/lz4/lz4hc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o   -c /home/runner/work/navitia/navitia/source/third_party/lz4/lz4hc.c

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.i"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/lz4/lz4hc.c > CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.i

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.s"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/lz4/lz4hc.c -o CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.s

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o: proximity_list/CMakeFiles/proximitylist.dir/flags.make
proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o: source/third_party/lz4/lz4.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o   -c /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.i"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c > CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.i

proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.s"
	cd /home/runner/work/navitia/navitia/proximity_list && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/lz4/lz4.c -o CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.s

# Object files for target proximitylist
proximitylist_OBJECTS = \
"CMakeFiles/proximitylist.dir/proximity_list.cpp.o" \
"CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o" \
"CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o" \
"CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o"

# External object files for target proximitylist
proximitylist_EXTERNAL_OBJECTS =

proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/proximity_list.cpp.o
proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/proximitylist_api.cpp.o
proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4hc.c.o
proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/__/third_party/lz4/lz4.c.o
proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/build.make
proximity_list/libproximitylist.a: proximity_list/CMakeFiles/proximitylist.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libproximitylist.a"
	cd /home/runner/work/navitia/navitia/proximity_list && $(CMAKE_COMMAND) -P CMakeFiles/proximitylist.dir/cmake_clean_target.cmake
	cd /home/runner/work/navitia/navitia/proximity_list && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/proximitylist.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
proximity_list/CMakeFiles/proximitylist.dir/build: proximity_list/libproximitylist.a

.PHONY : proximity_list/CMakeFiles/proximitylist.dir/build

proximity_list/CMakeFiles/proximitylist.dir/clean:
	cd /home/runner/work/navitia/navitia/proximity_list && $(CMAKE_COMMAND) -P CMakeFiles/proximitylist.dir/cmake_clean.cmake
.PHONY : proximity_list/CMakeFiles/proximitylist.dir/clean

proximity_list/CMakeFiles/proximitylist.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/proximity_list /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/proximity_list /home/runner/work/navitia/navitia/proximity_list/CMakeFiles/proximitylist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : proximity_list/CMakeFiles/proximitylist.dir/depend

