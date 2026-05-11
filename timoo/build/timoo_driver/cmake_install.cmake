# Install script for directory: /home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/timoo_driver" TYPE FILE FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/devel/include/timoo_driver/timooNodeConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/timoo_driver" TYPE FILE FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/devel/lib/python3/dist-packages/timoo_driver/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/devel/lib/python3/dist-packages/timoo_driver/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/timoo_driver" TYPE DIRECTORY FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/devel/lib/python3/dist-packages/timoo_driver/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/build/timoo_driver/catkin_generated/installspace/timoo_driver.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/timoo_driver/cmake" TYPE FILE FILES
    "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/build/timoo_driver/catkin_generated/installspace/timoo_driverConfig.cmake"
    "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/build/timoo_driver/catkin_generated/installspace/timoo_driverConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/timoo_driver" TYPE FILE FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/timoo_driver" TYPE DIRECTORY FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver/include/timoo_driver/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/timoo_driver" TYPE FILE FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver/nodelet_timoo.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/timoo_driver/launch" TYPE DIRECTORY FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/timoo_driver" TYPE PROGRAM FILES "/home/sf/Desktop/multi-sensor-slam-tookit/timoo/src/timoo_driver/src/vdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/sf/Desktop/multi-sensor-slam-tookit/timoo/build/timoo_driver/src/lib/cmake_install.cmake")
  include("/home/sf/Desktop/multi-sensor-slam-tookit/timoo/build/timoo_driver/src/driver/cmake_install.cmake")

endif()

