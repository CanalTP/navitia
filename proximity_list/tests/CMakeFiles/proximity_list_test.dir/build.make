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
include proximity_list/tests/CMakeFiles/proximity_list_test.dir/depend.make

# Include the progress variables for this target.
include proximity_list/tests/CMakeFiles/proximity_list_test.dir/progress.make

# Include the compile flags for this target's objects.
include proximity_list/tests/CMakeFiles/proximity_list_test.dir/flags.make

proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.o: proximity_list/tests/CMakeFiles/proximity_list_test.dir/flags.make
proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.o: source/proximity_list/tests/test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.o"
	cd /home/runner/work/navitia/navitia/proximity_list/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/proximity_list_test.dir/test.cpp.o -c /home/runner/work/navitia/navitia/source/proximity_list/tests/test.cpp

proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/proximity_list_test.dir/test.cpp.i"
	cd /home/runner/work/navitia/navitia/proximity_list/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/proximity_list/tests/test.cpp > CMakeFiles/proximity_list_test.dir/test.cpp.i

proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/proximity_list_test.dir/test.cpp.s"
	cd /home/runner/work/navitia/navitia/proximity_list/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/proximity_list/tests/test.cpp -o CMakeFiles/proximity_list_test.dir/test.cpp.s

# Object files for target proximity_list_test
proximity_list_test_OBJECTS = \
"CMakeFiles/proximity_list_test.dir/test.cpp.o"

# External object files for target proximity_list_test
proximity_list_test_EXTERNAL_OBJECTS =

proximity_list/tests/proximity_list_test: proximity_list/tests/CMakeFiles/proximity_list_test.dir/test.cpp.o
proximity_list/tests/proximity_list_test: proximity_list/tests/CMakeFiles/proximity_list_test.dir/build.make
proximity_list/tests/proximity_list_test: proximity_list/libproximitylist.a
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
proximity_list/tests/proximity_list_test: type/libtypes.a
proximity_list/tests/proximity_list_test: ptreferential/libptreferential.a
proximity_list/tests/proximity_list_test: type/libpb_converter.a
proximity_list/tests/proximity_list_test: type/libdata.a
proximity_list/tests/proximity_list_test: vptranslator/libvptranslator.a
proximity_list/tests/proximity_list_test: kraken/libfill_disruption_from_database.a
proximity_list/tests/proximity_list_test: routing/librouting.a
proximity_list/tests/proximity_list_test: fare/libfare.a
proximity_list/tests/proximity_list_test: kraken/libmake_disruption_from_chaos.a
proximity_list/tests/proximity_list_test: georef/libgeoref.a
proximity_list/tests/proximity_list_test: kraken/libapply_disruption.a
proximity_list/tests/proximity_list_test: proximity_list/libproximitylist.a
proximity_list/tests/proximity_list_test: type/libtypes.a
proximity_list/tests/proximity_list_test: ptreferential/libptreferential.a
proximity_list/tests/proximity_list_test: type/libpb_converter.a
proximity_list/tests/proximity_list_test: type/libdata.a
proximity_list/tests/proximity_list_test: vptranslator/libvptranslator.a
proximity_list/tests/proximity_list_test: kraken/libfill_disruption_from_database.a
proximity_list/tests/proximity_list_test: routing/librouting.a
proximity_list/tests/proximity_list_test: fare/libfare.a
proximity_list/tests/proximity_list_test: kraken/libmake_disruption_from_chaos.a
proximity_list/tests/proximity_list_test: georef/libgeoref.a
proximity_list/tests/proximity_list_test: kraken/libapply_disruption.a
proximity_list/tests/proximity_list_test: utils/libutils.a
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libpq.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libzmq.so
proximity_list/tests/proximity_list_test: time_tables/libthermometer.a
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_system.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libpqxx.so
proximity_list/tests/proximity_list_test: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
proximity_list/tests/proximity_list_test: autocomplete/libautocomplete.a
proximity_list/tests/proximity_list_test: type/libpb_lib.a
proximity_list/tests/proximity_list_test: libconfig.a
proximity_list/tests/proximity_list_test: proximity_list/tests/CMakeFiles/proximity_list_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable proximity_list_test"
	cd /home/runner/work/navitia/navitia/proximity_list/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/proximity_list_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
proximity_list/tests/CMakeFiles/proximity_list_test.dir/build: proximity_list/tests/proximity_list_test

.PHONY : proximity_list/tests/CMakeFiles/proximity_list_test.dir/build

proximity_list/tests/CMakeFiles/proximity_list_test.dir/clean:
	cd /home/runner/work/navitia/navitia/proximity_list/tests && $(CMAKE_COMMAND) -P CMakeFiles/proximity_list_test.dir/cmake_clean.cmake
.PHONY : proximity_list/tests/CMakeFiles/proximity_list_test.dir/clean

proximity_list/tests/CMakeFiles/proximity_list_test.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/proximity_list/tests /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/proximity_list/tests /home/runner/work/navitia/navitia/proximity_list/tests/CMakeFiles/proximity_list_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : proximity_list/tests/CMakeFiles/proximity_list_test.dir/depend

