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
include tests/mock-kraken/CMakeFiles/empty_routing_test.dir/depend.make

# Include the progress variables for this target.
include tests/mock-kraken/CMakeFiles/empty_routing_test.dir/progress.make

# Include the compile flags for this target's objects.
include tests/mock-kraken/CMakeFiles/empty_routing_test.dir/flags.make

tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o: tests/mock-kraken/CMakeFiles/empty_routing_test.dir/flags.make
tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o: source/tests/mock-kraken/empty_routing_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o -c /home/runner/work/navitia/navitia/source/tests/mock-kraken/empty_routing_test.cpp

tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.i"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/navitia/navitia/source/tests/mock-kraken/empty_routing_test.cpp > CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.i

tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.s"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/navitia/navitia/source/tests/mock-kraken/empty_routing_test.cpp -o CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.s

# Object files for target empty_routing_test
empty_routing_test_OBJECTS = \
"CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o"

# External object files for target empty_routing_test
empty_routing_test_EXTERNAL_OBJECTS =

tests/mock-kraken/empty_routing_test: tests/mock-kraken/CMakeFiles/empty_routing_test.dir/empty_routing_test.cpp.o
tests/mock-kraken/empty_routing_test: tests/mock-kraken/CMakeFiles/empty_routing_test.dir/build.make
tests/mock-kraken/empty_routing_test: kraken/libworkers.a
tests/mock-kraken/empty_routing_test: ed/libed.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_unit_test_framework.so
tests/mock-kraken/empty_routing_test: kraken/librt_handling.a
tests/mock-kraken/empty_routing_test: third_party/SimpleAmqpClient/libSimpleAmqpClient.a
tests/mock-kraken/empty_routing_test: third_party/librabbitmq-c/librabbitmq/librabbitmq.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libssl.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libcrypto.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
tests/mock-kraken/empty_routing_test: equipment/libequipment_api.a
tests/mock-kraken/empty_routing_test: disruption/libdisruption_api.a
tests/mock-kraken/empty_routing_test: calendar/libcalendar_api.a
tests/mock-kraken/empty_routing_test: time_tables/libtime_tables.a
tests/mock-kraken/empty_routing_test: third_party/prometheus-cpp/pull/libprometheus-cpp-pull.a
tests/mock-kraken/empty_routing_test: third_party/prometheus-cpp/core/libprometheus-cpp-core.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
tests/mock-kraken/empty_routing_test: type/libtypes.a
tests/mock-kraken/empty_routing_test: fare/libfare.a
tests/mock-kraken/empty_routing_test: kraken/libapply_disruption.a
tests/mock-kraken/empty_routing_test: routing/librouting.a
tests/mock-kraken/empty_routing_test: ptreferential/libptreferential.a
tests/mock-kraken/empty_routing_test: georef/libgeoref.a
tests/mock-kraken/empty_routing_test: type/libpb_converter.a
tests/mock-kraken/empty_routing_test: type/libdata.a
tests/mock-kraken/empty_routing_test: proximity_list/libproximitylist.a
tests/mock-kraken/empty_routing_test: vptranslator/libvptranslator.a
tests/mock-kraken/empty_routing_test: kraken/libfill_disruption_from_database.a
tests/mock-kraken/empty_routing_test: kraken/libmake_disruption_from_chaos.a
tests/mock-kraken/empty_routing_test: type/libtypes.a
tests/mock-kraken/empty_routing_test: fare/libfare.a
tests/mock-kraken/empty_routing_test: kraken/libapply_disruption.a
tests/mock-kraken/empty_routing_test: routing/librouting.a
tests/mock-kraken/empty_routing_test: ptreferential/libptreferential.a
tests/mock-kraken/empty_routing_test: georef/libgeoref.a
tests/mock-kraken/empty_routing_test: type/libpb_converter.a
tests/mock-kraken/empty_routing_test: type/libdata.a
tests/mock-kraken/empty_routing_test: proximity_list/libproximitylist.a
tests/mock-kraken/empty_routing_test: vptranslator/libvptranslator.a
tests/mock-kraken/empty_routing_test: kraken/libfill_disruption_from_database.a
tests/mock-kraken/empty_routing_test: kraken/libmake_disruption_from_chaos.a
tests/mock-kraken/empty_routing_test: autocomplete/libautocomplete.a
tests/mock-kraken/empty_routing_test: time_tables/libthermometer.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_system.so
tests/mock-kraken/empty_routing_test: utils/libutils.a
tests/mock-kraken/empty_routing_test: libconfig.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libpq.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libzmq.so
tests/mock-kraken/empty_routing_test: type/libpb_lib.a
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libpqxx.so
tests/mock-kraken/empty_routing_test: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
tests/mock-kraken/empty_routing_test: tests/mock-kraken/CMakeFiles/empty_routing_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable empty_routing_test"
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/empty_routing_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/mock-kraken/CMakeFiles/empty_routing_test.dir/build: tests/mock-kraken/empty_routing_test

.PHONY : tests/mock-kraken/CMakeFiles/empty_routing_test.dir/build

tests/mock-kraken/CMakeFiles/empty_routing_test.dir/clean:
	cd /home/runner/work/navitia/navitia/tests/mock-kraken && $(CMAKE_COMMAND) -P CMakeFiles/empty_routing_test.dir/cmake_clean.cmake
.PHONY : tests/mock-kraken/CMakeFiles/empty_routing_test.dir/clean

tests/mock-kraken/CMakeFiles/empty_routing_test.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/tests/mock-kraken /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/tests/mock-kraken /home/runner/work/navitia/navitia/tests/mock-kraken/CMakeFiles/empty_routing_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/mock-kraken/CMakeFiles/empty_routing_test.dir/depend

