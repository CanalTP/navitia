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
include vptranslator/CMakeFiles/vptranslator_test.dir/depend.make

# Include the progress variables for this target.
include vptranslator/CMakeFiles/vptranslator_test.dir/progress.make

# Include the compile flags for this target's objects.
include vptranslator/CMakeFiles/vptranslator_test.dir/flags.make

vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.o: vptranslator/CMakeFiles/vptranslator_test.dir/flags.make
vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.o: source/vptranslator/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.o"
	cd /home/runner/work/navitia/navitia/vptranslator && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vptranslator_test.dir/test.cpp.o -c /home/runner/work/navitia/navitia/source/vptranslator/test.cpp

vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vptranslator_test.dir/test.cpp.i"
	cd /home/runner/work/navitia/navitia/vptranslator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/vptranslator/test.cpp > CMakeFiles/vptranslator_test.dir/test.cpp.i

vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vptranslator_test.dir/test.cpp.s"
	cd /home/runner/work/navitia/navitia/vptranslator && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/vptranslator/test.cpp -o CMakeFiles/vptranslator_test.dir/test.cpp.s

# Object files for target vptranslator_test
vptranslator_test_OBJECTS = \
"CMakeFiles/vptranslator_test.dir/test.cpp.o"

# External object files for target vptranslator_test
vptranslator_test_EXTERNAL_OBJECTS =

vptranslator/vptranslator_test: vptranslator/CMakeFiles/vptranslator_test.dir/test.cpp.o
vptranslator/vptranslator_test: vptranslator/CMakeFiles/vptranslator_test.dir/build.make
vptranslator/vptranslator_test: type/libtypes.a
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
vptranslator/vptranslator_test: ptreferential/libptreferential.a
vptranslator/vptranslator_test: type/libpb_converter.a
vptranslator/vptranslator_test: type/libdata.a
vptranslator/vptranslator_test: vptranslator/libvptranslator.a
vptranslator/vptranslator_test: kraken/libfill_disruption_from_database.a
vptranslator/vptranslator_test: routing/librouting.a
vptranslator/vptranslator_test: fare/libfare.a
vptranslator/vptranslator_test: kraken/libmake_disruption_from_chaos.a
vptranslator/vptranslator_test: georef/libgeoref.a
vptranslator/vptranslator_test: kraken/libapply_disruption.a
vptranslator/vptranslator_test: proximity_list/libproximitylist.a
vptranslator/vptranslator_test: type/libtypes.a
vptranslator/vptranslator_test: ptreferential/libptreferential.a
vptranslator/vptranslator_test: type/libpb_converter.a
vptranslator/vptranslator_test: type/libdata.a
vptranslator/vptranslator_test: vptranslator/libvptranslator.a
vptranslator/vptranslator_test: kraken/libfill_disruption_from_database.a
vptranslator/vptranslator_test: routing/librouting.a
vptranslator/vptranslator_test: fare/libfare.a
vptranslator/vptranslator_test: kraken/libmake_disruption_from_chaos.a
vptranslator/vptranslator_test: georef/libgeoref.a
vptranslator/vptranslator_test: kraken/libapply_disruption.a
vptranslator/vptranslator_test: proximity_list/libproximitylist.a
vptranslator/vptranslator_test: time_tables/libthermometer.a
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_system.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libpqxx.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
vptranslator/vptranslator_test: autocomplete/libautocomplete.a
vptranslator/vptranslator_test: type/libpb_lib.a
vptranslator/vptranslator_test: utils/libutils.a
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libpq.so
vptranslator/vptranslator_test: libconfig.a
vptranslator/vptranslator_test: /usr/lib/x86_64-linux-gnu/libzmq.so
vptranslator/vptranslator_test: vptranslator/CMakeFiles/vptranslator_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable vptranslator_test"
	cd /home/runner/work/navitia/navitia/vptranslator && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vptranslator_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vptranslator/CMakeFiles/vptranslator_test.dir/build: vptranslator/vptranslator_test

.PHONY : vptranslator/CMakeFiles/vptranslator_test.dir/build

vptranslator/CMakeFiles/vptranslator_test.dir/clean:
	cd /home/runner/work/navitia/navitia/vptranslator && $(CMAKE_COMMAND) -P CMakeFiles/vptranslator_test.dir/cmake_clean.cmake
.PHONY : vptranslator/CMakeFiles/vptranslator_test.dir/clean

vptranslator/CMakeFiles/vptranslator_test.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/vptranslator /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/vptranslator /home/runner/work/navitia/navitia/vptranslator/CMakeFiles/vptranslator_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vptranslator/CMakeFiles/vptranslator_test.dir/depend

