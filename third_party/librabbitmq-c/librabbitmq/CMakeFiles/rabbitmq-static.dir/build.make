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
include third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/depend.make

# Include the progress variables for this target.
include third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_framing.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_framing.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_framing.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_framing.c > CMakeFiles/rabbitmq-static.dir/amqp_framing.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_framing.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_framing.c -o CMakeFiles/rabbitmq-static.dir/amqp_framing.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_api.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_api.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_api.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_api.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_api.c > CMakeFiles/rabbitmq-static.dir/amqp_api.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_api.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_api.c -o CMakeFiles/rabbitmq-static.dir/amqp_api.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_connection.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_connection.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_connection.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_connection.c > CMakeFiles/rabbitmq-static.dir/amqp_connection.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_connection.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_connection.c -o CMakeFiles/rabbitmq-static.dir/amqp_connection.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_mem.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_mem.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_mem.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_mem.c > CMakeFiles/rabbitmq-static.dir/amqp_mem.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_mem.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_mem.c -o CMakeFiles/rabbitmq-static.dir/amqp_mem.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_socket.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_socket.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_socket.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_socket.c > CMakeFiles/rabbitmq-static.dir/amqp_socket.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_socket.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_socket.c -o CMakeFiles/rabbitmq-static.dir/amqp_socket.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_table.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_table.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_table.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_table.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_table.c > CMakeFiles/rabbitmq-static.dir/amqp_table.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_table.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_table.c -o CMakeFiles/rabbitmq-static.dir/amqp_table.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_url.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_url.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_url.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_url.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_url.c > CMakeFiles/rabbitmq-static.dir/amqp_url.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_url.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_url.c -o CMakeFiles/rabbitmq-static.dir/amqp_url.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_tcp_socket.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_tcp_socket.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_tcp_socket.c > CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_tcp_socket.c -o CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_time.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_time.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_time.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_time.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_time.c > CMakeFiles/rabbitmq-static.dir/amqp_time.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_time.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_time.c -o CMakeFiles/rabbitmq-static.dir/amqp_time.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_consumer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_consumer.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_consumer.c > CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_consumer.c -o CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_openssl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl.c > CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl.c -o CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_hostname_validation.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_hostname_validation.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_hostname_validation.c > CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_hostname_validation.c -o CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_hostcheck.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_hostcheck.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_hostcheck.c > CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_hostcheck.c -o CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.s

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/flags.make
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o: source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_bio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o   -c /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_bio.c

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.i"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_bio.c > CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.i

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.s"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq/amqp_openssl_bio.c -o CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.s

# Object files for target rabbitmq-static
rabbitmq__static_OBJECTS = \
"CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_api.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_table.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_url.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_time.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o" \
"CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o"

# External object files for target rabbitmq-static
rabbitmq__static_EXTERNAL_OBJECTS =

third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_framing.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_api.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_connection.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_mem.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_socket.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_table.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_url.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_tcp_socket.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_time.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_consumer.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_hostname_validation.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_hostcheck.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/amqp_openssl_bio.c.o
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/build.make
third_party/librabbitmq-c/librabbitmq/librabbitmq.a: third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/runner/work/navitia/navitia/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking C static library librabbitmq.a"
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && $(CMAKE_COMMAND) -P CMakeFiles/rabbitmq-static.dir/cmake_clean_target.cmake
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rabbitmq-static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/build: third_party/librabbitmq-c/librabbitmq/librabbitmq.a

.PHONY : third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/build

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/clean:
	cd /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq && $(CMAKE_COMMAND) -P CMakeFiles/rabbitmq-static.dir/cmake_clean.cmake
.PHONY : third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/clean

third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/depend:
	cd /home/runner/work/navitia/navitia && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/navitia/navitia/source /home/runner/work/navitia/navitia/source/third_party/librabbitmq-c/librabbitmq /home/runner/work/navitia/navitia /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq /home/runner/work/navitia/navitia/third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : third_party/librabbitmq-c/librabbitmq/CMakeFiles/rabbitmq-static.dir/depend

