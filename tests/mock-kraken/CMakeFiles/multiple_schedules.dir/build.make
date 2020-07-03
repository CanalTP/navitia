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
include tests/mock-kraken/CMakeFiles/multiple_schedules.dir/depend.make

# Include the progress variables for this target.
include tests/mock-kraken/CMakeFiles/multiple_schedules.dir/progress.make

# Include the compile flags for this target's objects.
include tests/mock-kraken/CMakeFiles/multiple_schedules.dir/flags.make

tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o: tests/mock-kraken/CMakeFiles/multiple_schedules.dir/flags.make
tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o: source/tests/mock-kraken/multiple_schedules.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o -c /home/runner/work/navitia/navitia/source/tests/mock-kraken/multiple_schedules.cpp

tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.i"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/tests/mock-kraken/multiple_schedules.cpp > CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.i

tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.s"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/tests/mock-kraken/multiple_schedules.cpp -o CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.s

# Object files for target multiple_schedules
multiple_schedules_OBJECTS = \
"CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o"

# External object files for target multiple_schedules
multiple_schedules_EXTERNAL_OBJECTS =

tests/mock-kraken/multiple_schedules: tests/mock-kraken/CMakeFiles/multiple_schedules.dir/multiple_schedules.cpp.o
tests/mock-kraken/multiple_schedules: tests/mock-kraken/CMakeFiles/multiple_schedules.dir/build.make
tests/mock-kraken/multiple_schedules: kraken/libworkers.a
tests/mock-kraken/multiple_schedules: ed/libed.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
tests/mock-kraken/multiple_schedules: kraken/librt_handling.a
tests/mock-kraken/multiple_schedules: third_party/SimpleAmqpClient/libSimpleAmqpClient.a
tests/mock-kraken/multiple_schedules: third_party/librabbitmq-c/librabbitmq/librabbitmq.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libssl.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libcrypto.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
tests/mock-kraken/multiple_schedules: equipment/libequipment_api.a
tests/mock-kraken/multiple_schedules: disruption/libdisruption_api.a
tests/mock-kraken/multiple_schedules: calendar/libcalendar_api.a
tests/mock-kraken/multiple_schedules: time_tables/libtime_tables.a
tests/mock-kraken/multiple_schedules: third_party/prometheus-cpp/pull/libprometheus-cpp-pull.a
tests/mock-kraken/multiple_schedules: third_party/prometheus-cpp/core/libprometheus-cpp-core.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
tests/mock-kraken/multiple_schedules: type/libtypes.a
tests/mock-kraken/multiple_schedules: fare/libfare.a
tests/mock-kraken/multiple_schedules: kraken/libapply_disruption.a
tests/mock-kraken/multiple_schedules: routing/librouting.a
tests/mock-kraken/multiple_schedules: ptreferential/libptreferential.a
tests/mock-kraken/multiple_schedules: georef/libgeoref.a
tests/mock-kraken/multiple_schedules: type/libpb_converter.a
tests/mock-kraken/multiple_schedules: type/libdata.a
tests/mock-kraken/multiple_schedules: proximity_list/libproximitylist.a
tests/mock-kraken/multiple_schedules: vptranslator/libvptranslator.a
tests/mock-kraken/multiple_schedules: kraken/libfill_disruption_from_database.a
tests/mock-kraken/multiple_schedules: kraken/libmake_disruption_from_chaos.a
tests/mock-kraken/multiple_schedules: type/libtypes.a
tests/mock-kraken/multiple_schedules: fare/libfare.a
tests/mock-kraken/multiple_schedules: kraken/libapply_disruption.a
tests/mock-kraken/multiple_schedules: routing/librouting.a
tests/mock-kraken/multiple_schedules: ptreferential/libptreferential.a
tests/mock-kraken/multiple_schedules: georef/libgeoref.a
tests/mock-kraken/multiple_schedules: type/libpb_converter.a
tests/mock-kraken/multiple_schedules: type/libdata.a
tests/mock-kraken/multiple_schedules: proximity_list/libproximitylist.a
tests/mock-kraken/multiple_schedules: vptranslator/libvptranslator.a
tests/mock-kraken/multiple_schedules: kraken/libfill_disruption_from_database.a
tests/mock-kraken/multiple_schedules: kraken/libmake_disruption_from_chaos.a
tests/mock-kraken/multiple_schedules: autocomplete/libautocomplete.a
tests/mock-kraken/multiple_schedules: time_tables/libthermometer.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_system.so
tests/mock-kraken/multiple_schedules: utils/libutils.a
tests/mock-kraken/multiple_schedules: libconfig.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_regex.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_thread.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libpq.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libzmq.so
tests/mock-kraken/multiple_schedules: type/libpb_lib.a
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libpqxx.so
tests/mock-kraken/multiple_schedules: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
tests/mock-kraken/multiple_schedules: tests/mock-kraken/CMakeFiles/multiple_schedules.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable multiple_schedules"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/multiple_schedules.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/mock-kraken/CMakeFiles/multiple_schedules.dir/build: tests/mock-kraken/multiple_schedules

.PHONY : tests/mock-kraken/CMakeFiles/multiple_schedules.dir/build

tests/mock-kraken/CMakeFiles/multiple_schedules.dir/clean:
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && $(CMAKE_COMMAND) -P CMakeFiles/multiple_schedules.dir/cmake_clean.cmake
.PHONY : tests/mock-kraken/CMakeFiles/multiple_schedules.dir/clean

tests/mock-kraken/CMakeFiles/multiple_schedules.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/tests/mock-kraken /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/tests/mock-kraken /home/runner/work/navitia/navitia/tests/mock-kraken/CMakeFiles/multiple_schedules.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/mock-kraken/CMakeFiles/multiple_schedules.dir/depend

