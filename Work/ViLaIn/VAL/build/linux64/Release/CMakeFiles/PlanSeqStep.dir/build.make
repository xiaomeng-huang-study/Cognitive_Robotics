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
include CMakeFiles/PlanSeqStep.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/PlanSeqStep.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/PlanSeqStep.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PlanSeqStep.dir/flags.make

CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o: CMakeFiles/PlanSeqStep.dir/flags.make
CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o: ../../../applications/PlanSeqStep/src/main.cpp
CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o: CMakeFiles/PlanSeqStep.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o -MF CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o.d -o CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o -c /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanSeqStep/src/main.cpp

CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanSeqStep/src/main.cpp > CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.i

CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Cognitive_Robotics/Work/ViLaIn/VAL/applications/PlanSeqStep/src/main.cpp -o CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.s

# Object files for target PlanSeqStep
PlanSeqStep_OBJECTS = \
"CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o"

# External object files for target PlanSeqStep
PlanSeqStep_EXTERNAL_OBJECTS =

bin/PlanSeqStep: CMakeFiles/PlanSeqStep.dir/applications/PlanSeqStep/src/main.cpp.o
bin/PlanSeqStep: CMakeFiles/PlanSeqStep.dir/build.make
bin/PlanSeqStep: bin/libVAL.so
bin/PlanSeqStep: CMakeFiles/PlanSeqStep.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/PlanSeqStep"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PlanSeqStep.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PlanSeqStep.dir/build: bin/PlanSeqStep
.PHONY : CMakeFiles/PlanSeqStep.dir/build

CMakeFiles/PlanSeqStep.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PlanSeqStep.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PlanSeqStep.dir/clean

CMakeFiles/PlanSeqStep.dir/depend:
	cd /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release /root/Cognitive_Robotics/Work/ViLaIn/VAL/build/linux64/Release/CMakeFiles/PlanSeqStep.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PlanSeqStep.dir/depend

