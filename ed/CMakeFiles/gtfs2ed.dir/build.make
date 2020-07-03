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
include ed/CMakeFiles/gtfs2ed.dir/depend.make

# Include the progress variables for this target.
include ed/CMakeFiles/gtfs2ed.dir/progress.make

# Include the compile flags for this target's objects.
include ed/CMakeFiles/gtfs2ed.dir/flags.make

ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o: ed/CMakeFiles/gtfs2ed.dir/flags.make
ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o: source/ed/gtfs2ed.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o -c /home/runner/work/navitia/navitia/source/ed/gtfs2ed.cpp

ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/gtfs2ed.cpp > CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.i

ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/gtfs2ed.cpp -o CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.s

# Object files for target gtfs2ed
gtfs2ed_OBJECTS = \
"CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o"

# External object files for target gtfs2ed
gtfs2ed_EXTERNAL_OBJECTS =

ed/gtfs2ed: ed/CMakeFiles/gtfs2ed.dir/gtfs2ed.cpp.o
ed/gtfs2ed: ed/CMakeFiles/gtfs2ed.dir/build.make
ed/gtfs2ed: ed/libtransportation_data_import.a
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
ed/gtfs2ed: ed/connectors/libconnectors.a
ed/gtfs2ed: ed/libed.a
ed/gtfs2ed: fare/libfare.a
ed/gtfs2ed: type/libtypes.a
ed/gtfs2ed: routing/librouting.a
ed/gtfs2ed: ptreferential/libptreferential.a
ed/gtfs2ed: georef/libgeoref.a
ed/gtfs2ed: type/libpb_converter.a
ed/gtfs2ed: type/libdata.a
ed/gtfs2ed: proximity_list/libproximitylist.a
ed/gtfs2ed: vptranslator/libvptranslator.a
ed/gtfs2ed: kraken/libfill_disruption_from_database.a
ed/gtfs2ed: kraken/libmake_disruption_from_chaos.a
ed/gtfs2ed: kraken/libapply_disruption.a
ed/gtfs2ed: fare/libfare.a
ed/gtfs2ed: type/libtypes.a
ed/gtfs2ed: routing/librouting.a
ed/gtfs2ed: ptreferential/libptreferential.a
ed/gtfs2ed: georef/libgeoref.a
ed/gtfs2ed: type/libpb_converter.a
ed/gtfs2ed: type/libdata.a
ed/gtfs2ed: proximity_list/libproximitylist.a
ed/gtfs2ed: vptranslator/libvptranslator.a
ed/gtfs2ed: kraken/libfill_disruption_from_database.a
ed/gtfs2ed: kraken/libmake_disruption_from_chaos.a
ed/gtfs2ed: kraken/libapply_disruption.a
ed/gtfs2ed: autocomplete/libautocomplete.a
ed/gtfs2ed: time_tables/libthermometer.a
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_system.so
ed/gtfs2ed: type/libpb_lib.a
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libproj.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libpqxx.so
ed/gtfs2ed: utils/libutils.a
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_regex.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libboost_thread.so
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libpq.so
ed/gtfs2ed: libconfig.a
ed/gtfs2ed: /usr/lib/x86_64-linux-gnu/libzmq.so
ed/gtfs2ed: ed/CMakeFiles/gtfs2ed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gtfs2ed"
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtfs2ed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ed/CMakeFiles/gtfs2ed.dir/build: ed/gtfs2ed

.PHONY : ed/CMakeFiles/gtfs2ed.dir/build

ed/CMakeFiles/gtfs2ed.dir/clean:
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/gtfs2ed.dir/cmake_clean.cmake
.PHONY : ed/CMakeFiles/gtfs2ed.dir/clean

ed/CMakeFiles/gtfs2ed.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed /home/runner/work/navitia/navitia/ed/CMakeFiles/gtfs2ed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/CMakeFiles/gtfs2ed.dir/depend

