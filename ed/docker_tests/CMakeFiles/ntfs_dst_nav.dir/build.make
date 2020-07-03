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

# Utility rule file for ntfs_dst_nav.

# Include the progress variables for this target.
include ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/progress.make

ed/docker_tests/CMakeFiles/ntfs_dst_nav: ed/docker_tests/ntfs_dst_data.nav.lz4


ed/docker_tests/ntfs_dst_data.nav.lz4: ed/gtfs2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/osm2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/ed2nav
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/fusio2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/fare2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/geopal2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/poi2ed
ed/docker_tests/ntfs_dst_data.nav.lz4: ed/synonym2ed
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ntfs_dst_data.nav.lz4"
	cd /home/runner/work/navitia/navitia/source/type && python /home/runner/work/navitia/navitia/source/eitri/eitri.py --data-dir /home/runner/work/navitia/navitia/source/../fixtures/ed/ntfs_dst/ --output /home/runner/work/navitia/navitia/ed/docker_tests/ntfs_dst_data.nav.lz4 --ed-dir /home/runner/work/navitia/navitia/ed

ntfs_dst_nav: ed/docker_tests/CMakeFiles/ntfs_dst_nav
ntfs_dst_nav: ed/docker_tests/ntfs_dst_data.nav.lz4
ntfs_dst_nav: ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/build.make

.PHONY : ntfs_dst_nav

# Rule to build all files generated by this target.
ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/build: ntfs_dst_nav

.PHONY : ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/build

ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/clean:
	cd /home/runner/work/navitia/navitia/ed/docker_tests && $(CMAKE_COMMAND) -P CMakeFiles/ntfs_dst_nav.dir/cmake_clean.cmake
.PHONY : ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/clean

ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/ed/docker_tests /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/ed/docker_tests /home/runner/work/navitia/navitia/ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ed/docker_tests/CMakeFiles/ntfs_dst_nav.dir/depend

