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
include ed/CMakeFiles/fare2ed.dir/depend.make

# Include the progress variables for this target.
include ed/CMakeFiles/fare2ed.dir/progress.make

# Include the compile flags for this target's objects.
include ed/CMakeFiles/fare2ed.dir/flags.make

ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o: ed/CMakeFiles/fare2ed.dir/flags.make
ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o: source/ed/fare2ed_main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o -c /home/runner/work/navitia/navitia/source/ed/fare2ed_main.cpp

ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fare2ed.dir/fare2ed_main.cpp.i"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/ed/fare2ed_main.cpp > CMakeFiles/fare2ed.dir/fare2ed_main.cpp.i

ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fare2ed.dir/fare2ed_main.cpp.s"
	cd /home/runner/work/navitia/navitia/ed && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/ed/fare2ed_main.cpp -o CMakeFiles/fare2ed.dir/fare2ed_main.cpp.s

# Object files for target fare2ed
fare2ed_OBJECTS = \
"CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o"

# External object files for target fare2ed
fare2ed_EXTERNAL_OBJECTS =

ed/fare2ed: ed/CMakeFiles/fare2ed.dir/fare2ed_main.cpp.o
ed/fare2ed: ed/CMakeFiles/fare2ed.dir/build.make
ed/fare2ed: ed/libfare2ed_lib.a
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
ed/fare2ed: ed/libtransportation_data_import.a
ed/fare2ed: ed/connectors/libconnectors.a
ed/fare2ed: ed/libed.a
ed/fare2ed: fare/libfare.a
ed/fare2ed: type/libtypes.a
ed/fare2ed: routing/librouting.a
ed/fare2ed: ptreferential/libptreferential.a
ed/fare2ed: georef/libgeoref.a
ed/fare2ed: type/libpb_converter.a
ed/fare2ed: type/libdata.a
ed/fare2ed: proximity_list/libproximitylist.a
ed/fare2ed: vptranslator/libvptranslator.a
ed/fare2ed: kraken/libfill_disruption_from_database.a
ed/fare2ed: kraken/libmake_disruption_from_chaos.a
ed/fare2ed: kraken/libapply_disruption.a
ed/fare2ed: fare/libfare.a
ed/fare2ed: type/libtypes.a
ed/fare2ed: routing/librouting.a
ed/fare2ed: ptreferential/libptreferential.a
ed/fare2ed: georef/libgeoref.a
ed/fare2ed: type/libpb_converter.a
ed/fare2ed: type/libdata.a
ed/fare2ed: proximity_list/libproximitylist.a
ed/fare2ed: vptranslator/libvptranslator.a
ed/fare2ed: kraken/libfill_disruption_from_database.a
ed/fare2ed: kraken/libmake_disruption_from_chaos.a
ed/fare2ed: kraken/libapply_disruption.a
ed/fare2ed: autocomplete/libautocomplete.a
ed/fare2ed: time_tables/libthermometer.a
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_system.so
ed/fare2ed: type/libpb_lib.a
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libproj.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libpqxx.so
ed/fare2ed: utils/libutils.a
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_regex.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libboost_thread.so
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libpq.so
ed/fare2ed: libconfig.a
ed/fare2ed: /usr/lib/x86_64-linux-gnu/libzmq.so
ed/fare2ed: ed/CMakeFiles/fare2ed.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fare2ed"
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fare2ed.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ed/CMakeFiles/fare2ed.dir/build: ed/fare2ed

.PHONY : ed/CMakeFiles/fare2ed.dir/build

ed/CMakeFiles/fare2ed.dir/clean:
	cd /home/runner/work/navitia/navitia/ed && $(CMAKE_COMMAND) -P CMakeFiles/fare2ed.dir/cmake_clean.cmake
.PHONY : ed/CMakeFiles/fare2ed.dir/clean

ed/CMakeFiles/fare2ed.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed /home/runner/work/navitia/navitia/ed/CMakeFiles/fare2ed.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/CMakeFiles/fare2ed.dir/depend

