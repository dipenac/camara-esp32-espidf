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
CMAKE_SOURCE_DIR = /home/daniel/esp-idf/components/bootloader/subproject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader

# Utility rule file for size-files.

# Include the progress variables for this target.
include CMakeFiles/size-files.dir/progress.make

CMakeFiles/size-files: bootloader.map
	/usr/bin/cmake -D "IDF_SIZE_TOOL=/home/daniel/.espressif/python_env/idf5.1_py3.8_env/bin/python;/home/daniel/esp-idf/tools/idf_size.py" -D IDF_SIZE_MODE=--files -D MAP_FILE=/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader/bootloader.map -D OUTPUT_JSON= -P /home/daniel/esp-idf/tools/cmake/run_size_tool.cmake

size-files: CMakeFiles/size-files
size-files: CMakeFiles/size-files.dir/build.make

.PHONY : size-files

# Rule to build all files generated by this target.
CMakeFiles/size-files.dir/build: size-files

.PHONY : CMakeFiles/size-files.dir/build

CMakeFiles/size-files.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/size-files.dir/cmake_clean.cmake
.PHONY : CMakeFiles/size-files.dir/clean

CMakeFiles/size-files.dir/depend:
	cd /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/daniel/esp-idf/components/bootloader/subproject /home/daniel/esp-idf/components/bootloader/subproject /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader /home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/bootloader/CMakeFiles/size-files.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/size-files.dir/depend

