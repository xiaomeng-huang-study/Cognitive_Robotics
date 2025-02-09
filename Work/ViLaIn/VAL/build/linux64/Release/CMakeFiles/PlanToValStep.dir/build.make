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

# Produce verbose output by default.
VERBOSE = 1

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
include CMakeFiles/PlanToValStep.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/PlanToValStep.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/PlanToValStep.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PlanToValStep.dir/flags.make

CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o: CMakeFiles/PlanToValStep.dir/flags.make
CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o: ../../../applications/PlanToValStep/src/main.cpp
CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o: CMakeFiles/PlanToValStep.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o -MF CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o.d -o CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o -c /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanToValStep/src/main.cpp

CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanToValStep/src/main.cpp > CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.i

CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanToValStep/src/main.cpp -o CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.s

# Object files for target PlanToValStep
PlanToValStep_OBJECTS = \
"CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o"

# External object files for target PlanToValStep
PlanToValStep_EXTERNAL_OBJECTS =

bin/PlanToValStep: CMakeFiles/PlanToValStep.dir/applications/PlanToValStep/src/main.cpp.o
bin/PlanToValStep: CMakeFiles/PlanToValStep.dir/build.make
bin/PlanToValStep: bin/libVAL.so
bin/PlanToValStep: CMakeFiles/PlanToValStep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/PlanToValStep"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PlanToValStep.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PlanToValStep.dir/build: bin/PlanToValStep
.PHONY : CMakeFiles/PlanToValStep.dir/build

CMakeFiles/PlanToValStep.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PlanToValStep.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PlanToValStep.dir/clean

CMakeFiles/PlanToValStep.dir/depend:
	cd /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles/PlanToValStep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PlanToValStep.dir/depend

