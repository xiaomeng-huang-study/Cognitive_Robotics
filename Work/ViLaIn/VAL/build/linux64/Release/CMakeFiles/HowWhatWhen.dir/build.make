# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/Cognitive_Robotics/Work/ViLaIn/VAL

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release

# Include any dependencies generated for this target.
include CMakeFiles/HowWhatWhen.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/HowWhatWhen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/HowWhatWhen.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/HowWhatWhen.dir/flags.make

CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o: CMakeFiles/HowWhatWhen.dir/flags.make
CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o: ../../../applications/HowWhatWhen/src/main.cpp
CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o: CMakeFiles/HowWhatWhen.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o -MF CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o.d -o CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o -c /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/HowWhatWhen/src/main.cpp

CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/HowWhatWhen/src/main.cpp > CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.i

CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/HowWhatWhen/src/main.cpp -o CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.s

# Object files for target HowWhatWhen
HowWhatWhen_OBJECTS = \
"CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o"

# External object files for target HowWhatWhen
HowWhatWhen_EXTERNAL_OBJECTS =

bin/HowWhatWhen: CMakeFiles/HowWhatWhen.dir/applications/HowWhatWhen/src/main.cpp.o
bin/HowWhatWhen: CMakeFiles/HowWhatWhen.dir/build.make
bin/HowWhatWhen: bin/libVAL.so
bin/HowWhatWhen: CMakeFiles/HowWhatWhen.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/HowWhatWhen"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HowWhatWhen.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/HowWhatWhen.dir/build: bin/HowWhatWhen
.PHONY : CMakeFiles/HowWhatWhen.dir/build

CMakeFiles/HowWhatWhen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/HowWhatWhen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/HowWhatWhen.dir/clean

CMakeFiles/HowWhatWhen.dir/depend:
	cd /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles/HowWhatWhen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/HowWhatWhen.dir/depend

