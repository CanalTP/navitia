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
include ed/CMakeFiles/synonym2ed.dir/depend.make

# Include the progress variables for this target.
include ed/CMakeFiles/synonym2ed.dir/progress.make

# Include the compile flags for this target's objects.
include ed/CMakeFiles/synonym2ed.dir/flags.make

ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o: ed/CMakeFiles/synonym2ed.dir/flags.make
ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o: source/ed/synonym2ed.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o -c /home/runner/work/navitia/navitia/source/ed/synonym2ed.cpp

ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/synonym2ed.dir/synonym2ed.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/synonym2ed.cpp > CMakeFiles/synonym2ed.dir/synonym2ed.cpp.i

ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/synonym2ed.dir/synonym2ed.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/synonym2ed.cpp -o CMakeFiles/synonym2ed.dir/synonym2ed.cpp.s

# Object files for target synonym2ed
synonym2ed_OBJECTS = \
"CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o"

# External object files for target synonym2ed
synonym2ed_EXTERNAL_OBJECTS =

ed/synonym2ed: ed/CMakeFiles/synonym2ed.dir/synonym2ed.cpp.o
ed/synonym2ed: ed/CMakeFiles/synonym2ed.dir/build.make
ed/synonym2ed: ed/libtransportation_data_import.a
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
ed/synonym2ed: ed/connectors/libconnectors.a
ed/synonym2ed: ed/libed.a
ed/synonym2ed: fare/libfare.a
ed/synonym2ed: type/libtypes.a
ed/synonym2ed: routing/librouting.a
ed/synonym2ed: ptreferential/libptreferential.a
ed/synonym2ed: georef/libgeoref.a
ed/synonym2ed: type/libpb_converter.a
ed/synonym2ed: type/libdata.a
ed/synonym2ed: proximity_list/libproximitylist.a
ed/synonym2ed: vptranslator/libvptranslator.a
ed/synonym2ed: kraken/libfill_disruption_from_database.a
ed/synonym2ed: kraken/libmake_disruption_from_chaos.a
ed/synonym2ed: kraken/libapply_disruption.a
ed/synonym2ed: fare/libfare.a
ed/synonym2ed: type/libtypes.a
ed/synonym2ed: routing/librouting.a
ed/synonym2ed: ptreferential/libptreferential.a
ed/synonym2ed: georef/libgeoref.a
ed/synonym2ed: type/libpb_converter.a
ed/synonym2ed: type/libdata.a
ed/synonym2ed: proximity_list/libproximitylist.a
ed/synonym2ed: vptranslator/libvptranslator.a
ed/synonym2ed: kraken/libfill_disruption_from_database.a
ed/synonym2ed: kraken/libmake_disruption_from_chaos.a
ed/synonym2ed: kraken/libapply_disruption.a
ed/synonym2ed: autocomplete/libautocomplete.a
ed/synonym2ed: time_tables/libthermometer.a
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_system.so
ed/synonym2ed: type/libpb_lib.a
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libproj.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libpqxx.so
ed/synonym2ed: utils/libutils.a
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_regex.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libboost_thread.so
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libpq.so
ed/synonym2ed: libconfig.a
ed/synonym2ed: /usr/lib/x86_64-linux-gnu/libzmq.so
ed/synonym2ed: ed/CMakeFiles/synonym2ed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable synonym2ed"
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/synonym2ed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ed/CMakeFiles/synonym2ed.dir/build: ed/synonym2ed

.PHONY : ed/CMakeFiles/synonym2ed.dir/build

ed/CMakeFiles/synonym2ed.dir/clean:
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/synonym2ed.dir/cmake_clean.cmake
.PHONY : ed/CMakeFiles/synonym2ed.dir/clean

ed/CMakeFiles/synonym2ed.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed /home/runner/work/navitia/navitia/ed/CMakeFiles/synonym2ed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/CMakeFiles/synonym2ed.dir/depend

