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
include third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/depend.make

# Include the progress variables for this target.
include third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/flags.make

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.o: third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/flags.make
third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.o: source/third_party/prometheus-cpp/3rdparty/civetweb/src/CivetServer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.o"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.o -c /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/CivetServer.cpp

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.i"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/CivetServer.cpp > CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.i

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.s"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/CivetServer.cpp -o CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.s

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.o: third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/flags.make
third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.o: source/third_party/prometheus-cpp/3rdparty/civetweb/src/civetweb.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.o"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.o   -c /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/civetweb.c

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.i"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/civetweb.c > CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.i

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.s"
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/3rdparty/civetweb/src/civetweb.c -o CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.s

civetweb: third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/CivetServer.cpp.o
civetweb: third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/__/3rdparty/civetweb/src/civetweb.c.o
civetweb: third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/build.make

.PHONY : civetweb

# Rule to build all files generated by this target.
third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/build: civetweb

.PHONY : third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/build

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/clean:
	cd /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull && $(CMAKE_COMMAND) -P CMakeFiles/civetweb.dir/cmake_clean.cmake
.PHONY : third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/clean

third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/third_party/prometheus-cpp/pull /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull /home/runner/work/navitia/navitia/third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : third_party/prometheus-cpp/pull/CMakeFiles/civetweb.dir/depend

