# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build

# Utility rule file for bootloader-flash.

# Include the progress variables for this target.
include esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/progress.make

esp-idf/bootloader/CMakeFiles/bootloader-flash:
	cd /home/daniel/esp-idf/components/bootloader && /usr/bin/cmake -D IDF_PATH=/home/daniel/esp-idf -D "SERIAL_TOOL=/home/daniel/.espressif/python_env/idf5.1_py3.8_env/bin/python;;/home/daniel/esp-idf/components/esptool_py/esptool/esptool.py;--chip;esp32" -D "SERIAL_TOOL_ARGS=--before=default_reset;--after=hard_reset;write_flash;@bootloader-flash_args" -D WORKING_DIRECTORY=/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build -P /home/daniel/esp-idf/components/esptool_py/run_serial_tool.cmake

bootloader-flash: esp-idf/bootloader/CMakeFiles/bootloader-flash
bootloader-flash: esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build.make

.PHONY : bootloader-flash

# Rule to build all files generated by this target.
esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build: bootloader-flash

.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/build

esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/clean:
	cd /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/esp-idf/bootloader && $(CMAKE_COMMAND) -P CMakeFiles/bootloader-flash.dir/cmake_clean.cmake
.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/clean

esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/depend:
	cd /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process /home/daniel/esp-idf/components/bootloader /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/esp-idf/bootloader /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/bootloader/CMakeFiles/bootloader-flash.dir/depend

