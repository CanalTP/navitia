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
include ed/CMakeFiles/transportation_data_import.dir/depend.make

# Include the progress variables for this target.
include ed/CMakeFiles/transportation_data_import.dir/progress.make

# Include the compile flags for this target's objects.
include ed/CMakeFiles/transportation_data_import.dir/flags.make

ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o: ed/CMakeFiles/transportation_data_import.dir/flags.make
ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o: source/ed/ed_persistor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o -c /home/runner/work/navitia/navitia/source/ed/ed_persistor.cpp

ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/ed_persistor.cpp > CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.i

ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/ed_persistor.cpp -o CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.s

# Object files for target transportation_data_import
transportation_data_import_OBJECTS = \
"CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o"

# External object files for target transportation_data_import
transportation_data_import_EXTERNAL_OBJECTS =

ed/libtransportation_data_import.a: ed/CMakeFiles/transportation_data_import.dir/ed_persistor.cpp.o
ed/libtransportation_data_import.a: ed/CMakeFiles/transportation_data_import.dir/build.make
ed/libtransportation_data_import.a: ed/CMakeFiles/transportation_data_import.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libtransportation_data_import.a"
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/transportation_data_import.dir/cmake_clean_target.cmake
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/transportation_data_import.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ed/CMakeFiles/transportation_data_import.dir/build: ed/libtransportation_data_import.a

.PHONY : ed/CMakeFiles/transportation_data_import.dir/build

ed/CMakeFiles/transportation_data_import.dir/clean:
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/transportation_data_import.dir/cmake_clean.cmake
.PHONY : ed/CMakeFiles/transportation_data_import.dir/clean

ed/CMakeFiles/transportation_data_import.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed /home/runner/work/navitia/navitia/ed/CMakeFiles/transportation_data_import.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/CMakeFiles/transportation_data_import.dir/depend

